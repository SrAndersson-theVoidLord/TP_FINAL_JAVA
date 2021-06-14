
package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Localidad;
import Entidades.Provincia;
import NegocioImpl.NegocioLocalidadImpl;
import NegocioImpl.NegocioProvinciaImpl;


/**
 * Servlet implementation class ServletProvincia
 */
@WebServlet("/ServletProvincia")
public class ServletProvincia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProvincia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Paramprov")!= null) {
			NegocioProvinciaImpl prov = new NegocioProvinciaImpl();
			ArrayList<Provincia> lista = prov.listarProvincias();
			request.setAttribute("listaP", lista);
			NegocioLocalidadImpl local= new NegocioLocalidadImpl();
			ArrayList<Localidad> listal = local.listarLocalidades();
			request.setAttribute("listaL", listal);
			RequestDispatcher rd = request.getRequestDispatcher("/CrearUsuario.jsp");
			rd.forward(request, response);
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
