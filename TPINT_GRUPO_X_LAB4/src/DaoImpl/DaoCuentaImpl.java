package DaoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import Entidades.Cuenta;
import Dao.DaoCuentas;
import Dao.DaoUsuario;
import Entidades.Usuario;
import java.util.Date;


public class DaoCuentaImpl implements DaoCuentas {

	private static final String Deletecuenta = "update bdbancos.cuentas set Estado_C = 0  where Nro_Cuenta_C = ? ";
	private static final String RecoverCuenta = "update bdbancos.cuentas set Estado_C = 1  where Nro_Cuenta_C = ? ";
	private static final String BuscarCuenta = "Select * from cuentas where Estado_C = 1 AND Nro_Cuenta_c = ?";
	
	
    public int agregarseguro(Cuenta cuenta ) {

    	   try {
               Class.forName("com.mysql.jdbc.Driver");
           } catch (ClassNotFoundException e) {
               e.printStackTrace();
           }
           int filas = 0;

           Connection conexion = Conexion.getConexion().getSQLConexion();


               try {
            	   String query = "Insert into bdbancos.cuentas(Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C) values ("
                           + cuenta.getNro_Cuenta() + "," + cuenta.getTipo_Cuenta() + ",'"+cuenta.getDni()+"','"+cuenta.getCBU_Cuenta()+"')";

                   Statement st = conexion.createStatement();
                   filas = st.executeUpdate(query);
                   if(filas>0) {
                       conexion.commit();
                   }
               }
                   catch(Exception e)
                   {
                       e.printStackTrace();
                   }
                   return filas;

    }

