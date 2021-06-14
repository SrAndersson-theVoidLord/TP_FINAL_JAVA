package DaoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.sql.PreparedStatement;

import Dao.DaoUsuario;
import Entidades.Usuario;

public class DaoUsuarioImpl implements DaoUsuario {

	private static final String ListaUsuariosContrasAdm = "Select Username_U, Password_U from usuarios where Tipo_U = 1";
	private static final String ListaUsuariosContrasCli = "Select Username_U, Password_U from usuarios where Tipo_U = 2";
	private static final String DeletePersona = "update bdbancos.usuarios set Estado_U = 0  where Dni_U = ? ";
	private static final String RecoverPersona = "update bdbancos.usuarios set Estado_U = 1  where Dni_U = ?";
	
	
	

	public ArrayList<Usuario> listarUsuarios() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Usuario> users = new ArrayList<Usuario>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(
					"Select Nombre_U, Apellido_U, Dni_U, Cuil_U from usuarios where Tipo_U = 2 and Estado_U = 1 order by Nombre_U");
			while (rs.next()) {
				Usuario userrt = new Usuario();
				userrt.setDni(rs.getString("dni_u"));
				userrt.setCuil(rs.getString("Cuil_U"));
				userrt.setNombre(rs.getString("nombre_u"));
				userrt.setApellido(rs.getString("apellido_u"));
				users.add(userrt);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return users;
	}
	
	//Baja logica Usuario
	public boolean ElminarUsuario(Usuario User) {

        boolean isdeleteExitoso = false;
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();


        try 
        {
            statement = conexion.prepareStatement(DeletePersona);
            statement.setString(1, User.getDni());

            if(statement.executeUpdate() > 0)
            {
                conexion.commit();
                isdeleteExitoso = true;
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return isdeleteExitoso;

}

	// Existe usuario admin? por usuario , contra //

	public boolean existeUsuarioContraAdmin(Usuario user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		boolean existe = false;
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			ResultSet rs = null;
			Statement st = conexion.createStatement();
			rs = st.executeQuery(ListaUsuariosContrasAdm);
			while (rs.next()) {

				if (rs.getString("Username_U").equals(user.getUsuario())
						&& rs.getString("Password_U").equals(user.getContrasenia())) {
					existe = true;
					return existe;

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return existe;
	}

	// Existe usuario cliente? por usuario , contra //

	public boolean existeUsuarioContraCliente(Usuario user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		boolean existe = false;
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			ResultSet rs = null;
			Statement st = conexion.createStatement();
			rs = st.executeQuery(ListaUsuariosContrasCli);
			while (rs.next()) {

				if (rs.getString("Username_U").equals(user.getUsuario())
						&& rs.getString("Password_U").equals(user.getContrasenia())) {
					existe = true;
					return existe;

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return existe;
	}
	public ArrayList<Usuario> listarUsuariosBaja() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Usuario> users = new ArrayList<Usuario>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(
					"Select Nombre_U, Apellido_U, Dni_U, Cuil_U from usuarios where Tipo_U = 2 and Estado_U = 0 order by Nombre_U");
			while (rs.next()) {
				Usuario userrt = new Usuario();
				userrt.setDni(rs.getString("dni_u"));
				userrt.setCuil(rs.getString("Cuil_U"));
				userrt.setNombre(rs.getString("nombre_u"));
				userrt.setApellido(rs.getString("apellido_u"));
				users.add(userrt);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return users;
	}
	
	
	@Override
	public boolean RecuperarUsuario(Usuario User) {

        boolean isRecoverExitoso = false;
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();


        try 
        {
            statement = conexion.prepareStatement(RecoverPersona);
            statement.setString(1, User.getDni());

            if(statement.executeUpdate() > 0)
            {
                conexion.commit();
                isRecoverExitoso = true;
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return isRecoverExitoso;

	}

	
	@Override
	public Usuario BuscarUsuario(Usuario u) {
		// Traer usuario completo - para perfil 
		
		
					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}

				
					try {
						Connection conexion = Conexion.getConexion().getSQLConexion();
						Statement st = conexion.createStatement();

						ResultSet rs = st.executeQuery("Select * from usuarios");
						while (rs.next()) {
							
							if(rs.getString("Username_U").equals(u.getUsuario()))
							{
								u.setDni(rs.getString("Dni_U"));
								u.setCuil(rs.getString("Cuil_U"));
								u.setUsuario(rs.getString("Username_U"));
								u.setContrasenia(rs.getString("Password_U"));
								u.setNombre(rs.getString("Nombre_U"));
								u.setApellido(rs.getString("Apellido_U"));
								u.setSexo(rs.getString("Sexo_U"));
								u.setNacionalidad(rs.getString("Nacionalidad_U"));
								u.setDireccion(rs.getString("Direccion_U"));
								u.setLocalidad(rs.getString("Localidad_U"));
								u.setProvincia(rs.getString("Provincia_U"));
								u.setFecha_nac(rs.getDate("Fecha_Nacimiento_U"));
								u.setTelefono(rs.getString("Telefono_U"));
								u.setMail(rs.getString("Mail_U"));
								u.setEstado_usuario(rs.getBoolean("Estado_U"));
								
							}
							

						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {

					}
					return u;
				}

	@Override
	public int agregarUsuario(Usuario u) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		int filas = 0;
		Connection conexion = Conexion.getConexion().getSQLConexion();

		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = dateFormat.format(u.getFecha_nac());

			String query = "INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U, Mail_U, Estado_U)"
					+ "VALUES ('" + u.getDni() + "','" + u.getCuil() + "','" + u.getUsuario() + "','"
					+ u.getContrasenia() + "', 2,'" + u.getNombre() + "','" + u.getApellido() + "','" + u.getSexo()
					+ "','" + u.getNacionalidad() + "','" + u.getDireccion() + "','" + u.getLocalidad() + "','"
					+ u.getProvincia() + "', '" + strDate + "','" + u.getTelefono() + "','" + u.getMail() + "', 1)";

			System.out.println(query);
			Statement st = conexion.createStatement();
			filas = st.executeUpdate(query);
			if (filas > 0) {
				conexion.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
	}

	@Override
	public boolean modificarusuario(Usuario user) {
		 boolean IsModificarExitoso = false;
	       
	        Connection conexion = Conexion.getConexion().getSQLConexion();
	        try {
	        String query = "update  bdbancos.usuarios set Password_U = "+  user.getContrasenia() + " where Dni_U =" + user.getDni();

	        Statement st = conexion.createStatement();

	        int filas = st.executeUpdate(query);
	        if(filas>0)
	        {
	            conexion.commit();
	            IsModificarExitoso = true;
	        }
	    } 
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	    }
	    return IsModificarExitoso;
	}

	@Override
	public Usuario Buscaruser(int dni) {
		try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Usuario encontrada = null;

        try {
            String query = "Select * from usuarios where Estado_U = 1 AND  Dni_U =" + dni;
            Connection conexion = Conexion.getConexion().getSQLConexion();
            PreparedStatement statement = conexion.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                encontrada = new Usuario();
                encontrada.setDni(rs.getString("Dni_U"));
                encontrada.setCuil(rs.getString("Cuil_U"));
                encontrada.setContrasenia(rs.getString("Password_U"));
                encontrada.setNombre(rs.getString("Nombre_U"));
                encontrada.setApellido(rs.getString("Apellido_U"));
                encontrada.setNacionalidad("Nacionalidad_U");
                encontrada.setLocalidad(rs.getString("Localidad_U"));
                encontrada.setProvincia(rs.getString("Provincia_U"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return encontrada;
	}
	
	

}


