package endereco;

public class Endereco {
    private String logradouro;
    private int numero;
    private int cep;
    private String bairro;

    public Endereco(String logradouro, int numero, int cep, String bairro) {
        this.logradouro = logradouro;
        this.numero = numero;
        this.cep = cep;
        this.bairro = bairro;
    }

    // Getters e Setters
    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCep() {
        return cep;
    }

    public void setCep(int cep) {
        this.cep = cep;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
}
