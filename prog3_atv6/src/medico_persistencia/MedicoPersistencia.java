package medico_persistencia;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.util.List;

import java.util.Date;


import especialidade.Especialidade;
import medico.Medico;

public class MedicoPersistencia {
    // Variaveis para armazenar os caminhos dos arquivos CSV
    private static final String CAMINHO_MEDICOS_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/medicos.csv";
    private static final String CAMINHO_PESSOAS_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/pessoas.csv";
    private static final String CAMINHO_ENDERECO_CSV = "/home/gabriel/Documents/programacao/prog3/trabalhos/atividades_5/enderecos.csv";

    public static void salvar(Medico m) throws IOException {
        

    }



    public static void recuperar(int CRM) throws IOException {
        try (BufferedReader medicoReader = new BufferedReader(new FileReader(CAMINHO_MEDICOS_CSV));
             BufferedReader pessoaReader = new BufferedReader(new FileReader(CAMINHO_PESSOAS_CSV));
             BufferedReader enderecoReader = new BufferedReader(new FileReader(CAMINHO_ENDERECO_CSV))) {
    
            // Ignora a primeira linha (cabecalho)
            medicoReader.readLine();
            pessoaReader.readLine();
            enderecoReader.readLine();
    
            String line;
            while ((line = medicoReader.readLine()) != null) {
                // Processa os dados da linha
                String[] data = line.split(",");
    
                int crm = Integer.parseInt(data[0]);
                if (crm == CRM) {
                    int pessoaID = Integer.parseInt(data[1]);
    
                    // Encontra dados da pessoa associada ao medico
                    String pessoaLine;
                    while ((pessoaLine = pessoaReader.readLine()) != null) {
                        String[] pessoaData = pessoaLine.split(",");
                        int pessoaID_atual = Integer.parseInt(pessoaData[0]);
                        if (pessoaID_atual == pessoaID) {
                            String nome = pessoaData[1];
                            long dataNascimento_arq = Long.parseLong(pessoaData[2]);
                            Date dataNascimento = new Date(dataNascimento_arq);
    
                            int enderecoID = Integer.parseInt(pessoaData[3]);
    
                            // Encontra dados do endereco associado a pessoa
                            String enderecoLine;
                            while ((enderecoLine = enderecoReader.readLine()) != null) {
                                String[] enderecoData = enderecoLine.split(",");
                                int EnderecoID_atual = Integer.parseInt(enderecoData[0]);
                                if (EnderecoID_atual == enderecoID) {
                                    String logradouro = enderecoData[1];
                                    int numero = Integer.parseInt(enderecoData[2]);
                                    String bairro = enderecoData[3];
                                    int cep = Integer.parseInt(enderecoData[4]);
    
                                    // Imprimindo os dados do medico
                                    System.out.println("CRM: " + crm);
                                    System.out.println("Nome: " + nome);
                                    System.out.println("Data de Nascimento: " + dataNascimento);
                                    System.out.println("Endereco: " + logradouro + ", " + numero + ", " + bairro + ", CEP: " + cep);
                                    // Imprimindo especialidades e valor da hora
                                    String especialidades = data[data.length - 2];
                                    System.out.print("Especialidades: " + especialidades);

                                    double valorHora = Double.parseDouble(data[data.length - 1]);
                                    System.out.println("\nValor Hora: " + valorHora);
                                    
                                    medicoReader.close();
                                    pessoaReader.close();
                                    enderecoReader.close();
                                    return;
                                }
                            }
                            break;
                        }
                    }
                    medicoReader.close();
                    pessoaReader.close();
                    enderecoReader.close();
                    return;
                }
            }
    
            System.out.println("Medico com CRM " + CRM + " nao foi encontrado");
            medicoReader.close();
            pessoaReader.close();
            enderecoReader.close();
        }
    }    
}
