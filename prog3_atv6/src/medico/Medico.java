package medico;
import pessoa.Pessoa;
import especialidade.Especialidade;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class Medico extends Pessoa {
    private int crm;
    private List<Especialidade> especialidades;
    private double valorHora;
    private static List<Medico> medicos = new ArrayList<>();

    public Medico(String nome, Date dataNascimento, String logradouro, int numero, int cep, String bairro, int crm, double valorHora) {
        super(nome, dataNascimento, logradouro, numero, cep, bairro);
        this.crm = crm;
        this.valorHora = valorHora;
        this.especialidades = new ArrayList<>();
        medicos.add(this); // Adicionando o medico na lista
    }

    // Getters e Setters
    public int getCrm() {
        return crm;
    }

    public void setCrm(int crm) {
        this.crm = crm;
    }

    public List<Especialidade> getEspecialidades() {
        return especialidades;
    }

    public void setEspecialidades(List<Especialidade> especialidades) {
        this.especialidades = especialidades;
    }

    public double getValorHora() {
        return valorHora;
    }

    public void setValorHora(double valorHora) {
        this.valorHora = valorHora;
    }


    public static void cadastrar(Medico medico) {
        medicos.add(medico);
    }

    public static void alterar(Medico medico) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Digite o novo nome:");
        String novoNome = scanner.nextLine();
        medico.setNome(novoNome);

        System.out.println("Digite a nova data de nascimento (no formato dd/MM/yyyy):");
        String novaDataNascimentoStr = scanner.nextLine();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date novaDataNascimento = dateFormat.parse(novaDataNascimentoStr);
            medico.setDataNascimento(novaDataNascimento);
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

        medico.setEndereco(novoLogradouro, novoNumero, novoCep, novoBairro);

        System.out.println("Digite o novo CRM:");
        int novoCrm = scanner.nextInt();
        scanner.nextLine(); // Consumir a quebra de linha
        medico.setCrm(novoCrm);

        System.out.println("Digite o novo valor da hora de trabalho:");
        double novoValorHora = scanner.nextDouble();
        medico.setValorHora(novoValorHora);

        System.out.println("Dados do medico alterados com sucesso");

    }

    public static void excluir(Medico medico) {
        medicos.remove(medico);
    }

    public static Medico consultar(int crm) {
        for (Medico medico : medicos) {
            if (medico.getCrm() == crm) {
                return medico;
            }
        }
        return null;
    }

    public static List<Medico> consultar(String nome) {
        List<Medico> result = new ArrayList<>();
        for (Medico medico : medicos) {
            if (medico.getNome().equals(nome)) {
                result.add(medico);
            }
        }
        return result;
    }
}
