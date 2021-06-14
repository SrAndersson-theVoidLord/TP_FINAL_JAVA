package DaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Dao.DaoPrestamo;
import Entidades.Cuenta;
import Entidades.Prestamo;
import Entidades.Usuario;

public class DaoPrestamoImpl implements DaoPrestamo {

	private static final String ImporteMensual = "select sum(Monto_Mensual) as mes from bdbancos.prestamos where MONTH(Fecha_Alta) = MONTH(NOW()) and Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String ImporteAnual = "select sum(Monto_Mensual) as anual from bdbancos.prestamos where year(Fecha_Alta) = year(NOW()) and Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String ImporteTotal = "select sum(Saldo_Restante) as total from bdbancos.prestamos where Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String PrestamosMensuales ="select Nro_Prestamo, Nro_Cuenta, Importe_Prestamo,Importe_Total_Pagar, Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes,Fecha_Alta from bdbancos.prestamos where month(Fecha_Alta) = MONTH(NOW()) and Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String PrestamosAnuales ="select Nro_Prestamo, Nro_Cuenta, Importe_Prestamo,Importe_Total_Pagar, Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes,Fecha_Alta from bdbancos.prestamos where year(Fecha_Alta) = year(NOW()) and Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String PrestamosTotales ="select Nro_Prestamo, Nro_Cuenta, Importe_Prestamo,Importe_Total_Pagar, Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes,Fecha_Alta from bdbancos.prestamos where Estado_Prestamo = true and Estado_Solicitud = false";
	private static final String PrestamosAutorizar ="select Nro_Prestamo, Nro_Cuenta, Importe_Prestamo,Importe_Total_Pagar, Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes,Fecha_Alta from bdbancos.prestamos where Estado_Prestamo = true and Estado_Solicitud = true";
	private static final String RechazarPrestamo = "update bdbancos.prestamos set Estado_Prestamo = 0 where Nro_Prestamo = ?";
	private static final String AutorizarPrestamo = "update bdbancos.prestamos set Estado_Solicitud = 0 where Nro_Prestamo = ?";
	private static final String ListaPrestamos = "Select * from prestamos";
	
