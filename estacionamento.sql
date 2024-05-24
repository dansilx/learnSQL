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
    cor VARCHAR(8),
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

INSERT INTO cliente (cpf, nome, dtNasc) VALUES (123456789, 'João Silva', '1980-01-01'), (987654321, 'Maria Santos', '1985-02-02'), (111222333, 'Carlos Pereira', '1990-03-03'), (444555666, 'Ana Oliveira', '1995-04-04');

INSERT INTO modelo (Desc_2) VALUES ('Modelo X'), ('Modelo Y'), ('Modelo Z'), ('Modelo W');

INSERT INTO veiculo (placa, cor, Modelo_codMod, Clinte_cpf) VALUES ('ABC-1234','azul' 1, 123456789), ('XYZ-5678','prata', 2, 987654321),('DBI-1010', 'verde', 3, 111222333), ('ADS-2024' '', 4, 444555666);

INSERT INTO patio (num, ender, capacidade) VALUES (1, 'Rua das Flores, 123', 50), (2, 'Avenida das Rosas, 456', 100), (3, 'Rua das Margaridas, 789', 150), (4, 'Avenida dos Lírios, 012', 200);

INSERT INTO estaciona (dtEntrada, dtSaida, hsEntrada, hsSaida, Patio_num, Veiculo_placa) VALUES ('2023-05-23', '2023-05-24', '08:00', '18:00', 1, 'ABC-1234')('2023-05-24', '2023-05-25', '09:00', '19:00', 2, 'XYZ-5678'),('2023-05-25', '2023-05-26', '10:00', '20:00', 3, 'DBI-1010') , ('2023-05-26', '2023-05-27', '11:00', '21:00', 4, 'ADS-2024');

SELECT v.placa, c.nome, m.Desc_2
FROM veiculo v
INNER JOIN cliente c ON v.Cliente_cpf = c.cpf
INNER JOIN modelo m ON v.Modelo_codMod = m.codMod;

SELECT v.placa, c.nome, m.Desc_2
FROM veiculo v
INNER JOIN cliente c ON v.Cliente_cpf = c.cpf
INNER JOIN modelo m ON v.Modelo_codMOdMod = m.codMod
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa
WHERE e.dtEntrada LIKE '2023-05-%';

SELECT c.cpf, c.nome 
FROM cliente c
INNER JOIN veiculo v ON c.cpf = v.Cliente_cpf
WHERE v.placa = 'ADS-2024';

SELECT v.placa
FROM veiculo v
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa
WHERE e.cod = 1;


-- NÃO HÁ COLUNA ANO 
-- SELECT veiculo.placa, modelo.Desc_2
-- FROM veiculo
-- INNER JOIN modelo ON veiculo.Modelo_codMod = modelo.codMod
-- WHERE veiculo.placa >= 2020; 

SELECT p.ender, e.dtEntrada, e.dtSaida
FROM patio p 
INNER JOIN estaciona e ON p.num = e.Patio_num
INNER JOIN veiculo v ON e.Veiculo_placa = v.placa
WHERE v.placa = 'DBI-1010';

SELECT COUNT(*) AS Quantidade
FROM veiculo v
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa
WHERE v.cor = 'verde';

SELECT c.cpf, c.nome 
FROM cliente c
INNER JOIN veiculo v ON c.cpf = v.Cliente_cpf
INNER JOIN Modelo m ON v.ModelocodMod = m.codMod
WHERE m.Desc_2 LIKE 'Corolla%';

SELECT v.placa, e.hsEntrada, e.hsSaida
FROM veiculo v
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa 
WHERE v.cor = 'azul';

SELECT p.ender, e.dtEntrada, e.dtSaida
FROM patio p
INNER JOIN estaciona e ON p.num = e.Patio_num
INNER JOIN veiculo v ON e.Veiculo_placa = v.placa
WHERE v.placa = 'ADS-2024';

SELECT c.nome, c.cpf
FROM cliente c
INNER JOIN veiculo v ON c.cpf = v.Cliente_cpf
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa
WHERE e.cod = 2;

SELECT m.Desc_2
FROM modelo m 
INNER JOIN veiculo v ON m.codMod = v.Modelo_codMod 
INNER JOIN estaciona e ON v.placa = e.Veoculo_placa
WHERE e.cod = 10;

SELECT c.nome 
FROM cliente c
WHERE MONTH(dtNasc) = MONTH(CURRENT_DATE);

SELECT c.nome, c.cpf, m.Desc_2, v.cor
FROM cliente c
INNER JOIN veiculo v ON c.cpf = v.Cliente_cpf
INNER JOIN modelo m ON v.Modelo_codMod = m.codMod
INNER JOIN estaciona e ON v.placa = e.Veiculo_placa
WHERE e.dtSaida IS NULL
ORDER BY e.dtEntrada ASC;

SELECT p.ender, COUNT(*) AS Total
FROM patio p
INNER JOIN estaciona e ON p.num = e.Patio_num
INNER JOIN veiculo v ON e.Veiculo_placa = v.placa
WHERE e.dtSaida IS NULL
GROUP BY p.ender;

SELECT p.ender, COUNT(*) AS Total
FROM patio p 
INNER JOIN estaciona e ON p.num = e.Patio_num
WHERE YEAR(e.dtEntrada) = 2023
GROUP BY p.ender;