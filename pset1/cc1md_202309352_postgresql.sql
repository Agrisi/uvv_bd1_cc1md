--deletando a database/esquema/usuario com o mesmo nome se já existirem--
DROP DATABASE IF EXISTS uvv;

DROP SCHEMA IF EXISTS lojas CASCADE;

DROP USER IF EXISTS caua;

--criação de um usuário com meu nome--

CREATE USER caua 
WITH ENCRYPTED PASSWORD 'xlr8ult'
CREATEDB
CREATEROLE login;

--criação do banco de dados uvv--

CREATE DATABASE uvv 
OWNER = caua
TEMPLATE = template0
ENCODING = UTF8
LC_COLLATE = 'pt_BR.UTF-8'
LC_CTYPE = 'pt_BR.UTF-8'
ALLOW_CONNECTIONS = true;

--conectando ao banco de dados "uvv"--

\c "host=localhost dbname=uvv user=caua password=xlr8ult"

--criando o esquema lojas e alterando a mesma para a posse do meu usuário--

CREATE SCHEMA lojas;

ALTER SCHEMA lojas OWNER TO caua;

--Criação da tabela produtos e de comentários sobre a tabela e suas colunas--

CREATE TABLE    lojas.produtos (
                produto_id       NUMERIC(38) NOT NULL,
                nome             VARCHAR(255) NOT NULL,
                preco_unitario   NUMERIC(10,2),
                detalhes         BYTEA,
                imagem           BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo   VARCHAR(512),
                imagem_charset   VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produto_id PRIMARY KEY (produto_id)
);
COMMENT ON TABLE  lojas.produtos                           IS 'Tabela que contém as informações dos produtos.';
COMMENT ON COLUMN lojas.produtos.produto_id                IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN lojas.produtos.nome                      IS 'Coluna que contém o nome dos produtos.';
COMMENT ON COLUMN lojas.produtos.preco_unitario            IS 'Coluna que contém o preço unitário dos produtos.';
COMMENT ON COLUMN lojas.produtos.detalhes                  IS 'Coluna que contém os detalhes dos produtos.';
COMMENT ON COLUMN lojas.produtos.imagem                    IS 'Coluna que contém a imagem de cada produto.';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type          IS 'Coluna que contém o mime type de cada imagem.';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo            IS 'Coluna que contém o arquivo de cada imagem.';
COMMENT ON COLUMN lojas.produtos.imagem_charset            IS 'Coluna que contém o charset de cada imagem.';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'Coluna que contém a data da ultima atualização de cada imagem.';

--Criação da tabela lojas e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.lojas (
                loja_id         NUMERIC(38) NOT NULL,
                nome            VARCHAR(255) NOT NULL,
                endereco_web    VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude        NUMERIC,
                longitude       NUMERIC,
                logo            BYTEA,
                logo_mime_type  VARCHAR(512),
                logo_arquivo    VARCHAR(512),
                logo_charset    VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT loja_id PRIMARY KEY (loja_id),
                CONSTRAINT apenas_um_endereco CHECK (COALESCE(endereco_web, endereco_fisico) IS NOT NULL)
);
COMMENT ON TABLE  lojas.lojas                          IS 'Tabela que contém as informações das lojas.';
COMMENT ON COLUMN lojas.lojas.loja_id                  IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN lojas.lojas.nome                     IS 'Coluna que contém o nome das lojas.';
COMMENT ON COLUMN lojas.lojas.endereco_web             IS 'Coluna para identificar o endereço web da loja.';
COMMENT ON COLUMN lojas.lojas.endereco_fisico          IS 'Coluna que contém o endereço fisico da loja.';
COMMENT ON COLUMN lojas.lojas.latitude                 IS 'Coluna que contém latitude em que a loja se posiciona.';
COMMENT ON COLUMN lojas.lojas.longitude                IS 'Coluna que contém longitude em que a loja se posiciona.';
COMMENT ON COLUMN lojas.lojas.logo                     IS 'Coluna que contém as logos de cada loja.';
COMMENT ON COLUMN lojas.lojas.logo_mime_type           IS 'Coluna que mostra o mime type de cada logo.';
COMMENT ON COLUMN lojas.lojas.logo_arquivo             IS 'Coluna que contém o arquivo de cada logo.';
COMMENT ON COLUMN lojas.lojas.logo_charset             IS 'Coluna que mostra o charset das logos.';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao  IS 'Coluna que contém a data da ultima atualização de cada logo.';

--Criação da tabela estoques e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id    NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE  lojas.estoques            IS 'Tabela que contém as informações dos estoques das lojas.';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'Coluna com as identificações de cada estoque.';
COMMENT ON COLUMN lojas.estoques.loja_id    IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'Coluna que contém a quantidade de produtos que cada estoque tem.';

