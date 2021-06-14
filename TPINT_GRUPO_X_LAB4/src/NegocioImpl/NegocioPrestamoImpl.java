package NegocioImpl;

import java.util.ArrayList;

import Dao.DaoPrestamo;
import DaoImpl.DaoPrestamoImpl;
import Entidades.Prestamo;
import Entidades.Usuario;
import Negocio.NegocioPrestamo;

public class NegocioPrestamoImpl implements NegocioPrestamo{
	
	private	DaoPrestamo rdao = new DaoPrestamoImpl();

	@Override
	public float IngresoMensual() {
		// TODO Auto-generated method stub
		return rdao.IngresoMensual();
	}

	@Override
	public float IngresoAnual() {
		// TODO Auto-generated method stub
		return rdao.IngresoAnual();
	}

	@Override
	public float IngresoTotal() {
		// TODO Auto-generated method stub
		return rdao.IngresoTotal();
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosMes() {
		// 
		return rdao.ListarPrestamosMes();
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosAnual() {
		return rdao.ListarPrestamosAnual();
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosTotal() {
		return rdao.ListarPrestamosTotal();
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosEntreFechas() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosEntreFechas(int mes1, int año1,int mes2,int año2) {
		// TODO Auto-generated method stub
		return rdao.ListarPrestamosEntreFechas(mes1, año1, mes2, año2);
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosAutorizar() {
		return rdao.ListarPrestamosAutorizar();
	}

	@Override
	public boolean RechazarPestamo(Prestamo prest) {
        boolean estado=false;
        if(prest.getNro_Prestamo() > 0 ) 
        {
            estado = rdao.RechazarPrestamo(prest);
        }
        return estado;
	}

	@Override
	public boolean AprobarPestamo(Prestamo prest) {
        boolean estado=false;
        if(prest.getNro_Prestamo() > 0 ) 
        {
            estado = rdao.AprobarPrestamo(prest);
        }
        return estado;
	}

	@Override
	public int insert(Prestamo p) {
		  // TODO Auto-generated method stub
        int insert = 0;
        insert=rdao.insert(p);
        return insert;

    }

	@Override
	public int TraerUltimoNroPrestamo() {
        return rdao.TraerUltimoNroPrestamo();
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosPorUsuario(Usuario user) {
	
	   return rdao.listarPrestamosPorUsuario(user);
	}

	@Override
	public boolean actualizarPrestamo(Prestamo prestamo) {
		  return rdao.actualizarPrestamo(prestamo);
	}

	@Override
	public boolean darBajaPrestamo(Prestamo prestamo) {
        return rdao.darBajaPrestamo(prestamo);
	}




	
	
}
