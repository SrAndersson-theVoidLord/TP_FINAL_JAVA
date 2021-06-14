package NegocioImpl;


import java.util.ArrayList;

import Dao.DaoUsuario;
import DaoImpl.DaoUsuarioImpl;
import Entidades.Usuario;
import Negocio.NegocioUsuario;

public class NegocioUsuarioImpl implements NegocioUsuario{
	
private	DaoUsuario pdao = new DaoUsuarioImpl();
	

	@Override
	public ArrayList<Usuario> listarUsuarios() {
		// TODO Auto-generated method stub
		return pdao.listarUsuarios();
	}
	
	@Override
    public boolean ElminarUsuario(Usuario user) {

        boolean estado=false;
        if(user.getDni().trim().length() > 0 ) 
        {
            estado = pdao.ElminarUsuario(user);
        }
        return estado;

}


	@Override
	public boolean existeUsuarioContraAdmin(Usuario user) {
		// TODO Auto-generated method stub
		boolean existe = false;
		
		if(user.getUsuario().trim().length()> 0 && user.getContrasenia().trim().length()>0)
		{
			existe=pdao.existeUsuarioContraAdmin(user);
		}
		return existe;
		
		
	}


	@Override
	public boolean existeUsuarioContraCliente(Usuario user) {
		// TODO Auto-generated method stub
		  boolean existe = false;

	        if(user.getUsuario().trim().length()> 0 && user.getContrasenia().trim().length()>0)
	        {
	            existe=pdao.existeUsuarioContraCliente(user);
	        }
	        return existe;

	}
	
	public ArrayList<Usuario> listarUsuariosBaja() {
		// TODO Auto-generated method stub
		return pdao.listarUsuariosBaja();
	}

	@Override
	public boolean RecuperarUsuario(Usuario user) {
        boolean estado =false;
        if(user.getDni().trim().length() > 0 ) 
        {
            estado = pdao.RecuperarUsuario(user);
        }
        return estado;
	}




	@Override
	public Usuario BuscarUsuario(Usuario u) {
		   if(u.getUsuario().trim().length()> 0)
	        {
	            return pdao.BuscarUsuario(u);
	        }

	        return null;
	}

	@Override
	public int agregarUsuario(Usuario user) {
			int filas = pdao.agregarUsuario(user);
			return filas;
	}

	@Override
	public boolean modificarpass(Usuario usuario) {
	return pdao.modificarusuario(usuario);
	}

	@Override
	public Usuario buscardni(int dni) {
		return pdao.Buscaruser(dni);
	}



}
