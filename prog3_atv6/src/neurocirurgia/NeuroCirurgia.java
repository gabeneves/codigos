package neurocirurgia;

import medico.Medico;
import paciente.Paciente;
import java.util.Date;
import procedimento.Procedimento;;

public class NeuroCirurgia extends Procedimento {

    public NeuroCirurgia(Paciente paciente, Medico medico, Date data, double valor, int tempoDuracao) {
        super(paciente, medico, data, valor, tempoDuracao);
    }


    public void imprime() {
        System.out.println("Imprimindo informacoes sobre NeuroCirurgia...");
        System.out.println("Paciente: " + getPaciente().getNome());
        System.out.println("Medico: " + getMedico().getNome());
        System.out.println("Data: " + getData());
        System.out.println("Valor: " + getValor());
        System.out.println("Tempo de Duracao: " + getTempoDuracao() + " minutos");
    }
}
