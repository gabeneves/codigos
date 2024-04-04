package paciente;

import pessoa.Pessoa;
import plano.Plano;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class Paciente extends Pessoa {
    private String cpf;
    private Plano plano;
    private static List<Paciente> pacientes = new ArrayList<>();

    public Paciente(String nome, Date dataNascimento, String logradouro, int numero, int cep, 
                    String bairro, String cpf, String plano_nome, double plano_mensalidade) {
        super(nome, dataNascimento, logradouro, numero, cep, bairro);
        this.cpf = cpf;
        this.plano = new Plano(plano_nome, plano_mensalidade);
        pacientes.add(this); // Adicionando o paciente na lista
    }

    // Getters e Setters
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Plano getPlano() {
        return plano;
    }

    public void setPlano(Plano plano) {
        this.plano = plano;
    }


    public static void cadastrar(Paciente paciente) {
        pacientes.add(paciente);
    }



    public static void alterar(Paciente paciente) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Digite o novo nome:");
        String novoNome = scanner.nextLine();
        paciente.setNome(novoNome);

        System.out.println("Digite a nova data de nascimento (no formato dd/mm/yyyy):");
        String novaDataNascimentoStr = scanner.nextLine();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date novaDataNascimento = dateFormat.parse(novaDataNascimentoStr);
            paciente.setDataNascimento(novaDataNascimento);
        } catch (ParseException e) {
            System.out.println("Formato de data invalido. A data de nascimento nao foi alterada");
        }

        System.out.println("Digite o novo logradouro:");
        String novoLogradouro = scanner.nextLine();

        System.out.println("Digite o novo numero:");
        int novoNumero = scanner.nextInt();
        scanner.nextLine(); // Consumir a quebra de linha

        System.out.println("Digite o novo CEP:");
        int novoCep = scanner.nextInt();
        scanner.nextLine(); // Consumir a quebra de linha

        System.out.println("Digite o novo bairro:");
        String novoBairro = scanner.nextLine();
        
        paciente.setEndereco(novoLogradouro, novoNumero, novoCep, novoBairro);
        
        System.out.println("Digite o novo plano:");
        String nomePlano = scanner.nextLine();
    
        System.out.println("Digite a nova mensalidade:");
        double mensalidade = scanner.nextDouble();
    
        Plano plano = new Plano(nomePlano, mensalidade);
        
        paciente.setPlano(plano);

        System.out.println("Dados do paciente alterados com sucesso");

    }

    public static void excluir(Paciente paciente) {
        pacientes.remove(paciente);
    }

    public static Paciente consultar(String cpf) {
        for (Paciente paciente : pacientes) {
            if (paciente.getCpf().equals(cpf)) {
                return paciente;
            }
        }
        return null;
    }

    public static List<Paciente> consultar(String nome, Date dataNascimento) {
        List<Paciente> result = new ArrayList<>();
        for (Paciente paciente : pacientes) {
            if (paciente.getNome().equals(nome) && paciente.getDataNascimento().equals(dataNascimento)) {
                result.add(paciente);
            }
        }
        return result;
    }
}
