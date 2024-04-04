package paciente_persistencia;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Date;

import paciente.Paciente;

public class PacientePersistencia {
    // Variaveis para armazenar os caminhos dos arquivos CSV
    private static final String CAMINHO_PACIENTES_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/pacientes.csv";
    private static final String CAMINHO_PESSOAS_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/pessoas.csv";
    private static final String CAMINHO_ENDERECO_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/enderecos.csv";
    private static final String CAMINHO_PLANOS_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/planos.csv";

    public static void salvar(Paciente paciente) throws IOException {
        File file = new File(CAMINHO_PACIENTES_CSV);
        boolean arquivoVazio = !file.exists() || file.length() == 0;
        PrintStream ps = new PrintStream(new FileOutputStream(file, true));

        // Verificar se o CPF do paciente ja existe
        if (!existeCPF(paciente.getCpf())) {
            // Se nao existir, atribui um novo Pessoa_ID e Endereco_ID
            int novoPessoaID = getPessoaID();
            int novoEnderecoID = getEnderecoID();
            int novoPlanoID = getPlanoID();

            // Salva dados da pessoa associada ao paciente
            salvarPessoa(novoPessoaID, paciente.getNome(), paciente.getDataNascimento(), novoEnderecoID);

            // Salva dados do endereco associado ao paciente
            salvarEndereco(novoEnderecoID, paciente.getEndereco().getLogradouro(), paciente.getEndereco().getNumero(),
                    paciente.getEndereco().getBairro(), paciente.getEndereco().getCep());

            // Salva dados do plano associado ao paciente
            salvarPlano(novoPlanoID, paciente.getPlano().getNome(), paciente.getPlano().getMensalidade());

            // Salva dados do paciente
            if (arquivoVazio) {
                ps.println("CPF,Pessoa_ID,Endereco_ID,Plano_ID");
            }

            ps.println(paciente.getCpf() + "," + novoPessoaID + "," + novoEnderecoID + "," + novoPlanoID);

            ps.close();
            return;
        }

        System.out.println("Erro: Ja existe o/a paciente " + paciente.getNome() + " registrado(a) no Banco de Dados");
        ps.close();
    }

