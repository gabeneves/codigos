package faringoplastia;

import medico.Medico;
import paciente.Paciente;
import procedimento.Procedimento;

import java.util.Date;

public class Faringoplastia extends Procedimento {

    public Faringoplastia(Paciente paciente, Medico medico, Date data, double valor, int tempoDuracao) {
        super(paciente, medico, data, valor, tempoDuracao);
    }


    public void imprime() {
        System.out.println("Imprimindo informacoes sobre Faringoplastia...");
        System.out.println("Paciente: " + getPaciente().getNome());
        System.out.println("Medico: " + getMedico().getNome());
        System.out.println("Data: " + getData());
        System.out.println("Valor: " + getValor());
        System.out.println("Tempo de Duracao: " + getTempoDuracao() + " minutos");
    }
}
