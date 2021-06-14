package DaoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Dao.DaoProvincia;
import Entidades.Provincia;

public class DaoProvinciaImpl implements DaoProvincia {
	
	public ArrayList<Provincia> listarProvincias() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Provincia> provincias = new ArrayList<Provincia>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement st = conexion.createStatement();

			ResultSet rs = st.executeQuery(
					"select pvcId, pvcDescripcion from provincia order by pvcDescripcion");
			while (rs.next()) {
				Provincia provinciart = new Provincia();
				provinciart.setId_provincia(rs.getInt("pvcId"));
				provinciart.setDesc_provincia(rs.getString("pvcDescripcion"));
				provincias.add(provinciart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return provincias;
	}
	

}