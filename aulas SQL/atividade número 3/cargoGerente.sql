SELECT p.nome
FROM pessoa p
JOIN pessoa_trabalho pt ON p.cpf_cnpj = pt.cpf_cnpj
WHERE pt.cargo = 'gerente';

--nao existe um gerente no insert