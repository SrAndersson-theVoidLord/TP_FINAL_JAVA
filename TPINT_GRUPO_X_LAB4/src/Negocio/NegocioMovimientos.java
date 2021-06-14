package Negocio;

import java.util.ArrayList;

import Entidades.Cuenta;
import Entidades.Movimientos;

public interface NegocioMovimientos {
	public ArrayList<Movimientos> listarMovimientosPorCuenta(Cuenta cuenta);
	public ArrayList<Movimientos> listarMovIngresosPorCuenta(Cuenta cuenta);
	public ArrayList<Movimientos> listarMovEgresosPorCuenta(Cuenta cuenta);
	public int insert(Movimientos m);
	public int TraerUltimoNroMovimiento();
}
