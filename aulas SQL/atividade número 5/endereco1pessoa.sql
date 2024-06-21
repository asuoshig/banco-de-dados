--mostrou todos os endereços cadastrados de todos ms nao mostrou o nome nem cpf da pessoa

SELECT e.codigo, e.logradouro, e.cidade, e.estado, e.cep
FROM pessoa p
JOIN pessoa_fisica pf ON p.cpf_cnpj = pf.cpf
LEFT JOIN pessoa_trabalho pt ON p.cpf_cnpj = pt.cpf_cnpj
LEFT JOIN moradia mo ON pt.cpf_cnpj = pt.cpf_cnpj
LEFT JOIN endereco e ON mo.codigo_endereco = e.codigo
WHERE pf.cpf = '39134853090';