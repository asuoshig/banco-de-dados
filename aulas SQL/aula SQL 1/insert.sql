INSERT INTO pessoa (nome, cpf_cnpj, tipo) VALUES
('mangueiras Aliança', '00176708000106', 2),
('empresa pietrobon', '08841892000165', 2),
('açougue Ferreira', '65638719000106', 2),
('mercearia JG', '27045861000142', 2),
('Casa Do Boi', '54737586000109', 2),
('Joana', '39134853090', 1),
('Daniel', '70123189020', 1),
('Jonas', '15225260055', 1),
('Josue', '73596546028', 1),
('talita', '53078108066', 1);


INSERT INTO pessoa_fisica (cpf, data_nascimento, sexo) VALUES
('39134853090', '1982-12-18', 'M'),
('70123189020', '2005-02-23', 'F'),
('15225260055', '2000-11-15', 'M'),
('73596546028', '1987-05-18', 'M'),
('53078108066', '1998-09-28', 'F');

INSERT INTO pessoa_juridica (inscricao_estadual, cnpj) VALUES
('12345678000101', '00176708000106' ),
('22345678000102', '08841892000165'),
('32345678000103', '65638719000106' ),
('42345678000104', '27045861000142' ),
('52345678000105', '54737586000109' );

INSERT INTO pessoa_trabalho (cpf_cnpj, cargo, salario, data_admissao) VALUES
('39134853090', 'cozinheira', '2.500', '1984-08-09'),
('70123189020', 'CEO', '7.890', '05-10-1974'),
('15225260055', 'limpeza', '2.250', '1995-11-08'),
('73596546028', 'TI', '4.250', '1999-03-09'),
('53078108066', 'COACH', '3.250', '1994-07-04');

INSERT INTO codigo_endereco (codigo_endereco, tipo) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);


INSERT INTO endereco (codigo, logradouro, cidade, estado, cep) VALUES
(1, 'Rua Alfa', 'Balneário Camboriú', 'Santa Catarina', '10000-000'),
(1, 'Rua 009', 'Barra de São Francisco', 'Espirito Santo', '10000-123'),
(1, 'Rua 15', 'Divisópolis', 'Minas Gerais', '12000-000'),
(1, 'Rua Topazio', 'Eldorado do Sul', 'Rio Grande do Sul', '100789-000'),
(1, 'Rua esmeralda', 'Lima Campos', 'Maranhão', '109870-000');






