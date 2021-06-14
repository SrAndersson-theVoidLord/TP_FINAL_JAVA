package Servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Cuenta;
import Entidades.Movimientos;
import Entidades.Usuario;
import NegocioImpl.NegocioCuentaImpl;
import NegocioImpl.NegocioMovimientosImpl;
import NegocioImpl.NegocioUsuarioImpl;

/**
 * Servlet implementation class ServletMovimientos
 */
@WebServlet("/ServletMovimientos")
public class ServletMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMovimientos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// carga una lista con los movimientos de la cuenta 1 //
		if(request.getParameter("cuentauno") != null) {
			
			
			Cuenta cuentauno = new Cuenta();
			Usuario u = new Usuario();
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			NegocioUsuarioImpl user = new NegocioUsuarioImpl();
			
			// con el nombre de usuario voy a buscar el usuario completo //
			// y con el usuario completo busco su primer cuenta //
			Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
			u = user.BuscarUsuario(userSession);
			cuentauno = usercuenta.BuscarCuentaM(u,1);
			// si la cuenta viene en null le paso datos en cero

			if(cuentauno.getDni() == null && cuentauno.getCBU_Cuenta() == null) {

				cuentauno.setSaldo_Cuenta(0000);
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
		
		// carga una lista con los movimientos de la cuenta 2 //
		if(request.getParameter("cuentados") != null) {
			
			Cuenta cuentados = new Cuenta();
			Usuario u = new Usuario();
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			NegocioUsuarioImpl user = new NegocioUsuarioImpl();
			
			// con el nombre de usuario voy a buscar el usuario completo //
			// y con el usuario completo busco su primer cuenta //
			Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
			u = user.BuscarUsuario(userSession);
			cuentados = usercuenta.BuscarCuentaM(u,2);
			// si la cuenta viene en null le paso datos en cero
			if(cuentados.getDni() == null && cuentados.getCBU_Cuenta() == null) {
			
				cuentados.setSaldo_Cuenta(0000);
				cuentados.setCBU_Cuenta("0000");
				cuentados.setNro_Cuenta(0000);
			}
			
				// Guardo el numero de cuenta en una variable session para luego usarla
				request.getSession().setAttribute("cuentauser", cuentados);
			
			
		NegocioMovimientosImpl movi = new NegocioMovimientosImpl();
		ArrayList<Movimientos> listaMovimientos = movi.listarMovimientosPorCuenta(cuentados);
		request.setAttribute("listaMov", listaMovimientos);
		
		// cargo la cuenta uno para usar en el front
		request.setAttribute("cuentauno", cuentados);
		
		RequestDispatcher rd = request.getRequestDispatcher("iniciousuario.jsp");
		rd.forward(request, response);
			
		}
	
		

		// carga una lista con los movimientos de la cuenta 3 //
		if(request.getParameter("cuentatres") != null) {
			
			Cuenta cuentatres = new Cuenta();
			Usuario u = new Usuario();
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			NegocioUsuarioImpl user = new NegocioUsuarioImpl();
			
			// con el nombre de usuario voy a buscar el usuario completo //
			// y con el usuario completo busco su primer cuenta //
			Usuario userSession = (Usuario) request.getSession().getAttribute("userconect");
			u = user.BuscarUsuario(userSession);
			cuentatres = usercuenta.BuscarCuentaM(u,3);
			// si la cuenta viene en null le paso datos en cero

			if(cuentatres.getDni() == null && cuentatres.getCBU_Cuenta() == null) {
		
				cuentatres.setSaldo_Cuenta(0000);
				cuentatres.setCBU_Cuenta("0000");
				cuentatres.setNro_Cuenta(0000);
			}
		
				// Guardo el numero de cuenta en una variable session para luego usarla //
				request.getSession().setAttribute("cuentauser", cuentatres);
		
		
		// guardo todos los movimientos en un array //
		NegocioMovimientosImpl movi = new NegocioMovimientosImpl();
		ArrayList<Movimientos> listaMovimientos = movi.listarMovimientosPorCuenta(cuentatres);
		request.setAttribute("listaMov", listaMovimientos);
		
		// cargo la cuenta uno para usar en el front //
		request.setAttribute("cuentauno", cuentatres);
		
		RequestDispatcher rd = request.getRequestDispatcher("iniciousuario.jsp");
		rd.forward(request, response);

		}
		
		// INSERTO UNA TRANSFERENCIA // 
		
		if(request.getParameter("btnEnviarTransfer")!=null) {
			
			
			int cuentaOrigen = Integer.parseInt(request.getParameter("cuentaOrigen"));
			Float montoTransfer = Float.parseFloat(request.getParameter("monto-transfer"));
		
			
			// INSERTAR NUEVO MOVIMIENTO A CUENTA ORIGEN // 
			
			Movimientos nuevoMovi = new Movimientos();
			NegocioMovimientosImpl negocioMovi = new NegocioMovimientosImpl();
			Cuenta cuentaDestino = new Cuenta();
			Cuenta cuentaOrig = new Cuenta();
			NegocioCuentaImpl usercuenta = new NegocioCuentaImpl();
			
			nuevoMovi.setNumCuentaMov(cuentaOrigen);
			nuevoMovi.setTipoMovimiento(4);
			nuevoMovi.setImporte(montoTransfer);
			nuevoMovi.setMensaje("Debito por transferencia");
			
			// DEBITAR EN CUENTA DE ORIGEN SI TIENE SALDO //
			cuentaOrig = usercuenta.BuscarCuentaNroCuenta(cuentaOrigen);
			if(cuentaOrig.getSaldo_Cuenta()>montoTransfer) {
			
				// INSERTAR NUEVO MOVIMIENTO A CUENTA DESTINO POR NRO CUENTA // 
				if(request.getParameter("cbu-envio")!="") {
					String cbu = request.getParameter("cbu-envio");
					Movimientos nuevoMovimiento = new Movimientos();
					//BuscarCuentaPorCbu
					cuentaDestino = usercuenta.BuscarCuentaPorCbu(cbu);
					// verifico si no lo esta enviando a una cuentra propia //
					if(cuentaDestino.getNro_Cuenta()== cuentaOrigen) {
						
						RequestDispatcher rd = request.getRequestDispatcher("mismacuenta.jsp");
						rd.forward(request, response);
					}else {
						
						nuevoMovimiento.setNumCuentaMov(cuentaDestino.getNro_Cuenta());
						nuevoMovimiento.setTipoMovimiento(4);
						nuevoMovimiento.setImporte(montoTransfer);
						nuevoMovimiento.setMensaje("Ingreso por transferencia");
						int insertMovimientoCuentaDestino = negocioMovi.insert(nuevoMovimiento);
						
						
						// debito de cuenta de origen //
						int insertMovimientoCuentaOrigen = negocioMovi.insert(nuevoMovi);
						cuentaOrig.setSaldo_Cuenta(cuentaOrig.getSaldo_Cuenta()-montoTransfer);
						usercuenta.actualizarSaldoCuenta(cuentaOrig);
						
						// AUMENTAR EN CUENTA DESTINO //
						cuentaDestino.setSaldo_Cuenta(cuentaDestino.getSaldo_Cuenta()+montoTransfer);
						usercuenta.actualizarSaldoCuenta(cuentaDestino);
						
						
						int nroMovimiento = negocioMovi.TraerUltimoNroMovimiento();
						request.setAttribute("nromovimiento", nroMovimiento);
						RequestDispatcher rd = request.getRequestDispatcher("transferenciaconfirmada.jsp");
						rd.forward(request, response);
					}
					
					
					
					
				}
				
				
				// INSERTAR NUEVO MOVIMIENTO A CUENTA DESTINO POR CBU // 
				if(request.getParameter("cbu-envio")=="") {
					
					int cuentaDest = Integer.parseInt(request.getParameter("cuentaDestino"));
					Movimientos nuevoMovimiento = new Movimientos();
					Cuenta cuentaD = new Cuenta();
					
					cuentaD = usercuenta.BuscarCuentaNroCuenta(cuentaDest);
					if(cuentaD.getNro_Cuenta()==cuentaOrigen) {
						
						RequestDispatcher rd = request.getRequestDispatcher("mismacuenta.jsp");
						rd.forward(request, response);
					}else {
						nuevoMovimiento.setNumCuentaMov(cuentaDest);
						nuevoMovimiento.setTipoMovimiento(4);
						nuevoMovimiento.setImporte(montoTransfer);
						nuevoMovimiento.setMensaje("Ingreso por transferencia");
						int insertMovimientoCuentaDestino = negocioMovi.insert(nuevoMovimiento);
						
						// debito de cuenta de origen //
						int insertMovimientoCuentaOrigen = negocioMovi.insert(nuevoMovi);
						cuentaOrig.setSaldo_Cuenta(cuentaOrig.getSaldo_Cuenta()-montoTransfer);
						usercuenta.actualizarSaldoCuenta(cuentaOrig);
						
						// AUMENTAR EN CUENTA DESTINO //
						
						cuentaD.setSaldo_Cuenta(cuentaD.getSaldo_Cuenta()+montoTransfer);
						usercuenta.actualizarSaldoCuenta(cuentaD);
						
						int nroMovimiento = negocioMovi.TraerUltimoNroMovimiento();
						request.setAttribute("nromovimiento", nroMovimiento);
						RequestDispatcher rd = request.getRequestDispatcher("transferenciaconfirmada.jsp");
						rd.forward(request, response);
						
					}

								
				}
				
			}
			else {
				
				// la cuenta no tiene saldo //
				RequestDispatcher rd = request.getRequestDispatcher("saldoinsuficiente.jsp");
				rd.forward(request, response);
			}		
			
		} // fin insert transfer
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
