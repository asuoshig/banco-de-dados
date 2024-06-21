SELECT p.nome, pt.salario
FROM pessoa p
JOIN pessoa_trabalho pt ON p.cpf_cnpj = pt.cpf_cnpj
WHERE pt.cargo = 'DevOps';

--nao existe um devops no insert

-- SELECT p.nome, pt.salario
-- FROM pessoa p
-- JOIN pessoa_trabalho pt ON p.cpf_cnpj = pt.cpf_cnpj
-- WHERE pt.cargo = 'CEO';