package Dao;
import java.util.ArrayList;

import Entidades.Cuenta;
import Entidades.Usuario;

public interface DaoCuentas {
	
	public int agregarseguro(Cuenta cuenta);

	public ArrayList<Cuenta> listarCuentas();

	public boolean ElminarCuenta(Cuenta cuenta);

	public boolean RecuperarCuenta(Cuenta cuenta);

	public ArrayList<Cuenta> listarCuentasBaja();
	
	public Cuenta BuscarCuentaM(Usuario u,int ncuenta);
	
    public ArrayList<Cuenta> listarCuentasUsuario(Usuario user);
    
    public Cuenta BuscarCuenta(int nroCuenta);

    public int proximo();

    public boolean modificarcuenta(Cuenta cuenta);

    public int cantidadcuentas (int dni);

	public Cuenta BuscarCuentaNroCuenta(int ncuenta);
	
	public boolean actualizarSaldoCuenta(Cuenta cuenta);
	
	public Cuenta BuscarCuentaPorCbu(String cbu);
	
}
