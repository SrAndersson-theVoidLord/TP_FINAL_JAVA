package NegocioImpl;


import java.util.ArrayList;

import Dao.DaoCuentas;

import DaoImpl.DaoCuentaImpl;

import Entidades.Cuenta;
import Entidades.Usuario;
import Negocio.NegocioCuenta;


public class NegocioCuentaImpl implements NegocioCuenta{

 private  DaoCuentas pdao = new DaoCuentaImpl();

    @Override
    public int agregarcuenta(Cuenta cuenta) {
        // TODO Auto-generated method stub

        return pdao.agregarseguro(cuenta);
    }

	@Override
	public ArrayList<Cuenta> listarCuentas() {
		return pdao.listarCuentas();
	}

	@Override
	public boolean EliminarCuenta(Cuenta cuenta) {
        boolean estado=false;
        if(cuenta.getNro_Cuenta() > 0 ) 
        {
            estado = pdao.ElminarCuenta(cuenta);
        }
        return estado;
	}

	@Override
	public ArrayList<Cuenta> listarCuentasBaja() {
		return pdao.listarCuentasBaja();

	}

	@Override
	public boolean RecuperarCuenta(Cuenta cuenta) {
        boolean estado=false;
        if(cuenta.getNro_Cuenta() > 0 ) 
        {
            estado = pdao.RecuperarCuenta(cuenta);
        }
        return estado;
	}

	@Override
	public Cuenta BuscarCuentaM(Usuario u, int ncuenta) {
		  if(u.getDni().trim().length() > 0)
	        {
	            return pdao.BuscarCuentaM(u,ncuenta);
	        }
	        return null;
	}

	@Override
	public ArrayList<Cuenta> listarCuentasUsuario(Usuario user) {
		   return pdao.listarCuentasUsuario(user);
	}

	@Override
	public Cuenta BuscarCuenta(int nroCuenta) {
		return pdao.BuscarCuenta(nroCuenta);
	}

	@Override
	public int proximo() {
	 return pdao.proximo();
	}

	@Override
	public boolean modificarcuenta(Cuenta cuenta) {
		return pdao.modificarcuenta(cuenta);
	}

	@Override
	public int cantidadcuentas(int dni) {
			return pdao.cantidadcuentas(dni);
	}

	@Override
	public Cuenta BuscarCuentaNroCuenta(int ncuenta) {
		  return pdao.BuscarCuentaNroCuenta(ncuenta);
	}

	@Override
	public boolean actualizarSaldoCuenta(Cuenta cuenta) {
	     return pdao.actualizarSaldoCuenta(cuenta);
	}

	@Override
	public Cuenta BuscarCuentaPorCbu(String cbu) {
		return pdao.BuscarCuentaPorCbu(cbu);
	}


    }