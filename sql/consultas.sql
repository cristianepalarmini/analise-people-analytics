-- Total de colaboradores
SELECT COUNT(DISTINCT id_colaborador) AS total_colaboradores
FROM colaboradores;

-- Salário médio
SELECT AVG(salario) AS salario_medio
FROM colaboradores;

-- Tempo médio de empresa
SELECT AVG(tempo_empresa_anos) AS tempo_medio_empresa
FROM colaboradores;

-- Taxa de desligamento
SELECT
    COUNT(CASE WHEN situacao = 'Desligado' THEN 1 END) * 100.0
    / COUNT(*) AS taxa_desligamento
FROM colaboradores;

-- Avaliação média de desempenho
SELECT AVG(avaliacao_desempenho) AS desempenho_medio
FROM colaboradores;

-- Satisfação média
SELECT AVG(satisfacao) AS satisfacao_media
FROM colaboradores;

-- Colaboradores por departamento
SELECT
    departamento,
    COUNT(*) AS total_colaboradores
FROM colaboradores
GROUP BY departamento
ORDER BY total_colaboradores DESC;

-- Salário médio por departamento
SELECT
    departamento,
    AVG(salario) AS salario_medio
FROM colaboradores
GROUP BY departamento
ORDER BY salario_medio DESC;

-- Desempenho médio por departamento
SELECT
    departamento,
    AVG(avaliacao_desempenho) AS desempenho_medio
FROM colaboradores
GROUP BY departamento
ORDER BY desempenho_medio DESC;

-- Desligamentos por departamento
SELECT
    departamento,
    COUNT(CASE WHEN situacao = 'Desligado' THEN 1 END) AS desligamentos
FROM colaboradores
GROUP BY departamento
ORDER BY desligamentos DESC;

-- Colaboradores por situação
SELECT
    situacao,
    COUNT(*) AS quantidade
FROM colaboradores
GROUP BY situacao;

-- Salário médio por cargo
SELECT
    cargo,
    AVG(salario) AS salario_medio
FROM colaboradores
GROUP BY cargo
ORDER BY salario_medio DESC;
