package Servlets;
import Entidades.Cuenta;
import Entidades.Usuario;
import Negocio.NegocioCuenta;
import Negocio.NegocioUsuario;
import NegocioImpl.NegocioCuentaImpl;
import NegocioImpl.NegocioUsuarioImpl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCuentas
 */
@WebServlet("/ServletCuentas")
public class ServletCuentas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCuentas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        
				// Listado inicial de cuentas desde index admin
				if (request.getParameter("Param") != null) {
					NegocioCuenta cuentta = new NegocioCuentaImpl();
					ArrayList<Cuenta> lista = cuentta.listarCuentas();
					request.setAttribute("listaC", lista);

					RequestDispatcher rd = request.getRequestDispatcher("/listarcuentas.jsp");
					rd.forward(request, response);
				}
				
				// Listado inicial de cuentas DADAS DE BAJA desde index admin
				
				if (request.getParameter("params") != null) {
					NegocioCuenta cuentta = new NegocioCuentaImpl();
					ArrayList<Cuenta> lista = cuentta.listarCuentasBaja();
					request.setAttribute("listaC", lista);

					RequestDispatcher rd = request.getRequestDispatcher("/listarcuentasbaja.jsp");
					rd.forward(request, response);
				}
				
				// recuperar cuenta
				  if (request.getParameter("cuentarecuperar") != null) {

						Cuenta cuenta = new Cuenta();
						cuenta.setNro_Cuenta(Integer.parseInt(request.getParameter("cuentarecuperar")));
						NegocioCuenta cuentta = new NegocioCuentaImpl();

						if (cuentta.RecuperarCuenta(cuenta) == true) {
							request.setAttribute("log", "a");
							ArrayList<Cuenta> lista = cuentta.listarCuentasBaja();
							request.setAttribute("listaC", lista);

							RequestDispatcher rd = request.getRequestDispatcher("/listarcuentasbaja.jsp");
							rd.forward(request, response);

						}

						else {

							RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
							rd.forward(request, response);

						}

					}
				
		        //eliminar cuenta
		        if (request.getParameter("cuentaeliminar") != null) {

					Cuenta cuenta = new Cuenta();
					cuenta.setNro_Cuenta(Integer.parseInt(request.getParameter("cuentaeliminar")));
					NegocioCuenta cuentta = new NegocioCuentaImpl();

					if (cuentta.EliminarCuenta(cuenta) == true) {
						request.setAttribute("log", "a");
						ArrayList<Cuenta> lista = cuentta.listarCuentas();
						request.setAttribute("listaC", lista);

						RequestDispatcher rd = request.getRequestDispatcher("/listarcuentas.jsp");
						rd.forward(request, response);

					}

					else {

						RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
						rd.forward(request, response);

					}

				}
		        
		     // SECTOR CLIENTES //
                // busco las cuentas del cliente logueado //
                if(request.getParameter("cuenta") != null) {

                    Cuenta cuentaUser = new Cuenta();
                    NegocioUsuarioImpl user = new NegocioUsuarioImpl();

                    // con el nombre de usuario voy a buscar el usuario completo //

                    Usuario userSession = new Usuario();
                    userSession = (Usuario) request.getSession().getAttribute("userconect");
                    Usuario u = user.BuscarUsuario(userSession);

                // cargo las cuentas del usuario logueado 
                NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
                ArrayList<Cuenta> listaDeCuenta = usercuenta.listarCuentasUsuario(u);
                request.setAttribute("listaCuentas", listaDeCuenta); 

                RequestDispatcher rd = request.getRequestDispatcher("transferencias.jsp");
                rd.forward(request, response);

                }

            // FIN SECTOR CLIENTES //
             
                // redirect al agregar cuenta

                if (request.getParameter("agregar") != null) {
                    int numero = 0;
                    NegocioCuentaImpl proximo = new NegocioCuentaImpl();
                    numero = proximo.proximo();

                    request.setAttribute("id", numero);
                    	
                    RequestDispatcher rd = request.getRequestDispatcher("/index_admin_Agregar_cuenta.jsp");
                    rd.forward(request, response);
                }
                
             // boton asignarr cuenta
        		if (request.getParameter("btnasignar") != null) {
        			try {

        				int filas = 0;
        				NegocioCuentaImpl user = new NegocioCuentaImpl();

        				Cuenta cuenta = new Cuenta();

        				int cantidad = user.cantidadcuentas(Integer.parseInt(request.getParameter("nombreUsuario")));

        				if (cantidad < 3) {
        					cuenta.setDni(request.getParameter("nombreUsuario"));
        					cuenta.setTipo_Cuenta(Integer.parseInt(request.getParameter("grupo1")));
        					cuenta.setNro_Cuenta(Integer.parseInt(request.getParameter("nrocuenta")));
        					cuenta.setCBU_Cuenta(request.getParameter("CBU"));
        					filas = user.agregarcuenta(cuenta);
        				
        					request.setAttribute("filasC", filas);
        				}

        				int numero = 0;
        				numero = user.proximo();
        				request.setAttribute("id", numero);

        				RequestDispatcher rd = request.getRequestDispatcher("index_admin_Agregar_cuenta.jsp");
        				rd.forward(request, response);
        			} catch (NumberFormatException nfe) {
        				nfe.printStackTrace();
        			}
        		}

        		if (request.getParameter("modificar") != null) {
        			RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_cuenta.jsp");
        			rd.forward(request, response);
        		}
        		// Modificar - Buscar cuenta
        		if (request.getParameter("modificar.buscar") != null) {
        			try {
        				int nroCuenta = Integer.parseInt(request.getParameter("Nrodecuenta"));
        				int filas = 0;
        				NegocioCuenta cuenta = new NegocioCuentaImpl();
        				Cuenta encontrada = cuenta.BuscarCuenta(nroCuenta);
        				if (encontrada != null) {
        					request.setAttribute("cuenta", encontrada);
        					RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_cuenta_encontrada.jsp");
        					rd.forward(request, response);
        				} else {
        					request.setAttribute("filasMC", filas);
        					RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_cuenta.jsp");
        					rd.forward(request, response);
        				}
        			} catch (NumberFormatException e) {
        				// TODO: mostrar error
        			} catch (Exception e) {
        				// TODO: mostrar error
        			}

        		}
        		// Modificar - Guardar cambios
        		if (request.getParameter("modificar.guardar_cambios") != null) {

        			try {
        				int filas = 0;
        				Cuenta ncuenta = new Cuenta();
        				NegocioCuenta cuenta = new NegocioCuentaImpl();

        				ncuenta.setSaldo_Cuenta(Float.parseFloat(request.getParameter("saldo")));
        				// ncuenta.setTipo_Cuenta(Integer.parseInt(request.getParameter("grupo1"))) ;
        				ncuenta.setNro_Cuenta(Integer.parseInt(request.getParameter("numero")));

        				// Modifique esto (por las dudas)
        				if (cuenta.modificarcuenta(ncuenta)) {
        					filas = 1;
        					request.setAttribute("filasMCC", filas);
        					RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_cuenta.jsp");
        					rd.forward(request, response);
        				}

        			} catch (NumberFormatException e) {
        				// TODO: mostrar error
        			} catch (Exception e) {
        				// TODO: mostrar error
        			}

        		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
