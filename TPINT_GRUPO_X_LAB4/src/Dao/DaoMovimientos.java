package Dao;

import java.util.ArrayList;

import Entidades.Cuenta;
import Entidades.Movimientos;

public interface DaoMovimientos {
	public ArrayList<Movimientos> listarMovimientosPorCuenta(Cuenta cuenta);
	public ArrayList<Movimientos> listarMovIngresosPorCuenta(Cuenta cuenta);
	public ArrayList<Movimientos> listarMovEgresosPorCuenta(Cuenta cuenta);
	public int insert(Movimientos m);
	public int TraerUltimoNroMovimiento();
}
