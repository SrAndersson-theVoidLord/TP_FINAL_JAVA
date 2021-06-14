package DaoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Dao.DaoMovimientos;
import Entidades.Cuenta;
import Entidades.Movimientos;


public class DaoMovimientosImpl implements DaoMovimientos{
	// trae los movimientos segun el numero de cuenta //

    public ArrayList<Movimientos> listarMovimientosPorCuenta(Cuenta cuenta) {
    	 try {
             Class.forName("com.mysql.jdbc.Driver");
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         }

         ArrayList<Movimientos> movporcuenta = new ArrayList<Movimientos>();
         try {
             Connection conexion = Conexion.getConexion().getSQLConexion();
             Statement st = conexion.createStatement();

             ResultSet rs = st.executeQuery("select * from movimientos");
             while (rs.next()) {
                 Movimientos movims = new Movimientos();
                 if(rs.getInt("Nro_Cuenta_M")==cuenta.getNro_Cuenta()) 
                 {

                     movims.setCodMovimiento(rs.getInt("Cod_Movimiento_M"));
                     movims.setNumCuentaMov(rs.getInt("Nro_Cuenta_M"));
                     movims.setTipoMovimiento(rs.getInt("Tipo_Movimiento_M"));
                     movims.setImporte(rs.getFloat("Importe_M"));
                     movims.setFechaMov(rs.getDate("Fecha_M"));
                     movims.setMensaje(rs.getString("Mensaje_M"));
                     movporcuenta.add(movims);

                 }

             }

         } catch (Exception e) {
             e.printStackTrace();
         } finally {

         }
         return movporcuenta;
    }

	@Override
	public ArrayList<Movimientos> listarMovIngresosPorCuenta(Cuenta cuenta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movimientos> listarMovEgresosPorCuenta(Cuenta cuenta) {
		// TODO Auto-generated method stub
		return null;
	}

	//Insertar Movimientos 
	@Override
	public int insert(Movimientos m) {
		  try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        int filas = 0;
	        Connection conexion = Conexion.getConexion().getSQLConexion();

	        try 
	        {


	            String query = "INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Mensaje_M)"
	                    + "VALUES ("+m.getNumCuentaMov()+","+m.getTipoMovimiento()+","+m.getImporte()+",'"+m.getMensaje()+"')";


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

	// Trae el ultimo movimiento realizado para el pago confirmado //
	@Override
	public int TraerUltimoNroMovimiento() {
	      try {
              Class.forName("com.mysql.jdbc.Driver");
          } catch (ClassNotFoundException e) {
              e.printStackTrace();
          }
          int ultimo_movimiento = -1;
          try {
              Connection conexion = Conexion.getConexion().getSQLConexion();
              ResultSet rs = null;
              Statement st = conexion.createStatement();
              rs = st.executeQuery("select * from movimientos");
              while (rs.next()) {

                  ultimo_movimiento = rs.getInt("Cod_Movimiento_M");
              }

          } catch (Exception e) {
              e.printStackTrace();
          } finally {

          }

          return ultimo_movimiento;
	}
}
