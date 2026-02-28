-- PROJETO DE TRATAMENTO DE DADOS - ALAN TEIXEIRA FREIRES
-- Objetivo: Limpeza e padronização de registros acadêmicos

-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Gerenciamento_Academico;
USE Gerenciamento_Academico;

-- 2. Criação da Tabela de Interface (Dados Brutos)
CREATE TABLE Inscricoes_Pendentes (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100),
    curso_escolhido VARCHAR(50),
    valor_mensalidade VARCHAR(50),
    data_registro VARCHAR(50)
);

-- 3. Carga de Dados (Massa de Teste com 100 registros)
-- [AQUI VOCÊ COLA AQUELE INSERT GRANDE DOS 100 REGISTROS]

-- 4. Criação da VIEW de Relatório Higienizado
CREATE VIEW vw_Relatorio_Inscricoes_Limpo AS
SELECT 
    id_inscricao AS ID,
    UPPER(TRIM(nome_completo)) AS Nome,
    UPPER(TRIM(curso_escolhido)) AS Curso,
    ROUND(valor_mensalidade, 2) AS Mensalidade,
    STR_TO_DATE(REPLACE(data_registro, '/', '-'), '%Y-%m-%d') AS Data_Inscricao
FROM Inscricoes_Pendentes;

-- 5. Consulta Final para Verificação
SELECT * FROM vw_Relatorio_Inscricoes_Limpo ORDER BY Data_Inscricao ASC;
