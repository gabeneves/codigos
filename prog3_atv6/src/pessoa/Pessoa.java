package pessoa;

import java.util.Date;
import endereco.Endereco;

public class Pessoa {
    private String nome;
    private Date dataNascimento;
    private Endereco endereco;

    public Pessoa(String nome, Date dataNascimento, String logadouro, int numero, int cep, String bairro) {
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        setEndereco(logadouro, numero, cep, bairro);
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(String logadouro, int numero, int cep, String bairro) {
        endereco = new Endereco(logadouro, numero, cep, bairro);
    }
}
