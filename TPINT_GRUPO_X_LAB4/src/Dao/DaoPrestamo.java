package Dao;

import java.util.ArrayList;

import Entidades.Prestamo;
import Entidades.Usuario;

public interface DaoPrestamo {

	public float IngresoMensual();

	public float IngresoAnual();

	public float IngresoTotal();

	public ArrayList<Prestamo> ListarPrestamosMes();

	public ArrayList<Prestamo> ListarPrestamosAnual();

	public ArrayList<Prestamo> ListarPrestamosTotal();

	public ArrayList<Prestamo> ListarPrestamosEntreFechas(int mes1, int año1,int mes2,int año2);

	public ArrayList<Prestamo> ListarPrestamosAutorizar();

	public boolean RechazarPrestamo(Prestamo prest);

	public boolean AprobarPrestamo(Prestamo prest);
	
	public int insert(Prestamo p);
	
    public int TraerUltimoNroPrestamo();
    
    public ArrayList<Prestamo> listarPrestamosPorUsuario(Usuario user);
    
	public boolean actualizarPrestamo(Prestamo prestamo);
	
	public boolean darBajaPrestamo(Prestamo prestamo);

	
	}
