package DaoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Dao.DaoLocalidad;
import Entidades.Localidad;

public class DaoLocalidadImpl implements DaoLocalidad{
	
	public ArrayList<Localidad> listarLocalidades() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Localidad> localidades = new ArrayList<Localidad>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(
					"select locId, locDescripcion, loc_pvcId from localidad");
			while (rs.next()) {
				Localidad local= new Localidad();
				local.setId_pvc(rs.getInt("loc_pvcId"));
				local.setId_localidad(rs.getInt("locId"));
				local.setDesc_localidad(rs.getString("locDescripcion"));
				localidades.add(local);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return localidades;
	}
}