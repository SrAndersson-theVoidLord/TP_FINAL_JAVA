package NegocioImpl;

import java.util.ArrayList;

import Dao.DaoMovimientos;
import DaoImpl.DaoMovimientosImpl;
import Entidades.Cuenta;
import Entidades.Movimientos;
import Negocio.NegocioMovimientos;

public class NegocioMovimientosImpl implements NegocioMovimientos{

    
private DaoMovimientos mdao = new DaoMovimientosImpl();

    @Override
    public ArrayList<Movimientos> listarMovimientosPorCuenta(Cuenta cuenta) {
        // TODO Auto-generated method stub

        return mdao.listarMovimientosPorCuenta(cuenta);
    }

	@Override
	public ArrayList<Movimientos> listarMovIngresosPorCuenta(Cuenta cuenta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movimientos> listarMovEgresosPorCuenta(Cuenta cuenta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Movimientos m) {
		  return mdao.insert(m); 
	}

	@Override
	public int TraerUltimoNroMovimiento() {
	    return mdao.TraerUltimoNroMovimiento();
	}
}