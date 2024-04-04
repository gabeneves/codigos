package consulta;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import medico.Medico;
import paciente.Paciente;

public class Consulta {
    private Paciente paciente;
    private Medico medico;
    private Date data;
    private static List<Consulta> consultas = new ArrayList<>();

    public Consulta(Paciente paciente, Medico medico, Date data) {
        this.paciente = paciente;
        this.medico = medico;
        this.data = data;
        consultas.add(this); // Adicionando a consulta na lista
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


    public static void marcar(Medico medico, Paciente paciente, Date data) {
        Consulta consulta = new Consulta(paciente, medico, data);
        consultas.add(consulta);
    }

    public static void cancelar(Consulta consulta) {
        consultas.remove(consulta);
    }

    public static Consulta[] pesquisarPorPaciente(Paciente paciente) {
        List<Consulta> result = new ArrayList<>();
        for (Consulta consulta : consultas) {
            if (consulta.getPaciente().equals(paciente)) {
                result.add(consulta);
            }
        }
        return result.toArray(new Consulta[0]);
    }
}