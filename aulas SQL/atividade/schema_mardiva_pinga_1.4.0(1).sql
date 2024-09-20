-- DELETE DB
DROP TABLE public.ingrediente_item_pedido;
DROP TABLE public.item_cardapio_pedido;
DROP TABLE public.pedido;
DROP TABLE public.ingrediente_item_cardapio;
DROP TABLE public.item_cardapio;
DROP TABLE public.ingrediente;
DROP TABLE public.entregador;
DROP TABLE public.cozinheiro;
DROP TABLE public.garcom;
DROP TABLE public.gerente;
DROP TABLE public.mesa;
DROP TABLE public.cliente;

-- CREATE DB
CREATE TABLE public.cliente
(
    cliente_cpf bigint NOT NULL,
    cliente_nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    cliente_telefone numeric(10,0),
    cliente_endereco character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (cliente_cpf)
);

CREATE TABLE public.mesa
(
    mesa_numero numeric(3,0) NOT NULL,
    qtd_assentos numeric(2,0) NOT NULL,
    valor_total numeric(10,2),
    CONSTRAINT mesa_pkey PRIMARY KEY (mesa_numero)
);

CREATE TABLE public.gerente
(
    gerente_cpf bigint NOT NULL,
    gerente_nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    gerente_salario numeric(10,2),
    CONSTRAINT gerente_pkey PRIMARY KEY (gerente_cpf)
);

CREATE TABLE public.garcom
(
    garcom_cpf bigint NOT NULL,
    garcom_nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    garcom_salario numeric(10,2),
    garcom_turno character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT garcom_pkey PRIMARY KEY (garcom_cpf)
);

CREATE TABLE public.cozinheiro
(
    cozinheiro_cpf bigint NOT NULL,
    cozinheiro_nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    cozinheiro_salario numeric(10,2),
    CONSTRAINT cozinheiro_pkey PRIMARY KEY (cozinheiro_cpf)
);

CREATE TABLE public.entregador
(
    entregador_cpf bigint NOT NULL,
    entregador_nome character varying(90) COLLATE pg_catalog."default" NOT NULL,
    entregador_salario numeric(10,2),
    CONSTRAINT entregador_pkey PRIMARY KEY (entregador_cpf)
);

CREATE TABLE public.ingrediente
(
    ingrediente_id bigint NOT NULL,
    ingrediente_descricao character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ingrediente_pkey PRIMARY KEY (ingrediente_id)
);

CREATE TABLE public.item_cardapio
(
    item_cardapio_id bigint NOT NULL,
    item_cardapio_nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    item_cardapio_preco numeric(10,2) NOT NULL,
    CONSTRAINT item_cardapio_pkey PRIMARY KEY (item_cardapio_id)
);

CREATE TABLE public.ingrediente_item_cardapio
(
    ingrediente_item_cardapio_id bigint NOT NULL,
    item_cardapio_id bigint NOT NULL,
    ingrediente_id bigint NOT NULL,
    ingrediente_cardapio_qtd integer NOT NULL,
    CONSTRAINT "PK-ingrediente-Item-cardapio" PRIMARY KEY (ingrediente_item_cardapio_id),
    CONSTRAINT "FK-INGREDIENTE" FOREIGN KEY (ingrediente_id)
        REFERENCES public.ingrediente (ingrediente_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-ITEM-CARDAPIO" FOREIGN KEY (item_cardapio_id)
        REFERENCES public.item_cardapio (item_cardapio_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.pedido
(
    pedido_numero bigint NOT NULL,
    pedido_data date NOT NULL,
    mesa_numero numeric(3,0),
    cliente_cpf bigint,
    garcom_cpf bigint,
    gerente_cpf bigint,
    entregador_cpf bigint,
    alteracao character varying(50) COLLATE pg_catalog."default",
    desconto numeric(10,2),
    CONSTRAINT pedido_pkey PRIMARY KEY (pedido_numero),
    CONSTRAINT "FK-CLIENTE" FOREIGN KEY (cliente_cpf)
        REFERENCES public.cliente (cliente_cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-ENTREGADOR" FOREIGN KEY (entregador_cpf)
        REFERENCES public.entregador (entregador_cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-GARCOM" FOREIGN KEY (garcom_cpf)
        REFERENCES public.garcom (garcom_cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-GERENTE" FOREIGN KEY (gerente_cpf)
        REFERENCES public.gerente (gerente_cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-MESA" FOREIGN KEY (mesa_numero)
        REFERENCES public.mesa (mesa_numero) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.item_cardapio_pedido
(
    item_cardapio_pedido_id bigint NOT NULL,
    pedido_numero bigint NOT NULL,
    item_cardapio_id bigint NOT NULL,
    cozinheiro_cpf bigint NOT NULL,
    CONSTRAINT item_cardapio_pedido_pkey PRIMARY KEY (item_cardapio_pedido_id),
    CONSTRAINT "FK-CARDAPIO" FOREIGN KEY (item_cardapio_id)
        REFERENCES public.item_cardapio (item_cardapio_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-COZINHEIRO" FOREIGN KEY (cozinheiro_cpf)
        REFERENCES public.cozinheiro (cozinheiro_cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-PEDIDO" FOREIGN KEY (pedido_numero)
        REFERENCES public.pedido (pedido_numero) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.ingrediente_item_pedido
(
    ingrediente_item_pedido_id bigint NOT NULL,
    item_cardapio_pedido_id bigint NOT NULL,
    ingrediente_item_cardapio_id bigint NOT NULL,
    ingrediente_pedido_qtd integer NOT NULL,
    CONSTRAINT ingrediente_item_pedido_pkey PRIMARY KEY (ingrediente_item_pedido_id),
    CONSTRAINT "FK-INGREDIENTE-ITEM-CARDAPIO" FOREIGN KEY (ingrediente_item_cardapio_id)
        REFERENCES public.ingrediente_item_cardapio (ingrediente_item_cardapio_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK-ITEM-CARDAPIO-PEDIDO" FOREIGN KEY (item_cardapio_pedido_id)
        REFERENCES public.item_cardapio_pedido (item_cardapio_pedido_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


