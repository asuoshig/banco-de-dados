SELECT p.nome
FROM pessoa p
JOIN pessoa_juridica pj ON p.cpf_cnpj = pj.cnpj
WHERE pj.inscricao_estadual LIKE '0%';

--não tem nenhuma inscriçao estadual com este começo

-- SELECT p.nome
-- FROM pessoa p
-- JOIN pessoa_juridica pj ON p.cpf_cnpj = pj.cnpj
-- WHERE pj.inscricao_estadual LIKE '2%';