package Entidades;

import java.math.BigDecimal;
import java.sql.Date;

public class Movimientos {

    private int codMovimiento, numCuentaMov,tipoMovimiento;
    private Float importe;
    private Date fechaMov;
    private String mensaje;

    public int getCodMovimiento() {
        return codMovimiento;
    }
    public void setCodMovimiento(int codMovimiento) {
        this.codMovimiento = codMovimiento;
    }
    public int getNumCuentaMov() {
        return numCuentaMov;
    }
    public void setNumCuentaMov(int numCuentaMov) {
        this.numCuentaMov = numCuentaMov;
    }
    public int getTipoMovimiento() {
        return tipoMovimiento;
    }
    public void setTipoMovimiento(int tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }
    public Float getImporte() {
        return importe;
    }
    public void setImporte(Float importe) {
        this.importe = importe;
    }
    public Date getFechaMov() {
        return fechaMov;
    }
    public void setFechaMov(Date fechaMov) {
        this.fechaMov = fechaMov;
    }
    public String getMensaje() {
        return mensaje;
    }
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }



}