package Dao;
import java.util.ArrayList;

import Entidades.Usuario;

public interface DaoUsuario {

	
	public ArrayList<Usuario> listarUsuarios();
	public boolean existeUsuarioContraAdmin(Usuario user);
	public boolean existeUsuarioContraCliente(Usuario user);
	public boolean ElminarUsuario(Usuario user);
	public ArrayList<Usuario> listarUsuariosBaja();
	public boolean RecuperarUsuario(Usuario user);
    public Usuario BuscarUsuario(Usuario u);
    
    public boolean modificarusuario(Usuario user);
    public int agregarUsuario(Usuario u);
    public Usuario Buscaruser(int dni);
    
	
}
