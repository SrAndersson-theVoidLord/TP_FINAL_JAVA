package Entidades;
import java.sql.Date;

public class Prestamo {

	private int Nro_Prestamo;
	private int Nro_Cuenta;
	private Date Fecha_Alta;
	private float Importe_Prestamo;
	private float Importe_Total_Pagar;
	private int Plazo_Meses;
	private  float Monto_Mensual;
	private  float Saldo_Restante;
	private int Cuotas_Restantes;
	private boolean Estado_Prestamo;
	
	public int getNro_Prestamo() {
		return Nro_Prestamo;
	}

	public void setNro_Prestamo(int nro_Prestamo) {
		Nro_Prestamo = nro_Prestamo;
	}

	public int getNro_Cuenta() {
		return Nro_Cuenta;
	}

	public void setNro_Cuenta(int nro_Cuenta) {
		Nro_Cuenta = nro_Cuenta;
	}

	public Date getFecha_Alta() {
		return Fecha_Alta;
	}

	public void setFecha_Alta(Date fecha_Alta) {
		Fecha_Alta = fecha_Alta;
	}

	public float getImporte_Prestamo() {
		return Importe_Prestamo;
	}

	public void setImporte_Prestamo(float importe_Prestamo) {
		Importe_Prestamo = importe_Prestamo;
	}

	public float getImporte_Total_Pagar() {
		return Importe_Total_Pagar;
	}

	public void setImporte_Total_Pagar(float importe_Total_Pagar) {
		Importe_Total_Pagar = importe_Total_Pagar;
	}

	public int getPlazo_Meses() {
		return Plazo_Meses;
	}

	public void setPlazo_Meses(int plazo_Meses) {
		Plazo_Meses = plazo_Meses;
	}

	public float getMonto_Mensual() {
		return Monto_Mensual;
	}

	public void setMonto_Mensual(float monto_Mensual) {
		Monto_Mensual = monto_Mensual;
	}

	public float getSaldo_Restante() {
		return Saldo_Restante;
	}

	public void setSaldo_Restante(float saldo_Restante) {
		Saldo_Restante = saldo_Restante;
	}

	public int getCuotas_Restantes() {
		return Cuotas_Restantes;
	}

	public void setCuotas_Restantes(int cuotas_Restantes) {
		Cuotas_Restantes = cuotas_Restantes;
	}

	public boolean isEstado_Prestamo() {
		return Estado_Prestamo;
	}

	public void setEstado_Prestamo(boolean estado_Prestamo) {
		Estado_Prestamo = estado_Prestamo;
	}

	@Override
	public String toString() {
		return "Reporte [Nro_Prestamo=" + Nro_Prestamo + ", Nro_Cuenta=" + Nro_Cuenta + ", Fecha_Alta=" + Fecha_Alta
				+ ", Importe_Prestamo=" + Importe_Prestamo + ", Importe_Total_Pagar=" + Importe_Total_Pagar
				+ ", Plazo_Meses=" + Plazo_Meses + ", Monto_Mensual=" + Monto_Mensual + ", Saldo_Restante="
				+ Saldo_Restante + ", Cuotas_Restantes=" + Cuotas_Restantes + ", Estado_Prestamo=" + Estado_Prestamo
				+ "]";
	}
}
