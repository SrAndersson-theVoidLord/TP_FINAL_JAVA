package Negocio;

import java.util.ArrayList;

import Entidades.Usuario;


public interface NegocioUsuario {
	
	public ArrayList<Usuario> listarUsuarios();
	public boolean existeUsuarioContraAdmin(Usuario user);
	public boolean existeUsuarioContraCliente(Usuario user);
	public boolean ElminarUsuario(Usuario user);
	public ArrayList<Usuario> listarUsuariosBaja();
	public boolean RecuperarUsuario(Usuario usuario);
    public Usuario BuscarUsuario(Usuario u);
    public int agregarUsuario(Usuario user);

    public boolean modificarpass(Usuario usuario);
    public Usuario buscardni(int dni);
}
