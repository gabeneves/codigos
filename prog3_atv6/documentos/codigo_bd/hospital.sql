# CREATE SCHEMA `hospital`; # Cria a database do Hospital



# Relacao Endereco
CREATE TABLE ENDERECO (    
    # Endereco
    Logradouro_end VARCHAR(15) NOT NULL, # Rua onde mora
    Numero_end INT NOT NULL, # Numero da casa/apt. onde mora
    Cep_end CHAR(8) NOT NULL, # Numero do Cep da rua/cidade onde mora
    Bairro_end VARCHAR(15) NOT NULL, # Bairro onde mora
    
    INDEX Idx_Numero_end(Numero_end), # Criando index
	INDEX Idx_Cep_end(Cep_end), # Criando index
    INDEX Idx_Bairro_end(Bairro_end), # Criando index
    
    # Chave Principal
    CONSTRAINT CHPENDERECO
		PRIMARY KEY(Logradouro_end, Numero_end, Cep_end, Bairro_end)
);



# Relacao Pessoa
CREATE TABLE PESSOA (
	Nome VARCHAR(10) NOT NULL, # Nome da pessoa
    Data_nascimento DATE NOT NULL, # Data de nascimento
    
    Logradouro_end VARCHAR(15), # Rua onde mora
    Numero_end INT, # Numero da casa/apt. onde mora
    Cep_end CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end VARCHAR(15), # Bairro onde mora
    
	INDEX Idx_Data_nascimento(Data_nascimento), # Criando index
    INDEX Idx_Logradouro_end(Logradouro_end), # Criando index
    INDEX Idx_Numero_end(Numero_end), # Criando index
    INDEX Idx_Cep_end(Cep_end), # Criando index
    INDEX Idx_Bairro_end(Bairro_end), # Criando index
    
    # Chave Principal
    CONSTRAINT CHPPESSOA
		PRIMARY KEY(NOME, Data_nascimento),
        
	# Chaves Estrangeiras:
    # Logradouro
	CONSTRAINT CHELOGRAPESSOA
        FOREIGN KEY (Logradouro_end) REFERENCES ENDERECO(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMPESSOA
        FOREIGN KEY (Numero_end) REFERENCES ENDERECO(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPPESSOA
        FOREIGN KEY (Cep_end) REFERENCES ENDERECO(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROPESSOA
        FOREIGN KEY (Bairro_end) REFERENCES ENDERECO(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE
);



# Relacao Plano
CREATE TABLE PLANO (
    Plano_nome VARCHAR(10) NOT NULL, # Nome do plano do paciente
    Plano_mensalidade INT NOT NULL, # Mensalidade do plano do paciente
    
    INDEX Idx_Plano_mensalidade (Plano_mensalidade), # Criando Index
    
    CONSTRAINT CHPNOMEPLANO
		PRIMARY KEY(Plano_nome)
);



# Relacao Paciente
CREATE TABLE PACIENTE (
	Cpf CHAR(11) NOT NULL, # Cpf do paciente
    Plano_nome VARCHAR(10), # Nome do plano do paciente
    Plano_mensalidade INT, # Mensalidade do plano do paciente
    Nome VARCHAR(10), # Nome do paciente
    Data_nascimento DATE, # Data de nascimento
    
    # Endereco
    Logradouro_end VARCHAR(15), # Rua onde mora
    Numero_end INT, # Numero da casa/apt. onde mora
    Cep_end CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end VARCHAR(15), # Bairro onde mora
    
    
    # Chave Primaria:
    CONSTRAINT CHPCPFPACIENTE
		PRIMARY KEY(Cpf),
	
    # Chaves estrangeiras de pessoa:
    # Nome
	CONSTRAINT CHENOMEPACIENTE
        FOREIGN KEY (Nome) REFERENCES PESSOA(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCPACIENTE
        FOREIGN KEY (Data_nascimento) REFERENCES PESSOA(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAPACIENTE
        FOREIGN KEY (Logradouro_end) REFERENCES PESSOA(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMPACIENTE
        FOREIGN KEY (Numero_end) REFERENCES PESSOA(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPPACIENTE
        FOREIGN KEY (Cep_end) REFERENCES PESSOA(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROPACIENTE
        FOREIGN KEY (Bairro_end) REFERENCES PESSOA(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
    
    # Nome do Plano
	CONSTRAINT CHENOMEPLANOPACIENTE
        FOREIGN KEY (Plano_nome) REFERENCES PLANO(Plano_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Mensalidade do Plano
	CONSTRAINT CHEMENSPLANOPACIENTE
        FOREIGN KEY (Plano_mensalidade) REFERENCES PLANO(Plano_mensalidade)
        ON DELETE SET NULL ON UPDATE CASCADE
);



# Relacao Especialidade
CREATE TABLE ESPECIALIDADE (
    Especialidade_nome VARCHAR(10) NOT NULL, # Nome da especialidade do medico
    
    CONSTRAINT CHPESPNOME
		PRIMARY KEY(Especialidade_nome)
);



# Relacao Medico
CREATE TABLE MEDICO (
	Crm CHAR(9) NOT NULL, # Crm do medico
	Valor_hora DOUBLE NOT NULL, # Valor que o medico ganha por hora
    Especialidade_nome VARCHAR(10), # Nome da especialidade do medico
    
    Nome VARCHAR(10), # Nome do paciente
    Data_nascimento DATE, # Data de nascimento
    
    INDEX Idx_valor_hora (Valor_hora), # Criando Index
    
    # Endereco
    Logradouro_end VARCHAR(15), # Rua onde mora
    Numero_end INT, # Numero da casa/apt. onde mora
    Cep_end CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end VARCHAR(15), # Bairro onde mora
	
    # Chave Primaria:
    CONSTRAINT CHPCRMMEDICO
		PRIMARY KEY(Crm),   

    # Chaves estrangeiras de pessoa:
    # Nome da Especialidade
	CONSTRAINT CHEESPMEDICO
        FOREIGN KEY (Especialidade_nome) REFERENCES ESPECIALIDADE(Especialidade_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Nome
	CONSTRAINT CHENOMEMEDICO
        FOREIGN KEY (Nome) REFERENCES PESSOA(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCMEDICO
        FOREIGN KEY (Data_nascimento) REFERENCES PESSOA(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAMEDICO
        FOREIGN KEY (Logradouro_end) REFERENCES PESSOA(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMMEDICO
        FOREIGN KEY (Numero_end) REFERENCES PESSOA(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPMEDICO
        FOREIGN KEY (Cep_end) REFERENCES PESSOA(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROMEDICO
        FOREIGN KEY (Bairro_end) REFERENCES PESSOA(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE
);



# Relacao Consulta
CREATE TABLE CONSULTA (
	Data_consulta DATE NOT NULL, # Data da consulta
	
    # Medico
    Crm CHAR(9), # Crm do medico
	Valor_hora DOUBLE, # Valor que o medico ganha por hora
    Especialidade_nome VARCHAR(10), # Nome da especialidade do medico
    
    Nome_medico VARCHAR(10), # Nome do paciente
    Data_nascimento_medico DATE, # Data de nascimento
    
    # Endereco
    Logradouro_end_medico VARCHAR(15), # Rua onde mora
    Numero_end_medico INT, # Numero da casa/apt. onde mora
    Cep_end_medico CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end_medico VARCHAR(15), # Bairro onde mora
    
    # Paciente
	Cpf_paciente CHAR(11), # Cpf do paciente
    Plano_nome VARCHAR(10), # Nome do plano do paciente
    Plano_mensalidade INT, # Mensalidade do plano do paciente
    Nome_paciente VARCHAR(10), # Nome do paciente
    Data_nascimento_paciente DATE, # Data de nascimento
    
    # Endereco
    Logradouro_end_paciente VARCHAR(15), # Rua onde mora
    Numero_end_paciente INT, # Numero da casa/apt. onde mora
    Cep_end_paciente CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end_paciente VARCHAR(15), # Bairro onde mora
	
    # Chave Primaria:
    CONSTRAINT CHPDATACONSULTA
		PRIMARY KEY(Data_consulta),   


    # Chaves estrangeiras medico:
	# Crm
	CONSTRAINT CHECRMMCONSULTA
        FOREIGN KEY (Crm) REFERENCES MEDICO(Crm)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
	# Valor hora
	CONSTRAINT CHEVALORHRMCONSULTA
        FOREIGN KEY (Valor_hora) REFERENCES MEDICO(Valor_hora)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Nome da Especialidade
	CONSTRAINT CHEESPMCONSULTA
        FOREIGN KEY (Especialidade_nome) REFERENCES MEDICO(Especialidade_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Nome
	CONSTRAINT CHENOMEMCONSULTA
        FOREIGN KEY (Nome_medico) REFERENCES MEDICO(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCMCONSULTA
        FOREIGN KEY (Data_nascimento_medico) REFERENCES MEDICO(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAMCONSULTA
        FOREIGN KEY (Logradouro_end_medico) REFERENCES MEDICO(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMMCONSULTA
        FOREIGN KEY (Numero_end_medico) REFERENCES MEDICO(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPMCONSULTA
        FOREIGN KEY (Cep_end_medico) REFERENCES MEDICO(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROMCONSULTA
        FOREIGN KEY (Bairro_end_medico) REFERENCES MEDICO(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,


	# Chaves estrangeiras paciente:
    # Cpf paciente
    CONSTRAINT CHPCPFPCONSULTA
        FOREIGN KEY (Cpf_paciente) REFERENCES PACIENTE(Cpf)
        ON DELETE SET NULL ON UPDATE CASCADE,
	

    # Nome
	CONSTRAINT CHENOMEPCONSULTA
        FOREIGN KEY (Nome_paciente) REFERENCES PACIENTE(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCPCONSULTA
        FOREIGN KEY (Data_nascimento_paciente) REFERENCES PACIENTE(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAPCONSULTA
        FOREIGN KEY (Logradouro_end_paciente) REFERENCES PACIENTE(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMPCONSULTA
        FOREIGN KEY (Numero_end_paciente) REFERENCES PACIENTE(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPPCONSULTA
        FOREIGN KEY (Cep_end_paciente) REFERENCES PACIENTE(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROPCONSULTA
        FOREIGN KEY (Bairro_end_paciente) REFERENCES PACIENTE(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
    
    # Nome do Plano
	CONSTRAINT CHENOMEPLANOPCONSULTA
        FOREIGN KEY (Plano_nome) REFERENCES PACIENTE(Plano_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Mensalidade do Plano
	CONSTRAINT CHEMENSPLANOPCONSULTA
        FOREIGN KEY (Plano_mensalidade) REFERENCES PACIENTE(Plano_mensalidade)
        ON DELETE SET NULL ON UPDATE CASCADE
);



# Relacao Sala
CREATE TABLE SALA (
	Nome VARCHAR(10) NOT NULL, # Nome da sala
    
    # Chave principal
    CONSTRAINT CHPNOMESALA
		PRIMARY KEY(Nome)
);



# Relacao Procedimento
CREATE TABLE PROCEDIMENTO (
	Data_procedimento DATE NOT NULL, # Data do procedimento
    Valor DOUBLE NOT NULL, # Valor do procedimento7
    Tempo_duracao DATETIME NOT NULL, # Tempo de duracao do procedimento
	
    # Sala
    Nome_sala VARCHAR(10), # Nome da sala
    
    # Medico
    Crm CHAR(9), # Crm do medico
	Valor_hora DOUBLE, # Valor que o medico ganha por hora
    Especialidade_nome VARCHAR(10), # Nome da especialidade do medico
    
    Nome_medico VARCHAR(10), # Nome do paciente
    Data_nascimento_medico DATE, # Data de nascimento
    
    # Endereco
    Logradouro_end_medico VARCHAR(15), # Rua onde mora
    Numero_end_medico INT, # Numero da casa/apt. onde mora
    Cep_end_medico CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end_medico VARCHAR(15), # Bairro onde mora
    
    # Paciente
	Cpf_paciente CHAR(11), # Cpf do paciente
    Plano_nome VARCHAR(10), # Nome do plano do paciente
    Plano_mensalidade INT, # Mensalidade do plano do paciente
    Nome_paciente VARCHAR(10), # Nome do paciente
    Data_nascimento_paciente DATE, # Data de nascimento
    
    # Endereco
    Logradouro_end_paciente VARCHAR(15), # Rua onde mora
    Numero_end_paciente INT, # Numero da casa/apt. onde mora
    Cep_end_paciente CHAR(8), # Numero do Cep da rua/cidade onde mora
    Bairro_end_paciente VARCHAR(15), # Bairro onde mora
	
    # Chave Primaria:
    CONSTRAINT CHPDATATEMPOPROCEDIMENTO
		PRIMARY KEY(Data_procedimento, Tempo_duracao),
	

	# Chaves estrangeiras sala:
	# Sala
	CONSTRAINT CHESALASPROCEDIMENTO
        FOREIGN KEY (Nome_sala) REFERENCES SALA(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Chaves estrangeiras medico:
	# Crm
	CONSTRAINT CHECRMMPROCEDIMENTO
        FOREIGN KEY (Crm) REFERENCES MEDICO(Crm)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
	# Valor hora
	CONSTRAINT CHEVALORHRMPROCEDIMENTO
        FOREIGN KEY (Valor_hora) REFERENCES MEDICO(Valor_hora)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Nome da Especialidade
	CONSTRAINT CHEESPMPROCEDIMENTO
        FOREIGN KEY (Especialidade_nome) REFERENCES MEDICO(Especialidade_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Nome
	CONSTRAINT CHENOMEMPROCEDIMENTO
        FOREIGN KEY (Nome_medico) REFERENCES MEDICO(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCMPROCEDIMENTO
        FOREIGN KEY (Data_nascimento_medico) REFERENCES MEDICO(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAMPROCEDIMENTO
        FOREIGN KEY (Logradouro_end_medico) REFERENCES MEDICO(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMMPROCEDIMENTO
        FOREIGN KEY (Numero_end_medico) REFERENCES MEDICO(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPMPROCEDIMENTO
        FOREIGN KEY (Cep_end_medico) REFERENCES MEDICO(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROMPROCEDIMENTO
        FOREIGN KEY (Bairro_end_medico) REFERENCES MEDICO(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,


	# Chaves estrangeiras paciente:
    # Cpf paciente
    CONSTRAINT CHPCPFPPROCEDIMENTO
        FOREIGN KEY (Cpf_paciente) REFERENCES PACIENTE(Cpf)
        ON DELETE SET NULL ON UPDATE CASCADE,
	

    # Nome
	CONSTRAINT CHENOMEPPROCEDIMENTO
        FOREIGN KEY (Nome_paciente) REFERENCES PACIENTE(Nome)
        ON DELETE SET NULL ON UPDATE CASCADE,

    # Data nascimento
	CONSTRAINT CHEDATANASCPPROCEDIMENTO
        FOREIGN KEY (Data_nascimento_paciente) REFERENCES PACIENTE(Data_nascimento)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Logradouro
	CONSTRAINT CHELOGRAPPROCEDIMENTO
        FOREIGN KEY (Logradouro_end_paciente) REFERENCES PACIENTE(Logradouro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Numero
	CONSTRAINT CHENUMPPROCEDIMENTO
        FOREIGN KEY (Numero_end_paciente) REFERENCES PACIENTE(Numero_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Cep
	CONSTRAINT CHECEPPPROCEDIMENTO
        FOREIGN KEY (Cep_end_paciente) REFERENCES PACIENTE(Cep_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Bairro
	CONSTRAINT CHEBAIRROPPROCEDIMENTO
        FOREIGN KEY (Bairro_end_paciente) REFERENCES PACIENTE(Bairro_end)
        ON DELETE SET NULL ON UPDATE CASCADE,
    
    # Nome do Plano
	CONSTRAINT CHENOMEPLANOPPROCEDIMENTO
        FOREIGN KEY (Plano_nome) REFERENCES PACIENTE(Plano_nome)
        ON DELETE SET NULL ON UPDATE CASCADE,
        
    # Mensalidade do Plano
	CONSTRAINT CHEMENSPLANOPPROCEDIMENTO
        FOREIGN KEY (Plano_mensalidade) REFERENCES PACIENTE(Plano_mensalidade)
        ON DELETE SET NULL ON UPDATE CASCADE
);



# Relacao Faringoplastia
CREATE TABLE FARINGOPLASTIA (
	Mensagem VARCHAR(20) NOT NULL,
    
    # Chave primaria
	CONSTRAINT CHPMENSFARINGOPLASTIA
        PRIMARY KEY (Mensagem)
);



# Relacao NeuroCirurgia
CREATE TABLE NEUROCIRURGIA (
	Mensagem VARCHAR(20) NOT NULL,
    
    # Chave primaria
	CONSTRAINT CHPMENSNEUROCIRURGIA
        PRIMARY KEY (Mensagem)
);