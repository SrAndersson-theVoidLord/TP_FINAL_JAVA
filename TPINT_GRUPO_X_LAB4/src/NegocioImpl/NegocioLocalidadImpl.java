package NegocioImpl;

import java.util.ArrayList;

import Dao.DaoLocalidad;
import DaoImpl.DaoLocalidadImpl;
import Entidades.Localidad;
import Negocio.NegocioLocalidad;

public class NegocioLocalidadImpl implements NegocioLocalidad {
	
	private DaoLocalidad dloc = new DaoLocalidadImpl();
	@Override
	public ArrayList<Localidad> listarLocalidades() {
		// TODO Auto-generated method stub
		return dloc.listarLocalidades();
	}
	
}