    //lista cuentas dadas de alta
	@Override
	public ArrayList<Cuenta> listarCuentas() {
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			ArrayList<Cuenta> listacuentas = new ArrayList<Cuenta>();
			try {
				Connection conexion = Conexion.getConexion().getSQLConexion();
				Statement st = conexion.createStatement();

				ResultSet rs = st.executeQuery(
						"Select Nro_Cuenta_c, Dni_c, Saldo_C, Tipo_Cuenta_C from cuentas where Estado_C = 1 ");
				while (rs.next()) {
					Cuenta cuenta = new Cuenta();
					cuenta.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
					cuenta.setDni(rs.getString("dni_c"));
					cuenta.setSaldo_Cuenta(rs.getFloat("saldo_c"));
					cuenta.setTipo_Cuenta(rs.getInt("tipo_cuenta_c"));
					listacuentas.add(cuenta);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
			return listacuentas;
	
		
	}
	//Baja logica cuenta
	@Override
	public boolean ElminarCuenta(Cuenta cuenta) {
	


	        boolean isdeleteExitoso = false;
	        PreparedStatement statement;
	        Connection conexion = Conexion.getConexion().getSQLConexion();


	        try 
	        {
	            statement = conexion.prepareStatement(Deletecuenta);
	            statement.setInt(1, cuenta.getNro_Cuenta());

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
 
	// recuperar cuenta dada de baja
	@Override
	public boolean RecuperarCuenta(Cuenta cuenta) {
		
        boolean isupdateExitoso = false;
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();


        try 
        {
            statement = conexion.prepareStatement(RecoverCuenta);
            statement.setInt(1, cuenta.getNro_Cuenta());

            if(statement.executeUpdate() > 0)
            {
                conexion.commit();
                isupdateExitoso = true;
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return isupdateExitoso;

	}

	//listar cuentas dadas de baja
	@Override
	public ArrayList<Cuenta> listarCuentasBaja() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Cuenta> listacuentas = new ArrayList<Cuenta>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(
					"Select Nro_Cuenta_c, Dni_c, Saldo_C, Tipo_Cuenta_C from cuentas where Estado_C = 0 ");
			while (rs.next()) {
				Cuenta cuenta = new Cuenta();
				cuenta.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
				cuenta.setDni(rs.getString("dni_c"));
				cuenta.setSaldo_Cuenta(rs.getFloat("saldo_c"));
				cuenta.setTipo_Cuenta(rs.getInt("tipo_cuenta_c"));
				listacuentas.add(cuenta);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listacuentas;

	
	}

	// Traer la cuenta de un usuario // la usamos en la parte principal de la cuenta para el saldo,cbu,nro cuenta //
	@Override
	public Cuenta BuscarCuentaM(Usuario u, int ncuenta) {
		  try {
              Class.forName("com.mysql.jdbc.Driver");
          } catch (ClassNotFoundException e) {
              e.printStackTrace();
          }

          Cuenta cuenta = new Cuenta();
          try {
              Connection conexion = Conexion.getConexion().getSQLConexion();
              Statement st = conexion.createStatement();

              ResultSet rs = st.executeQuery("Select * from cuentas");
              int ncuentaselec = 0;
              while (rs.next()) {

                  if(rs.getString("Dni_C").equals(u.getDni()) && rs.getBoolean("Estado_C") == true )
                  {

                          ncuentaselec++;
                          if(ncuentaselec == ncuenta) {
                              cuenta.setDni(rs.getString("Dni_C"));
                              cuenta.setCBU_Cuenta(rs.getString("CBU_C"));
                              cuenta.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
                              cuenta.setTipo_Cuenta(rs.getInt("Tipo_Cuenta_C"));
                              cuenta.setSaldo_Cuenta(rs.getFloat("Saldo_C"));
                              cuenta.setFecha_alta_Cuenta(rs.getDate("Fecha_Alta"));
                              cuenta.setEstado_Cuenta(rs.getBoolean("Estado_C"));
                          }


                  }




              }

          } catch (Exception e) {
              e.printStackTrace();
          } finally {

          }
          return cuenta;
	}

	// TRAE LAS CUENTAS DE UN USUARIO EN UNA LISTA // BUSCA POR DNI //
	@Override
	public ArrayList<Cuenta> listarCuentasUsuario(Usuario user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Cuenta> ListaCuentas = new ArrayList<Cuenta>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery("Select * from cuentas");
			while (rs.next()) {
				Cuenta cuentaUser = new Cuenta();
					if(rs.getString("Dni_C").equals(user.getDni())) {
						System.out.println(rs.getInt("Nro_Cuenta_C"));
						cuentaUser.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
						ListaCuentas.add(cuentaUser);
					}
					
					
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return ListaCuentas;
	}

	@Override
	public Cuenta BuscarCuenta(int nroCuenta) {
		   try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	        Cuenta encontrada = null;

	        try {
	            Connection conexion = Conexion.getConexion().getSQLConexion();
	            PreparedStatement statement = conexion.prepareStatement(BuscarCuenta);
	            statement.setInt(1, nroCuenta);

	            ResultSet rs = statement.executeQuery();
	            if (rs.next()) {
	                encontrada = new Cuenta();
	                encontrada.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
	                encontrada.setDni(rs.getString("dni_c"));
	                encontrada.setSaldo_Cuenta(rs.getFloat("saldo_c"));
	                encontrada.setTipo_Cuenta(rs.getInt("tipo_cuenta_c"));
	                encontrada.setCBU_Cuenta(rs.getString("CBU_C"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return encontrada;
	}

	@Override
	public int proximo() {
		  try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	        int next = 0;

	        try {
	            Connection conexion = Conexion.getConexion().getSQLConexion();
	            PreparedStatement statement = conexion.prepareStatement("SELECT COUNT(*) as total FROM bdbancos.cuentas");


	            ResultSet rs = statement.executeQuery();
	            if (rs.next()) {
	                next = rs.getInt("total");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return next;

	       
	}

	@Override
	public boolean modificarcuenta(Cuenta cuenta) {
		boolean IsModificarExitoso = false;
        Connection conexion = Conexion.getConexion().getSQLConexion();


        try 
        {

            String query = "update  bdbancos.cuentas set Saldo_C = "+  cuenta.getSaldo_Cuenta() + " where Nro_Cuenta_C =" + cuenta.getNro_Cuenta();

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
	public int cantidadcuentas(int dni) {
		  try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	        int next = 0;

	        try {
	            String query = "SELECT COUNT(*) as total FROM bdbancos.cuentas where Dni_C = " + dni;
	            Connection conexion = Conexion.getConexion().getSQLConexion();
	            PreparedStatement statement = conexion.prepareStatement(query);


	            ResultSet rs = statement.executeQuery();
	            if (rs.next()) {
	                next = rs.getInt("total");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return next;
	}

	@Override
	public Cuenta BuscarCuentaNroCuenta(int ncuenta) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Cuenta cuenta = new Cuenta();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery("Select * from cuentas");
			
			while (rs.next()) {
				
				if(rs.getInt("Nro_Cuenta_C") == ncuenta && rs.getBoolean("Estado_C") == true)
				{		
					
							cuenta.setDni(rs.getString("Dni_C"));
							cuenta.setCBU_Cuenta(rs.getString("CBU_C"));
							cuenta.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
							cuenta.setTipo_Cuenta(rs.getInt("Tipo_Cuenta_C"));
							cuenta.setSaldo_Cuenta(rs.getFloat("Saldo_C"));
							cuenta.setFecha_alta_Cuenta(rs.getDate("Fecha_Alta"));
												
					 
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return cuenta;
	}

	@Override
	public boolean actualizarSaldoCuenta(Cuenta cuenta) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean actualizar = false;
		try
		{
			String query = "update bdbancos.cuentas set Saldo_C = ? where Nro_Cuenta_C = ?";
			statement = conexion.prepareStatement(query);
			statement.setFloat(1, cuenta.getSaldo_Cuenta());
			statement.setInt(2, cuenta.getNro_Cuenta());
		
			
			if(statement.executeUpdate() > 0)
			{
				conexion.commit();
				actualizar = true;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
		return actualizar;
	}

	// BUSCA CUENTA POR CBU //
	@Override
	public Cuenta BuscarCuentaPorCbu(String cbu) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Cuenta cuenta = new Cuenta();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery("Select * from cuentas");
			
			while (rs.next()) {
				
				if(rs.getString("CBU_C").equals(cbu) && rs.getBoolean("Estado_C") == true)
				{		
					
							cuenta.setDni(rs.getString("Dni_C"));
							cuenta.setCBU_Cuenta(rs.getString("CBU_C"));
							cuenta.setNro_Cuenta(rs.getInt("Nro_Cuenta_C"));
							cuenta.setTipo_Cuenta(rs.getInt("Tipo_Cuenta_C"));
							cuenta.setSaldo_Cuenta(rs.getFloat("Saldo_C"));
							cuenta.setFecha_alta_Cuenta(rs.getDate("Fecha_Alta"));							
				}

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return cuenta;
	}

}