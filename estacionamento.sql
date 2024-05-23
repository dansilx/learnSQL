CREATE DATABASE estacionamento;

USE estacionamento;

CREATE TABLE cliente (
    cpf INT NOT NULL,
    nome VARCHAR(60),
    dtNasc DATE,
    PRIMARY KEY (cpf)
);

CREATE TABLE veiculo (
    placa VARCHAR(8) NOT NULL,
    FOREIGN KEY (Modelo_codMod) REFERENCES modelo (codMod),
    FOREIGN KEY (Cliente_cpf) REFERENCES cliente (cpf),
    PRIMARY KEY(placa)
);

CREATE TABLE modelo (
    codMod INT NOT NULL AUTO_INCREMENT,
    Desc_2 VARCHAR(40)
);

CREATE TABLE patio (
    num INT NOT NULL,
    ender VARCHAR(40),
    capacidade INT
);

CREATE TABLE estaciona (
    cod INT NOT NULL AUTO_INCREMENT,
    dtEntrada VARCHAR(10),
    dtSaida VARCHAR(10),
    hsEntrada VARCHAR(10),
    hsSaida VARCHAR(10),
    FOREIGN KEY (Patio_num) REFERENCES patio (num),
    FOREIGN KEY (Veiculo_placa) REFERENCES veiculo (placa)
);