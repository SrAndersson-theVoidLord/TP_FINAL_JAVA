package Exepciones;

public class DivisionException extends ArithmeticException{
    public DivisionException() {

    }

    @Override
    public String getMessage() {
        // TODO Auto-generated method stub
        return "No se puede dividir por cero.";
    }


}