    private static boolean existeCPF(String cpf) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(CAMINHO_PACIENTES_CSV))) {
            String line;
            reader.readLine(); // Ignorar cabeçalho
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                String CPF_atual = parts[0];
                if (CPF_atual.equals(cpf)) {
                    return true;
                }
            }
        }
        return false;
    }
    

    private static int getPessoaID() throws IOException {
        File file = new File(CAMINHO_PESSOAS_CSV);
        
        // Se o arquivo nao existir, cria um novo arquivo e retorna o ID como 0
        if (!file.exists()) {
            file.createNewFile();
            return 0;
        }    

        try (BufferedReader reader = new BufferedReader(new FileReader(CAMINHO_PESSOAS_CSV))) {
            int maxID = -1;
            String line = reader.readLine(); // Ignora a primeira linha do cabecalho
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                int ID_atual = Integer.parseInt(parts[0]);
                
                maxID = Math.max(maxID, ID_atual);
            }
            return maxID + 1; // Novo ID eh o maximo atual + 1
        }
    }

    private static int getEnderecoID() throws IOException {
        File file = new File(CAMINHO_ENDERECO_CSV);
        
        // Se o arquivo nao existir, criar um novo arquivo e retorna o ID como 0
        if (!file.exists()) {
            file.createNewFile();
            return 0;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(CAMINHO_ENDERECO_CSV))) {
            int maxID = -1;
            String line = reader.readLine(); // Ignora a primeira linha do cabeçalho
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                int ID_atual = Integer.parseInt(parts[0]);

                maxID = Math.max(maxID, ID_atual);
            }
            return maxID + 1; // Novo ID eh o maximo atual + 1
        }
    }

    private static int getPlanoID() throws IOException {
        File file = new File(CAMINHO_PLANOS_CSV);

        // Se o arquivo nao existir, criar um novo arquivo e retornar o ID como 0
        if (!file.exists()) {
            file.createNewFile();
            return 0;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(CAMINHO_PLANOS_CSV))) {
            int maxID = -1;
            String line = reader.readLine(); // Ignora a primeira linha do cabeçalho
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                int ID_atual = Integer.parseInt(parts[0]);

                maxID = Math.max(maxID, ID_atual);
            }
            return maxID + 1; // Novo ID eh o maximo atual + 1
        }
    }


    private static void salvarPessoa(int pessoaID, String nome, Date dataNascimento, int enderecoID) throws IOException {
        File file = new File(CAMINHO_PESSOAS_CSV);
        boolean arquivoVazio = !file.exists() || file.length() == 0;
        PrintStream ps = new PrintStream(new FileOutputStream(file, true));
    
        // Salvar dados da pessoa
        if (arquivoVazio) {
            ps.println("Pessoa_ID,nome,data_nascimento,Endereco_ID");
        }
    
        ps.println(pessoaID + "," + nome + "," + dataNascimento.getTime() + "," + enderecoID);
    
        ps.close();
    }

    private static void salvarEndereco(int enderecoID, String logradouro, int numero, String bairro, int cep) throws IOException {
        File file = new File(CAMINHO_ENDERECO_CSV);
        boolean arquivoVazio = !file.exists() || file.length() == 0;
        PrintStream ps = new PrintStream(new FileOutputStream(file, true));
    
        // Salvar dados do endereço
        if (arquivoVazio) {
            ps.println("Endereco_ID,Logradouro,Numero,Bairro,Cep");
        }
    
        ps.println(enderecoID + "," + logradouro + "," + numero + "," + bairro + "," + cep);
    
        ps.close();
    }

    private static void salvarPlano(int planoID, String nome, double mensalidade) throws IOException {
        File file = new File(CAMINHO_PLANOS_CSV);
        boolean arquivoVazio = !file.exists() || file.length() == 0;
        PrintStream ps = new PrintStream(new FileOutputStream(file, true));

        // Salvar dados do plano
        if (arquivoVazio) {
            ps.println("Plano_ID,plano_nome,plano_mensalidade");
        }

        ps.println(planoID + "," + nome + "," + mensalidade);

        ps.close();
    }

    public static void recuperar(String CPF) throws IOException {
        try (BufferedReader pacienteReader = new BufferedReader(new FileReader(CAMINHO_PACIENTES_CSV));
             BufferedReader pessoaReader = new BufferedReader(new FileReader(CAMINHO_PESSOAS_CSV));
             BufferedReader enderecoReader = new BufferedReader(new FileReader(CAMINHO_ENDERECO_CSV));
             BufferedReader planoReader = new BufferedReader(new FileReader(CAMINHO_PLANOS_CSV))) {
    
            // Ignora a primeira linha (cabecalho)
            pacienteReader.readLine();
            pessoaReader.readLine();
            enderecoReader.readLine();
            planoReader.readLine();
    
            String line;
            while ((line = pacienteReader.readLine()) != null) {
                // Processa os dados da linha
                String[] data = line.split(",");
    
                String pacienteCPF = data[0];
                if (pacienteCPF.equals(CPF)) {
                    int pessoaID = Integer.parseInt(data[1]);
                    int enderecoID = Integer.parseInt(data[2]);
                    int planoID = Integer.parseInt(data[3]);
    
                    // Encontra dados da pessoa associada ao paciente
                    String pessoaLine;
                    while ((pessoaLine = pessoaReader.readLine()) != null) {
                        String[] pessoaData = pessoaLine.split(",");
                        int pessoaID_atual = Integer.parseInt(pessoaData[0]);
                        if (pessoaID_atual == pessoaID) {
                            String nome = pessoaData[1];
                            long dataNascimento_arq = Long.parseLong(pessoaData[2]);
                            Date dataNascimento = new Date(dataNascimento_arq);
    
                            // Encontra dados do endereco associado a pessoa
                            String enderecoLine;
                            while ((enderecoLine = enderecoReader.readLine()) != null) {
                                String[] enderecoData = enderecoLine.split(",");
                                int enderecoID_atual = Integer.parseInt(enderecoData[0]);
                                if (enderecoID_atual == enderecoID) {
                                    String logradouro = enderecoData[1];
                                    int numero = Integer.parseInt(enderecoData[2]);
                                    String bairro = enderecoData[3];
                                    int cep = Integer.parseInt(enderecoData[4]);
    
                                    // Encontra dados do plano associado ao paciente
                                    String planoLine;
                                    while ((planoLine = planoReader.readLine()) != null) {
                                        String[] planoData = planoLine.split(",");
                                        int planoID_atual = Integer.parseInt(planoData[0]);
                                        if (planoID_atual == planoID) {
                                            String nomePlano = planoData[1];
                                            double mensalidadePlano = Double.parseDouble(planoData[2]);
    
                                            // Imprimir os dados do paciente
                                            System.out.println("CPF: " + CPF);
                                            System.out.println("Nome: " + nome);
                                            System.out.println("Data de Nascimento: " + dataNascimento);
                                            System.out.println("Endereco: " + logradouro + ", " + numero + ", " + bairro + ", CEP: " + cep);
                                            System.out.println("Plano: " + nomePlano);
                                            System.out.println("Mensalidade do Plano: " + mensalidadePlano);
    
                                            pacienteReader.close();
                                            pessoaReader.close();
                                            enderecoReader.close();
                                            planoReader.close();
                                            return;
                                        }
                                    }
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    pacienteReader.close();
                    pessoaReader.close();
                    enderecoReader.close();
                    planoReader.close();
                    return;
                }
            }
    
            System.out.println("Paciente com CPF " + CPF + " nao foi encontrado");
        }
    }    
}
