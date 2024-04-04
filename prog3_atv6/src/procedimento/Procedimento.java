package procedimento;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import medico.Medico;
import paciente.Paciente;

public class Procedimento {
    private Paciente paciente;
    private Medico medico;
    private Date data;
    private double valor;
    private int tempoDuracao;
    private static List<Procedimento> procedimentos = new ArrayList<>();

    public Procedimento(Paciente paciente, Medico medico, Date data, double valor, int tempoDuracao) {
        this.paciente = paciente;
        this.medico = medico;
        this.data = data;
        this.valor = valor;
        this.tempoDuracao = tempoDuracao;
        procedimentos.add(this); // Adicionando o procedimento na lista
    }

    // Getters e Setters
    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getTempoDuracao() {
        return tempoDuracao;
    }

    public void setTempoDuracao(int tempoDuracao) {
        this.tempoDuracao = tempoDuracao;
    }


    public static void marcar(Medico medico, Paciente paciente, Date data) {
        Procedimento procedimento = new Procedimento(paciente, medico, data, 0.0, 0);
        procedimentos.add(procedimento);
    }

    public static void cancelar(Procedimento procedimento) {
        procedimentos.remove(procedimento);
    }

    public static Procedimento[] pesquisarPorMedico(Medico medico) {
        List<Procedimento> result = new ArrayList<>();
        for (Procedimento procedimento : procedimentos) {
            if (procedimento.getMedico().equals(medico)) {
                result.add(procedimento);
            }
        }
        return result.toArray(new Procedimento[0]);
    }

    public static double calcularTotal() {
        double total = 0.0;
        for (Procedimento procedimento : procedimentos) {
            total += procedimento.getValor();
        }
        return total;
    }
}
