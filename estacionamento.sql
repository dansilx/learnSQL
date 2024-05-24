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

SELECT veiculo.placa, cliente.nome, modelo.Desc_2
FROM veiculo
INNER JOIN cliente ON veiculo.Cliente_cpf = cliente.cpf
INNER JOIN modeloON veiculo.Modelo_codMod = modelo.codMod;

SELECT veiculo.placa, cliente.nome, modelo.Desc_2
FROM veiculo
INNER JOIN cliente ON veiculo.Cliente_cpf = cliente.cpf
INNER JOIN modelo ON veiculo.Modelo_codMOdMod = modelo.codMod
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa
WHERE estaciona.dtEntrada >= '2023-05-01' AND estaciona.tSaida <= '2023-05-31';

SELECT cliente.cpf, cliente.nome 
FROM cliente
INNER JOIN veiculo ON cliente.cpf = veiculo.Cliente_cpf
WHERE veiculo.placa = 'ADS-2024';

SELECT veiculo.placa
FROM veiculo
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa
WHERE estaciona.cod = 1;


-- NÃO HÁ COLUNA ANO 
-- SELECT veiculo.placa, modelo.Desc_2
-- FROM veiculo
-- INNER JOIN modelo ON veiculo.Modelo_codMod = modelo.codMod
-- WHERE veiculo.placa >= 2020; 

SELECT patio.ender, estaciona.dtEntrada, estaciona.dtSaida
FROM patio
INNER JOIN estaciona ON patio.num = estaciona.Patio_num
INNER JOIN veiculo ON estaciona.Veiculo_placa = veiculo.placa
WHERE veiculo.placa = 'DBI-1010';

SELECT COUNT(*) AS Qauntidade
FROM veiculo 
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa
WHERE veiculo.cor = 'verde';

SELECT cliente.cpf, cliente.nome 
FROM cliente 
INNER JOIN veiculo ON cliente.cpf = veiculo.Cliente_cpf
INNER JOIN Modelo ON veiculo.ModelocodMod = modelo.codMod
WHERE modelo.Desc_2 LIKE 'Corolla%';

SELECT veiculo.placa, estaciona.hsEntrada, estaciona.hsSaida
FROM veiculo
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa 
WHERE veiculo.cor = 'azul';

SELECT patio.ender, estaciona.dtEntrada, estaciona.dtSaida
FROM patio
INNER JOIN estaciona ON patio.num = estaciona.Patio_num
INNER JOIN veiculo ON estaciona.Veiculo_placa = veiculo.placa
WHERE veiculo.placa = 'ADS-2024';

SELECT cliente.nome, cliente.cpf
FROM cliente 
INNER JOIN veiculo ON cliente.cpf = veiculo.Cliente_cpf
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa
WHERE estaciona.cod = 2;

SELECT modelo.Desc_2
FROM modelo 
INNER JOIN veiculo ON modelo.codMod = veiculo.Modelo_codMod 
INNER JOIN estaciona ON veiculo.placa = estaciona.Veoculo_placa
WHERE estaciona.cod = 10;

SELECT nome 
FROM cliente
WHERE MONTH(dtNasc) = MONTH(CURRENT_DATE);

SELECT cliente.nome, cliente.cpf, modelo.Desc_2, veiculo.cor
FROM cliente
INNER JOIN veiculo ON cliente.cpf = veiculo.Cliente_cpf
INNER JOIN modelo ON veiculo.Modelo_codMod = modelo.codMod
INNER JOIN estaciona ON veiculo.placa = estaciona.Veiculo_placa
WHERE estaciona.dtSaida IS NULL
ORDER BY estaciona.dtEntrada ASC;

SELECT patio.ender, COUNT(*) AS Total
FROM patio
INNER JOIN estaciona ON patio.num = estaciona.Patio_num
INNER JOIN veiculo ON estaciona.Veiculo_placa = veiculo.placa
WHERE estaciona.dtSaida IS NULL
GROUP BY patio.ender;

