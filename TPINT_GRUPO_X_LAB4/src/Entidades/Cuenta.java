package Entidades;

import java.sql.Date;

public class Cuenta {
	private int nro_Cuenta,tipo_Cuenta;
	private String CBU_Cuenta;
	private String dni;
	private float saldo_Cuenta;
	private Date fecha_alta_Cuenta;
	private boolean estado_Cuenta;
	
	
	@Override
	public String toString() {
		return "Cuenta [nro_Cuenta=" + nro_Cuenta + ", tipo_Cuenta=" + tipo_Cuenta + ", CBU_Cuenta=" + CBU_Cuenta
				+ ", dni=" + dni + ", saldo_Cuenta=" + saldo_Cuenta + ", fecha_alta_Cuenta=" + fecha_alta_Cuenta
				+ ", estado_Cuenta=" + estado_Cuenta + "]";
	}
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public int getNro_Cuenta() {
		return nro_Cuenta;
	}
	public void setNro_Cuenta(int nro_Cuenta) {
		this.nro_Cuenta = nro_Cuenta;
	}
	public String getCBU_Cuenta() {
		return CBU_Cuenta;
	}
	public void setCBU_Cuenta(String cBU_Cuenta) {
		CBU_Cuenta = cBU_Cuenta;
	}
	public int getTipo_Cuenta() {
		return tipo_Cuenta;
	}
	public void setTipo_Cuenta(int tipo_Cuenta) {
		this.tipo_Cuenta = tipo_Cuenta;
	}
	public float getSaldo_Cuenta() {
		return saldo_Cuenta;
	}
	public void setSaldo_Cuenta(float saldo_Cuenta) {
		this.saldo_Cuenta = saldo_Cuenta;
	}
	public Date getFecha_alta_Cuenta() {
		return fecha_alta_Cuenta;
	}
	public void setFecha_alta_Cuenta(Date fecha_alta_Cuenta) {
		this.fecha_alta_Cuenta = fecha_alta_Cuenta;
	}
	public boolean isEstado_Cuenta() {
		return estado_Cuenta;
	}
	public void setEstado_Cuenta(boolean estado_Cuenta) {
		this.estado_Cuenta = estado_Cuenta;
	}
	
	
}
