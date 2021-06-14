package Entidades;

import java.util.Date;

public class Usuario {
	
	private String dni, cuil, usuario, contrasenia, nombre, apellido, nacionalidad, direccion, localidad, provincia, telefono, sexo, mail;
	private int tipo_usuario;
	private boolean estado_usuario;
	private Date fecha_nac;
	
	
	@Override
	public String toString() {
		return "Usuario [dni=" + dni + ", cuil=" + cuil + ", usuario=" + usuario + ", contrasenia=" + contrasenia
				+ ", nombre=" + nombre + ", apellido=" + apellido + ", nacionalidad=" + nacionalidad + ", direccion="
				+ direccion + ", localidad=" + localidad + ", provincia=" + provincia + ", telefono=" + telefono
				+ ", sexo=" + sexo + ", mail=" + mail + ", tipo_usuario=" + tipo_usuario + ", estado_usuario="
				+ estado_usuario + ", fecha_nac=" + fecha_nac + "]";
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getCuil() {
		return cuil;
	}
	public void setCuil(String cuil) {
		this.cuil = cuil;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public int getTipo_usuario() {
		return tipo_usuario;
	}
	public void setTipo_usuario(int tipo_usuario) {
		this.tipo_usuario = tipo_usuario;
	}
	public boolean isEstado_usuario() {
		return estado_usuario;
	}
	public void setEstado_usuario(boolean estado_usuario) {
		this.estado_usuario = estado_usuario;
	}
	public Date getFecha_nac() {
		return fecha_nac;
	}
	public void setFecha_nac(Date fecha_nac) {
		this.fecha_nac = fecha_nac;
	}

}
