// Projeto em andamento

package main;

import paciente.Paciente;
import medico.Medico;
import medico_persistencia.MedicoPersistencia;
import consulta.Consulta;
import especialidade.Especialidade;
import procedimento.Procedimento;
import faringoplastia.Faringoplastia;
import neurocirurgia.NeuroCirurgia;
import medico_persistencia.MedicoPersistencia;
import paciente_persistencia.PacientePersistencia;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        
        Paciente paciente1 = new Paciente("Joao", new Date(), "Rua A", 123, 12345, "Bairro A", "12345678900", "SUS", 0);
        Paciente paciente2 = new Paciente("Maria", new Date(), "Rua B", 456, 54321, "Bairro B", "98765432100", "UNIMED", 2500);

        
        Medico medico1 = new Medico("Dr. Carlos", new Date(), "Rua X", 111, 11111, "Bairro X", 12345, 100.0);
        List<Especialidade> especialidadesMedico1 = new ArrayList<>();
        especialidadesMedico1.add(new Especialidade("Cirurgiao"));
        especialidadesMedico1.add(new Especialidade("Ortopedista"));
        medico1.setEspecialidades(especialidadesMedico1);

        Medico medico2 = new Medico("Dr. Ana", new Date(), "Rua Y", 222, 22222, "Bairro Y", 54321, 120.0);
        List<Especialidade> especialidadesMedico2 = new ArrayList<>();
        especialidadesMedico2.add(new Especialidade("Oftalmologista"));
        especialidadesMedico2.add(new Especialidade("Pediatra"));
        medico2.setEspecialidades(especialidadesMedico2);


        

        // System.out.println("Salvando dados do medico 1...");
        // MedicoPersistencia.salvar(medico1);
        // System.out.println("Recuperando dados do medico 1:");
        // MedicoPersistencia.recuperar(12345);
        // System.out.println("\n\nSalvando dados do medico 2...");
        // MedicoPersistencia.salvar(medico2);
        // System.out.println("Recuperando dados do medico 2:");
        // MedicoPersistencia.recuperar(54321);
        // System.out.println("\n\n");


        // System.out.println("Salvando dados do paciente 1...");
        // PacientePersistencia.salvar(paciente1);
        // System.out.println("Recuperando dados do paciente 1:");
        // PacientePersistencia.recuperar("12345678900");
        // System.out.println("\n\nSalvando dados do paciente 2...");
        // PacientePersistencia.salvar(paciente2);
        // System.out.println("Recuperando dados do paciente 2:");
        // PacientePersistencia.recuperar("98765432100");
    }
}
