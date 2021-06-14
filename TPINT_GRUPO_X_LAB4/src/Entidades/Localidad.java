package Entidades;

public class Localidad {
private int id_localidad, id_pvc;
private String desc_localidad;

public int getId_pvc() {
	return id_pvc;
}


public void setId_pvc(int id_pvc) {
	this.id_pvc = id_pvc;
}



@Override
public String toString() {
	return "Localidad [id_localidad=" + id_localidad + ", desc_localidad=" + desc_localidad + "]";
}


public int getId_localidad() {
	return id_localidad;
}
public void setId_localidad(int id_localidad) {
	this.id_localidad = id_localidad;
}
public String getDesc_localidad() {
	return desc_localidad;
}
public void setDesc_localidad(String desc_localidad) {
	this.desc_localidad = desc_localidad;
}


}