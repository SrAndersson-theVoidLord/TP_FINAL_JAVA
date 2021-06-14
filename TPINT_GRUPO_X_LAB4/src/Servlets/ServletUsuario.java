package Servlets;

import java.io.Console;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Pattern;

import Negocio.NegocioCuenta;
import Negocio.NegocioUsuario;
import NegocioImpl.NegocioCuentaImpl;
import NegocioImpl.NegocioMovimientosImpl;
import NegocioImpl.NegocioUsuarioImpl;
import Entidades.Cuenta;
import Entidades.Movimientos;
import Entidades.Usuario;



/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		


		// boton aceptar agregar usuario
		if (request.getParameter("btnRegistrar") != null) {
			int filas = 0;
				// SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
				Date date1 = null;
				try {
					date1 = new SimpleDateFormat("MM-dd-yyyy").parse(request.getParameter("fechanacUser"));
				
					System.out.println(date1);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					NegocioUsuarioImpl user = new NegocioUsuarioImpl();
					Usuario usuario = new Usuario();
					usuario.setNombre(request.getParameter("nombreUser"));
					usuario.setApellido(request.getParameter("apellidoUser"));
					usuario.setUsuario(request.getParameter("usuarioUser"));
					usuario.setDireccion(request.getParameter("direccionUser"));
					usuario.setLocalidad(request.getParameter("localidad"));
					usuario.setProvincia(request.getParameter("provincia"));
					usuario.setDni(request.getParameter("dniUser"));
					usuario.setCuil(request.getParameter("cuilUser"));
					usuario.setNacionalidad(request.getParameter("nacionalidadUser"));
					usuario.setTelefono(request.getParameter("telefonoUser"));
					usuario.setFecha_nac(date1);
					usuario.setSexo(request.getParameter("sexoUser"));
					usuario.setMail(request.getParameter("emailUser"));
					usuario.setContrasenia(request.getParameter("contraseniaUser"));
					filas = user.agregarUsuario(usuario);
				
					request.setAttribute("filas", filas);

					RequestDispatcher rd = request.getRequestDispatcher("CrearUsuario.jsp");
					rd.forward(request, response);

				}

				catch (NumberFormatException nfe) {

					nfe.printStackTrace();

				}
		}

		// Login de usuario // // verifica si es admin o cliente tambien //
				int ingreso = 0; // 0 no lo encontro | -2 dos campos vacios | -1 usuario vacio | -3 contra vacia
				boolean ingresa = true;
				
				if (request.getParameter("btnIngresar") != null) {
					
					if(request.getParameter("usuario") == "" || request.getParameter("contrasenia") == "" ) {
					
						RequestDispatcher rd = request.getRequestDispatcher("camposv.jsp");
						rd.forward(request, response);
					}
					
								// si no hay ningun campo vacio se procede a buscar en la BD
								if(ingresa==true){
									
									if(request.getParameter("usuario") != "" && request.getParameter("contrasenia") != "" ){
										
										Usuario usuario = new Usuario();
										NegocioUsuarioImpl user = new NegocioUsuarioImpl();
										
										usuario.setUsuario(request.getParameter("usuario"));
										usuario.setContrasenia(request.getParameter("contrasenia"));
										
										if(user.existeUsuarioContraAdmin(usuario) == true) 
										{
											// se logueo un admin
											
											request.setAttribute("admin",1);
						
											request.getSession().setAttribute("userconect", usuario);
									
											request.setAttribute("uc", usuario);
											RequestDispatcher rd = request.getRequestDispatcher("index_admin.jsp");
									
											rd.forward(request, response);
											
										}
										
										else if(user.existeUsuarioContraCliente(usuario) == true) 
										{
										
											// se loguea un cliente
											request.getSession().setAttribute("userconect", usuario);
											
											// le paso los datos de la primer cuenta que le figura//
											Cuenta cuentauno = new Cuenta();
											NegocioCuenta usercuenta = new NegocioCuentaImpl();
											
											// con el nombre de usuario voy a buscar el usuario completo //
											// y con el usuario completo busco su primer cuenta //
											Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
								
											usuario = user.BuscarUsuario(userSession);
									
									
											
											cuentauno = usercuenta.BuscarCuentaM(usuario,1);
											
										
											
											// si la cuenta viene en null le paso datos en cero
												if(cuentauno.getDni() == null && cuentauno.getCBU_Cuenta() == null) {
												
												cuentauno.setSaldo_Cuenta(0000);;
												cuentauno.setCBU_Cuenta("0000");
												cuentauno.setNro_Cuenta(0000);
											}
												// Guardo el numero de cuenta en una variable session para luego usarla
												request.getSession().setAttribute("cuentauser", cuentauno);
											
											
											// cargo los movimientos de la cuenta 1 
											NegocioMovimientosImpl movi = new NegocioMovimientosImpl();
											ArrayList<Movimientos> listaMovimientos = movi.listarMovimientosPorCuenta(cuentauno);
											request.setAttribute("listaMov", listaMovimientos);
										
											// cargo la cuenta uno para usar en el front
											request.setAttribute("cuentauno", cuentauno);

											RequestDispatcher rd = request.getRequestDispatcher("iniciousuario.jsp");
											rd.forward(request, response);
											
									
											
										}
										
										else 
										{
											// usuario y/o contraseña incorrectas
											
											RequestDispatcher rd = request.getRequestDispatcher("errordeingreso.jsp");
											rd.forward(request, response);
										}
										
								}
									
									
								}
										
				} // fin btn ingresar != null
				
				// traer el perfil completo del usuario //
		        if(request.getParameter("perfil") != null) {


		            Usuario usuario = new Usuario();
		            NegocioUsuarioImpl user = new NegocioUsuarioImpl();
		            // agarro el usuario y contraseña que tiene el session de usuario // 
		            Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
		            // busco el usuario completo // 
		            usuario = user.BuscarUsuario(userSession);

		            // vuelvo a setear el session de usuario con todos los campos //
		            request.getSession().setAttribute("userconect", usuario);
		            RequestDispatcher rd = request.getRequestDispatcher("perfilusuario.jsp");
		            rd.forward(request, response);

		        }
		        if(request.getParameter("perfil2") != null) {


		            Usuario usuario = new Usuario();
		            NegocioUsuarioImpl user = new NegocioUsuarioImpl();
		            // agarro el usuario y contraseña que tiene el session de usuario // 
		            Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
		            // busco el usuario completo // 
		            usuario = user.BuscarUsuario(userSession);

		            // vuelvo a setear el session de usuario con todos los campos //
		            request.getSession().setAttribute("userconect", usuario);
		            RequestDispatcher rd = request.getRequestDispatcher("perfiladmin.jsp");
		            rd.forward(request, response);

		        }

		// Listado inicial de CLIENTES desde index admin
		if (request.getParameter("Param") != null) {
			NegocioUsuarioImpl user = new NegocioUsuarioImpl();
			ArrayList<Usuario> lista = user.listarUsuarios();
			request.setAttribute("listaU", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/listadoClientes.jsp");
			rd.forward(request, response);
		}

		// Listado inicial de CLIENTES DADOS DE BAJA desde index admin

		if (request.getParameter("crazy") != null) {
			NegocioUsuarioImpl user = new NegocioUsuarioImpl();
			ArrayList<Usuario> lista = user.listarUsuariosBaja();
			request.setAttribute("listaU", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/listadoClientesBaja.jsp");
			rd.forward(request, response);
		}

		// Accion recuperar cliente dado de baja

		if (request.getParameter("rec") != null) {

			Usuario usuario = new Usuario();
			usuario.setDni(request.getParameter("rec"));
			NegocioUsuario usert = new NegocioUsuarioImpl();
			
			if(usert.RecuperarUsuario(usuario)==true) {
			request.setAttribute("log", "a");
			ArrayList<Usuario> lista = usert.listarUsuariosBaja();
			request.setAttribute("listaU", lista);

			RequestDispatcher rd = request.getRequestDispatcher("/listadoClientesBaja.jsp");
			rd.forward(request, response);
			}
			else {

				RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
				rd.forward(request, response);

			}
		}
		
		// Accion eliminar Cliente
		if (request.getParameter("Dni") != null) {

			Usuario usuario = new Usuario();
			usuario.setDni(request.getParameter("Dni"));
			NegocioUsuario usert = new NegocioUsuarioImpl();

			if (usert.ElminarUsuario(usuario) == true) {

				request.setAttribute("log", "a");
				ArrayList<Usuario> lista = usert.listarUsuarios();
				request.setAttribute("listaU", lista);

				RequestDispatcher rd = request.getRequestDispatcher("/listadoClientes.jsp");
				rd.forward(request, response);

			}

			else {

				RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
				rd.forward(request, response);

			}

		}
		// cerrar session // 
        if(request.getParameter("cerrarSession") != null) {
            Usuario us = new Usuario();
            us.setUsuario("usuario");
               us.setContrasenia("");
               // se loguea un cliente
               request.getSession().setAttribute("userconect", us);
               RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
               rd.forward(request, response);

        }
		// Modificar user carga
        if (request.getParameter("modificar") != null) {
            RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_usuario.jsp");
            rd.forward(request, response);
        }
        
     // Modificar - Buscar user
        if (request.getParameter("modificar.buscar.cliente") != null) {
            try {
                int filas = 0;
                int nrodni = Integer.parseInt(request.getParameter("nrodni"));
                NegocioUsuario user = new NegocioUsuarioImpl();
                Usuario encontrada = user.buscardni(nrodni);
                if (encontrada != null) {
                    request.setAttribute("usuario", encontrada);
                    RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_usuario_encontrado.jsp");
                    rd.forward(request, response);
                } else {
                    filas = 1;
                    request.setAttribute("filasMU", filas);
                    RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_usuario.jsp");
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

                Usuario ncuenta = new Usuario();
                NegocioUsuario user = new NegocioUsuarioImpl();
                int filas = 0;
                ncuenta.setContrasenia((String) request.getParameter("pass"));
                // ncuenta.setTipo_Cuenta(Integer.parseInt(request.getParameter("grupo1"))) ;
                ncuenta.setDni((String) request.getParameter("numero"));

                if (user.modificarpass(ncuenta)) {
                    filas = 1;
                    request.setAttribute("filasMCM", filas);
                    RequestDispatcher rd = request.getRequestDispatcher("/index_admin_modificar_usuario.jsp");
                    rd.forward(request, response);
                }

            } catch (NumberFormatException e) {
                // TODO: mostrar error
            } catch (Exception e) {
                // TODO: mostrar error
            }

        }
        
	} // fin doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
