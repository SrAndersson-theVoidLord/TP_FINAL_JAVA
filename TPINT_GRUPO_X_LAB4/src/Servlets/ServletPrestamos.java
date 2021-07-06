package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import Entidades.Cuenta;
import Entidades.Movimientos;
import Entidades.Prestamo;
import Entidades.Usuario;
import Negocio.NegocioCuenta;
import Negocio.NegocioPrestamo;
import Negocio.NegocioUsuario;
import NegocioImpl.NegocioCuentaImpl;
import NegocioImpl.NegocioMovimientosImpl;
import NegocioImpl.NegocioPrestamoImpl;
import NegocioImpl.NegocioUsuarioImpl;


/**
 * Servlet implementation class ServletPrestamos
 */
@WebServlet("/ServletPrestamos")
public class ServletPrestamos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPrestamos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		// primera carga de la página
		 if (request.getParameter("reporte") != null) {
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				request.setAttribute("mensual", rep.IngresoMensual());
				request.setAttribute("anual", rep.IngresoAnual());
				request.setAttribute("total", rep.IngresoTotal());
	            RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
	            rd.forward(request, response);
	        }
		 
		 
			// primer carga de la parte autorizar reportes
		 if (request.getParameter("autorizarprestamo") != null) {
			 
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				ArrayList<Prestamo> lista = rep.ListarPrestamosAutorizar();
				request.setAttribute("listaP", lista);
	            RequestDispatcher rd = request.getRequestDispatcher("/autorizarprestamo.jsp");
	            rd.forward(request, response);
	        }
		 
		 // Autorizar Prestamo (prestamoautorizar)
		 
		 if (request.getParameter("prestamoautorizar") != null) {
			 
			 	Prestamo prest = new Prestamo();
			 	int autorizar = Integer.parseInt(request.getParameter("prestamoautorizar"));
				prest.setNro_Prestamo(autorizar);
				Cuenta cuenta = new Cuenta();
				NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
				float monto = 0;
				 if (request.getParameter("cash") != null) { 
		
				monto = Float.parseFloat(request.getParameter("cash"));
				}

				NegocioPrestamo rep = new NegocioPrestamoImpl();
			int CuentaBuscar = 0;
			if(request.getParameter("cuenta")!=null) {
				CuentaBuscar = Integer.parseInt(request.getParameter("cuenta"));
			}
				
				if (rep.AprobarPestamo(prest) == true) {

					request.setAttribute("logautorizar", "a");
					ArrayList<Prestamo> lista = rep.ListarPrestamosAutorizar();
					request.setAttribute("listaP", lista);
					System.out.println(autorizar);
					cuenta = usercuenta.BuscarCuentaNroCuenta(CuentaBuscar);
					System.out.println(cuenta);
					cuenta.setSaldo_Cuenta(cuenta.getSaldo_Cuenta() + monto );
					usercuenta.actualizarSaldoCuenta(cuenta);
					
		            RequestDispatcher rd = request.getRequestDispatcher("/autorizarprestamo.jsp");
		            rd.forward(request, response);
				}

				else {

					RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
					rd.forward(request, response);

				}

			}
		 
		 // Rechazar Prestamo (prestamorechazar)
		 if (request.getParameter("prestamorechazar") != null) {
			 
			 	Prestamo prest = new Prestamo();
			 	int borrar = Integer.parseInt(request.getParameter("prestamorechazar"));
				prest.setNro_Prestamo(borrar);
				
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				

				
				if (rep.RechazarPestamo(prest) == true) {

					request.setAttribute("logrechazo", "a");
					ArrayList<Prestamo> lista = rep.ListarPrestamosAutorizar();
					request.setAttribute("listaP", lista);
					
		            RequestDispatcher rd = request.getRequestDispatcher("/autorizarprestamo.jsp");
		            rd.forward(request, response);
				}

				else {

					RequestDispatcher rd = request.getRequestDispatcher("/ErrorInesperadoAdmin.jsp");
					rd.forward(request, response);

				}

			}
		 
		 // importe mes
		 if (request.getParameter("mes") != null) {
			 
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				ArrayList<Prestamo> lista = rep.ListarPrestamosMes();
				request.setAttribute("listaP", lista);
				request.setAttribute("mensual", rep.IngresoMensual());
				request.setAttribute("anual", rep.IngresoAnual());
				request.setAttribute("total", rep.IngresoTotal());
				RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
				rd.forward(request, response);
		 
		 }
		 
		 //importe anual
		 if (request.getParameter("anual") != null) {
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				ArrayList<Prestamo> lista = rep.ListarPrestamosAnual();
				request.setAttribute("listaP", lista);
				request.setAttribute("mensual", rep.IngresoMensual());
				request.setAttribute("anual", rep.IngresoAnual());
				request.setAttribute("total", rep.IngresoTotal());
				RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
				rd.forward(request, response);
			 
			 
		 }
		 
		 //importe total
		 if (request.getParameter("total") != null) {
			 
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				ArrayList<Prestamo> lista = rep.ListarPrestamosTotal();
				request.setAttribute("listaP", lista);
				request.setAttribute("mensual", rep.IngresoMensual());
				request.setAttribute("anual", rep.IngresoAnual());
				request.setAttribute("total", rep.IngresoTotal());
				RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
				rd.forward(request, response);
			 
		 }
		
		 //prestamo entre fechas
		 if (request.getParameter("mesa") != null) {
			
				int mes1 = Integer.parseInt(request.getParameter("mesa"));
				int anio1 = Integer.parseInt(request.getParameter("anio1"));
				int mes2 = Integer.parseInt(request.getParameter("mes2"));
				int anio2 = Integer.parseInt(request.getParameter("anio2"));
				
				
			 if(mes1 == 0 || mes2 == 0 || anio1 == 0 || anio2 == 0) {
					request.setAttribute("error", "a");
				 	RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
				
					rd.forward(request, response);
			 }
			 
			 
				NegocioPrestamo rep = new NegocioPrestamoImpl();
				
				ArrayList<Prestamo> lista = rep.ListarPrestamosEntreFechas(mes1,anio1,mes2,anio2);
				request.setAttribute("listaP", lista);
				request.setAttribute("mensual", rep.IngresoMensual());
				request.setAttribute("anual", rep.IngresoAnual());
				request.setAttribute("total", rep.IngresoTotal());
				RequestDispatcher rd = request.getRequestDispatcher("/ReportePrestamo.jsp");
				rd.forward(request, response);
			 
		 }
		 
		// INICIO SECTOR CLIENTE //
			
			// SECTOR SOLICITAR PRESTAMOS //
			
			// carga las cuentas del usuario para poder visualizarlas // 
			if(request.getParameter("cuentas") != null) {
				
				Cuenta cuentaUser = new Cuenta();
				Usuario u = new Usuario();
				NegocioUsuarioImpl user = new NegocioUsuarioImpl();
				
				// con el nombre de usuario voy a buscar el usuario completo //
				
				Usuario userSession = new Usuario();
				userSession = (Usuario) request.getSession().getAttribute("userconect");
				u = user.BuscarUsuario(userSession);
			
			// cargo las cuentas del usuario logueado 
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			ArrayList<Cuenta> listaDeCuenta = usercuenta.listarCuentasUsuario(u);
			request.setAttribute("listaCuentas", listaDeCuenta); 
			RequestDispatcher rd = request.getRequestDispatcher("solicitarprestamo.jsp");
			rd.forward(request, response);
				
				
			}
			
			// solicita el prestamo //
			if(request.getParameter("btnSolicitar") != null) {
				
				if(request.getParameter("montoSolic") == "")
				{
					RequestDispatcher rd = request.getRequestDispatcher("PrestamoMontoInvalido.jsp");
					rd.forward(request, response);
				}
				Float montoSolic = Float.parseFloat(request.getParameter("montoSolic"));
				if(montoSolic <= 0)
				{
					RequestDispatcher rd = request.getRequestDispatcher("PrestamoMontoInvalido.jsp");
					rd.forward(request, response);
				}
				else
				{
				Prestamo prestamo = new Prestamo();
				NegocioPrestamoImpl solicitud = new NegocioPrestamoImpl();
				
				/*Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes*/
				
				/*try {
					String numcuenta = request.getParameter("montoSolic");
					int ncuenta = Integer.parseInt(numcuenta);
					prestamo.setNroCuenta(ncuenta);
				}
				catch(NumberFormatException npe) {npe.printStackTrace();}*/
				// NRO CUENTA //
				prestamo.setNro_Cuenta(Integer.parseInt( request.getParameter("numCuenta")));
				// MONTO SOLICITADO //
				// Convierto String a Double
				prestamo.setImporte_Prestamo(Float.parseFloat(request.getParameter("montoSolic")));
				
				// MONTO FINAL A PAGAR //
		        // Convierto String a Double
				prestamo.setImporte_Total_Pagar(Float.parseFloat(request.getParameter("montoSolic"))*2);
				System.out.println(prestamo.getImporte_Total_Pagar());
				
				
				// CUOTAS SOLICITADAS //
				int cuotas = Integer.parseInt(request.getParameter("cuotasSolic"));
				prestamo.setPlazo_Meses(cuotas);
				
				// MONTO A PAGAR POR CUOTA //
				prestamo.setMonto_Mensual((Float.parseFloat(request.getParameter("montoSolic"))*2)/cuotas);

				// MONTO FINAL A PAGAR //
				prestamo.setSaldo_Restante(Float.parseFloat(request.getParameter("montoSolic"))*2);
				
				// CUOTAS RESTANTAS --> TODAS  //
				prestamo.setCuotas_Restantes(cuotas);
				
				// INSERT SOLICITUD //
				solicitud.insert(prestamo);
				
				// traer el ultimo numero de prestamo y enviarlo a prestamo confirmado //
				int ultimo_prestamo = solicitud.TraerUltimoNroPrestamo();
				request.setAttribute("nroprestamo", ultimo_prestamo); 
				RequestDispatcher rd = request.getRequestDispatcher("prestamoconfirmado.jsp");
				rd.forward(request, response);
				}
			}
			
			// SECTOR PAGAR PRESTAMOS //
			if(request.getParameter("listar") != null) {
				
						
				Usuario u = new Usuario();
				NegocioUsuarioImpl user = new NegocioUsuarioImpl();
				
				// con el nombre de usuario voy a buscar el usuario completo //
				Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
				u = user.BuscarUsuario(userSession);

			// cargo los prestamos del usuario logueado //	
			NegocioPrestamoImpl np = new NegocioPrestamoImpl();
			ArrayList<Prestamo> listaDePrestamos = np.listarPrestamosPorUsuario(u);
			request.setAttribute("listaPrestamos", listaDePrestamos); 

			// cargo la lista de cuentas disponibles para debitar el prestamo //
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			ArrayList<Cuenta> listaDeCuenta = usercuenta.listarCuentasUsuario(u);
			request.setAttribute("listaCuentas", listaDeCuenta); 
			
			RequestDispatcher rd = request.getRequestDispatcher("pagarprestamo.jsp");
			rd.forward(request, response);
				
				
				
			}
			
			// RECIBO LOS DATOS DE PAGO DEL PRESTAMO //
			
			
			if(request.getParameter("btnPagarPrestamo") != null) {
				
					// asigno valores a las variables // 
					// cuenta debito, cuota mensual, cuotas restantes , numero de prestamo //
					
					int cuentaDebito = Integer.parseInt(request.getParameter("cuentaDesc"));
					Float cuotaMensual = Float.parseFloat(request.getParameter("cuotaMensual"));
					int cuotasRestantes = Integer.parseInt(request.getParameter("cuotasRest"))-1;
					float saldoRestante = Float.parseFloat(request.getParameter("SaldoRest"));
					int nroPrestamo = Integer.parseInt(request.getParameter("numPrest"));
					String cuota_a_pagar = request.getParameter("cuota_a_pagar");
					String S_nroPrestamo = 	request.getParameter("numPrest");
					
							
					// fin variables //
				
				// ACTUALIZACION DE LA CUENTA QUE PAGA EL PRESTAMO //
				Cuenta cuenta = new Cuenta();
				Cuenta cuentaNueva = new Cuenta();
				NegocioCuentaImpl negocioCuenta = new NegocioCuentaImpl();
			
				// actualiza el saldo de la cuenta // 
				
				cuenta.setNro_Cuenta(cuentaDebito);
				// busco la cuenta completa por nro de cuenta // 
				cuenta = negocioCuenta.BuscarCuentaNroCuenta(cuentaDebito);
				
				
				Float nuevoSaldo = cuenta.getSaldo_Cuenta() - cuotaMensual;
			
				if(nuevoSaldo >= 0 ) {
					// actualizo la cuenta //
					cuentaNueva.setNro_Cuenta(cuentaDebito);
					cuentaNueva.setSaldo_Cuenta(nuevoSaldo);
					negocioCuenta.actualizarSaldoCuenta(cuentaNueva);
					
					// INSERTAR NUEVO MOVIMIENTO // 
					
					Movimientos nuevoMovi = new Movimientos();
					NegocioMovimientosImpl negocioMovi = new NegocioMovimientosImpl();
					
					nuevoMovi.setNumCuentaMov(cuentaDebito);
					nuevoMovi.setTipoMovimiento(3);
					nuevoMovi.setImporte(cuotaMensual);
					nuevoMovi.setMensaje("Pago de cuota " +cuota_a_pagar+" del prestamo nro: "+S_nroPrestamo);
					int insertmovimiento = negocioMovi.insert(nuevoMovi);
					
					
					
					// ACTUALIZACION DEL NRO DE PRESTAMO - CUOTAS REST Y SALDO REST //
					
					
					Prestamo prestamo = new Prestamo();
					NegocioPrestamoImpl solicitud = new NegocioPrestamoImpl();
					prestamo.setNro_Prestamo(nroPrestamo);
					prestamo.setSaldo_Restante(saldoRestante-cuotaMensual);
					prestamo.setCuotas_Restantes(cuotasRestantes);
					
					
					if(solicitud.actualizarPrestamo(prestamo)==true) {
						
						int nroMovimiento = negocioMovi.TraerUltimoNroMovimiento();
						request.setAttribute("nromovimiento", nroMovimiento); 
						
						if(cuotasRestantes==0) {
							// si no le quedan cuotas por pagar doy de baja el prestamo//
							prestamo.setEstado_Prestamo(false);
							solicitud.darBajaPrestamo(prestamo);
						}
						RequestDispatcher rd = request.getRequestDispatcher("pagoconfirmado.jsp");
						rd.forward(request, response);
						
					}
						
					
				}
				
				else {
					
					// la cuenta no tiene saldo redirigir a pantalla pagar prestamos //
					RequestDispatcher rd = request.getRequestDispatcher("saldoinsuficiente.jsp");
					rd.forward(request, response);
				}
				
				
				
				
			}
			
			// FIN SECTOR CLIENTE //
	
	
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


}
}