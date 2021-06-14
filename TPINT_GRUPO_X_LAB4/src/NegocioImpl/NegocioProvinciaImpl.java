package NegocioImpl;

import java.util.ArrayList;

import Dao.DaoProvincia;
import DaoImpl.DaoProvinciaImpl;
import Entidades.Provincia;
import Negocio.NegocioProvincia;

public class NegocioProvinciaImpl implements NegocioProvincia {
	private DaoProvincia dpvc = new DaoProvinciaImpl();
	
	@Override
	public ArrayList<Provincia> listarProvincias() {
		return dpvc.listarProvincias();
	}
	

}