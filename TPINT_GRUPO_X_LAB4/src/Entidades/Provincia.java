package Entidades;

public class Provincia {
	private int id_provincia;
	private String desc_provincia;
	
	
	@Override
	public String toString() {
		return "Provincia [id_provincia=" + id_provincia + ", desc_provincia=" + desc_provincia + "]";
	}
	
	public int getId_provincia() {
		return id_provincia;
	}
	public void setId_provincia(int id_provincia) {
		this.id_provincia = id_provincia;
	}
	public String getDesc_provincia() {
		return desc_provincia;
	}
	public void setDesc_provincia(String desc_provincia) {
		this.desc_provincia = desc_provincia;
	}
}