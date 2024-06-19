SELECT nome, cpf_cnpj
FROM pessoa p
JOIN pessoa_fisica pf ON p.cpf_cnpj = pf.cpf
WHERE pf.data_nascimento > '2000-01-01';
