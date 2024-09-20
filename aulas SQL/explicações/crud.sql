ALTER TABLE nome_da_tabela
ADD COLUMN nome_do_campo varchar(30);

ALTER TABLE nome_da_tabela
ALTER COLUMN nome_do_campo
SET DATA TYPE integer;

ALTER TABLE nome_da_tabela
ADD CONSTRAINT nome_da_chave_estrangeira
    FOREIGN KEY (nome_do_campo)
    REFERENCES tabela_referenciada(campo_referenciado);

ALTER TABLE nome_da_tabela
DROP COLUMN nome_do_campo;

ALTER TABLE nome_da_tabela
DROP CONSTRAINT nome_da_chave_estrangeira;

DROP TABLE nome_da_tabela;

UPDATE nome_da_tabela
SET nome_do_campo = 'novo_nome'
WHERE id = 5;

DELETE FROM nome_da_tabela
WHERE id = 9;