--Criação da tabela clientes e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email      VARCHAR(255) NOT NULL,
                nome       VARCHAR(255) NOT NULL,
                telefone1  VARCHAR(20),
                telefone2  VARCHAR(20),
                telefone3  VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE  lojas.clientes            IS 'Tabela que mostra informações sobre os clientes.';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN lojas.clientes.email      IS 'Coluna que contém o email do cliente.';
COMMENT ON COLUMN lojas.clientes.nome       IS 'Coluna que contém o nome dos clientes.';
COMMENT ON COLUMN lojas.clientes.telefone1  IS 'Coluna contendo um número de telefone que o cliente tem acesso.';
COMMENT ON COLUMN lojas.clientes.telefone2  IS 'Coluna contendo um número de telefone que o cliente tem acesso.';
COMMENT ON COLUMN lojas.clientes.telefone3  IS 'Coluna contendo um número de telefone que o cliente tem acesso.';

--Criação da tabela envios e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.envios (
                envio_id         NUMERIC(38) NOT NULL,
                loja_id          NUMERIC(38) NOT NULL,
                cliente_id       NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status           VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id),
                CONSTRAINT status_envios CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'))
);
COMMENT ON TABLE  lojas.envios                  IS 'Tabela que contém as informações dos envios dos produtos da loja.';
COMMENT ON COLUMN lojas.envios.envio_id         IS 'Coluna que contém a identificação dos envios que a loja fez.';
COMMENT ON COLUMN lojas.envios.loja_id          IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN lojas.envios.cliente_id       IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'Coluna que contém o endereço em que o produto foi enviado.';
COMMENT ON COLUMN lojas.envios.status           IS 'Coluna que contém os status dos envios da loja.';

--Criação da tabela pedidos e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.pedidos (
                pedido_id  NUMERIC(38) NOT NULL,
                data_hora  TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status     VARCHAR(15) NOT NULL,
                loja_id    NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id),
                CONSTRAINT status_pedidos CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'))
);
COMMENT ON TABLE  lojas.pedidos            IS 'Tabela que mostra os pedidos que foram feitos.';
COMMENT ON COLUMN lojas.pedidos.pedido_id  IS 'Coluna que mostra as identificações dos pedidos feitos.';
COMMENT ON COLUMN lojas.pedidos.data_hora  IS 'Data e hora em que o pedido foi feito.';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN lojas.pedidos.status     IS 'Coluna que contém o status dos pedidos.';
COMMENT ON COLUMN lojas.pedidos.loja_id    IS 'Coluna com o número de identificação das lojas.';

--Criação da tabela pedidos_itens e de comentários sobre a tabela e suas colunas--

CREATE TABLE lojas.pedidos_itens (
                produto_id      NUMERIC(38) NOT NULL,
                pedido_id       NUMERIC(38) NOT NULL,
                envio_id        NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario  NUMERIC(10,2) NOT NULL,
                quantidade      NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_itens_pk PRIMARY KEY (produto_id, pedido_id)
);
COMMENT ON TABLE  lojas.pedidos_itens                 IS 'Tabela que contém as informações dos itens pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id      IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id       IS 'Coluna que mostra as identificações dos pedidos feitos.';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id        IS 'Coluna que contém a identificação dos envios que a loja fez.';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'Coluna que contém o número da linha dos itens pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario  IS 'Coluna que contém o preço unitário dos produtos pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade      IS 'Coluna que contém a quantidade dos itens pedidos.';

 --Adicionando a FK produto_id (da tabela produtos) na tabela estoques--

ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK produto_id (da tabela produtos) na tabela pedido_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK loja_id (da tabela lojas) na tabela envios--

ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK loja_id (da tabela lojas) na tabela estoques--

ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK loja_id (da tabela lojas) na tabela pedidos--

ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK cliente_id (da tabela clientes) na tabela envios--

ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK cliente_id (da tabela clientes) na tabela pedidos--

ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK pedido_id (da tabela pedidos) na tabela pedidos_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


 --Adicionando a FK envio_id (da tabela envios) na tabela pedidos_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Para ser sincero, achei o PSET mais desafiador do que me haviam dito.
O fato de eu ter um conhecimento limitado sobre o assunto tornou a tarefa mais difícil. No entanto, ao realizá-lo, pude aprender muito e crescer tanto como indivíduo, adquirindo um senso de responsabilidade e um desejo genuíno de aprender, quanto como cientista da computação.
Tenho a convicção de que um dia serei capaz de dominar completamente essa matéria e aplicar meu conhecimento de forma eficaz em projetos futuros.--
--Créditos: Cauã Agrisi Merisio--
--Matricula: 202309352--