	@Override
	public float IngresoMensual() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		float importemensual = 0;		
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery(ImporteMensual);
			while(rs.next()) {
				importemensual=rs.getFloat("mes");	
			
			}

			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
		
		}
		return importemensual;
	}

	@Override
	public float IngresoAnual() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		float importeanual = 0;		
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery(ImporteAnual);
			while(rs.next()) {
				importeanual=rs.getFloat("anual");	
			
			}

			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
		
		}
		return importeanual;
	}
	

	@Override
	public float IngresoTotal() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		float importetotal = 0;		
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery(ImporteTotal);
			while(rs.next()) {
				importetotal=rs.getFloat("total");	
			
			}

			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
		
		}
		return importetotal;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosMes() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> listaprestamos = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(PrestamosMensuales);
			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
				prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
				prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
				prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
				prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
				prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
				prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
				prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
				prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
			
				listaprestamos.add(prestamo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listaprestamos;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosAnual() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> listaprestamos = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(PrestamosAnuales);
			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
				prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
				prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
				prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
				prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
				prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
				prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
				prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
				prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
			
				listaprestamos.add(prestamo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listaprestamos;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosTotal() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> listaprestamos = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(PrestamosTotales);
			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
				prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
				prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
				prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
				prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
				prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
				prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
				prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
				prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
			
				listaprestamos.add(prestamo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listaprestamos;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosEntreFechas(int mes1, int año1,int mes2,int año2) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> listaprestamos = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();

			Statement statement = conexion.createStatement();
		    ResultSet rs = statement.executeQuery("SELECT * FROM bdbancos.prestamos WHERE month(fecha_alta) BETWEEN '"+ mes1 +"' AND '"+ mes2 +"' and year(Fecha_Alta) between  '"+ año1 +"' and '"+ año2 +"'");
			
			
	 //PreparedStatement statement;
		//statement = conexion.prepareStatement("SELECT * FROM bdbancos.prestamos WHERE month(fecha_alta) BETWEEN  1 AND  '12' and year(Fecha_Alta) between '2020' and '2021'");
	//    statement.setInt(1, 1);
	//	ResultSet rs = statement.executeQuery();
			
			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
				prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
				prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
				prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
				prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
				prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
				prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
				prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
				prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
			
				listaprestamos.add(prestamo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listaprestamos;
	}

	@Override
	public ArrayList<Prestamo> ListarPrestamosAutorizar() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> listaprestamos = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(PrestamosAutorizar);
			while (rs.next()) {
				Prestamo prestamo = new Prestamo();
				prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
				prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
				prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
				prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
				prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
				prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
				prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
				prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
				prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
			
				listaprestamos.add(prestamo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return listaprestamos;
	}

	@Override
	public boolean RechazarPrestamo(Prestamo prest) {
		
		  boolean isRechazarPrestamo = false;
		  
	        PreparedStatement statement;
	        Connection conexion = Conexion.getConexion().getSQLConexion();

	        try 
	        {
	            statement = conexion.prepareStatement(RechazarPrestamo);
	            String borrar = Integer.toString(prest.getNro_Prestamo());
	            statement.setString(1, borrar);

	            if(statement.executeUpdate() > 0)
	            {
	                conexion.commit();
	                isRechazarPrestamo = true;
	            }
	        } 
	        
	        catch (SQLException e) 
	        {
	            e.printStackTrace();
	    
	        }
	        
	        return isRechazarPrestamo;

	}

	@Override
	public boolean AprobarPrestamo(Prestamo prest) {
		  boolean isAutorizarPrestamo = false;
		  
	        PreparedStatement statement;
	        Connection conexion = Conexion.getConexion().getSQLConexion();

	        try 
	        {
	            statement = conexion.prepareStatement(AutorizarPrestamo);
	            String autorizar = Integer.toString(prest.getNro_Prestamo());
	            statement.setString(1, autorizar);

	            if(statement.executeUpdate() > 0)
	            {
	                conexion.commit();
	                isAutorizarPrestamo = true;
	            }
	        } 
	        
	        catch (SQLException e) 
	        {
	            e.printStackTrace();
	      
	        }
	        
	        return isAutorizarPrestamo;
	}

	@Override
	public int insert(Prestamo p) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		int filas = 0;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		
		try 
		{
								
													
			String query = "INSERT INTO Prestamos (Nro_Cuenta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Estado_Solicitud,Cuotas_Restantes)"
					+ "VALUES ("+p.getNro_Cuenta()+","+p.getImporte_Prestamo()+","+p.getImporte_Total_Pagar()+","+p.getPlazo_Meses()+","+p.getMonto_Mensual()+","+p.getSaldo_Restante()+","+1+","+p.getCuotas_Restantes()+")";
					
		
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
	

	@Override
	public int TraerUltimoNroPrestamo() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		int nro_prestamo = -1;
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			ResultSet rs = null;
			Statement st = conexion.createStatement();
			rs = st.executeQuery(ListaPrestamos);
			while (rs.next()) {
				
				nro_prestamo = rs.getInt("Nro_Prestamo");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		
		return nro_prestamo;
	}

	@Override
	public ArrayList<Prestamo> listarPrestamosPorUsuario(Usuario user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Prestamo> prestamosPorUsuario = new ArrayList<Prestamo>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery("select * from prestamos p INNER JOIN cuentas c on p.Nro_Cuenta = c.Nro_Cuenta_C WHERE c.Dni_C = '"+user.getDni()+"'");
			Prestamo prestamo = new Prestamo();
			while (rs.next()) {
				
				// valido que los prestamos esten activos //
				/*
				 * if(rs.getBoolean("Estado_Prestamo") == true && rs.getBoolean("Estado_Solicitud") == true) {}
				 */
				
					prestamo.setNro_Prestamo(rs.getInt("Nro_Prestamo"));
					prestamo.setNro_Cuenta(rs.getInt("Nro_Cuenta"));
					prestamo.setFecha_Alta(rs.getDate("Fecha_Alta"));
					prestamo.setImporte_Prestamo(rs.getFloat("Importe_Prestamo"));
					prestamo.setImporte_Total_Pagar(rs.getFloat("Importe_Total_Pagar"));
					prestamo.setPlazo_Meses(rs.getInt("Plazo_Meses"));
					prestamo.setMonto_Mensual(rs.getFloat("Monto_Mensual"));
					prestamo.setSaldo_Restante(rs.getFloat("Saldo_Restante"));
					prestamo.setCuotas_Restantes(rs.getInt("Cuotas_Restantes"));
					
					prestamosPorUsuario.add(prestamo);
					
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return prestamosPorUsuario;
	}

	// Luego de que la persona pague el prestamo actualizo las cuotas y el saldo restante //
	@Override
	public boolean actualizarPrestamo(Prestamo prestamo) {
	       PreparedStatement statement;
           Connection conexion = Conexion.getConexion().getSQLConexion();
           boolean actualizar = false;
           try
           {
               String query = "update bdbancos.prestamos set Saldo_Restante = ?, Cuotas_Restantes = ? where Nro_Prestamo = ?";
               statement = conexion.prepareStatement(query);
               statement.setDouble(1, prestamo.getSaldo_Restante());
               statement.setInt(2, prestamo.getCuotas_Restantes());
               statement.setInt(3, prestamo.getNro_Prestamo());

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

	// si ya termino de pagar el prestamo lo doy de baja //
	@Override
	public boolean darBajaPrestamo(Prestamo prestamo) {
		   PreparedStatement statement;
           Connection conexion = Conexion.getConexion().getSQLConexion();
           boolean actualizar = false;
           try
           {
               String query = "update bdbancos.prestamos set Estado_Prestamo = ? where Nro_Prestamo = ?";
               statement = conexion.prepareStatement(query);
               statement.setBoolean(1, prestamo.isEstado_Prestamo());
               statement.setInt(2, prestamo.getNro_Prestamo());

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


	
	
	
}

