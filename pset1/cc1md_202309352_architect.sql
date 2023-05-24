
CREATE TABLE public.produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produto_id PRIMARY KEY (produto_id)
);
COMMENT ON TABLE public.produtos IS 'Tabela que contém as informações dos produtos.';
COMMENT ON COLUMN public.produtos.produto_id IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN public.produtos.nome IS 'Coluna que contém o nome dos produtos.';
COMMENT ON COLUMN public.produtos.preco_unitario IS 'Coluna que contém o preço unitário dos produtos.';
COMMENT ON COLUMN public.produtos.detalhes IS 'Coluna que contém os detalhes dos produtos.';
COMMENT ON COLUMN public.produtos.imagem IS 'Coluna que contém a imagem de cada produto.';
COMMENT ON COLUMN public.produtos.imagem_mime_type IS 'Coluna que contém o mime type de cada imagem.';
COMMENT ON COLUMN public.produtos.imagem_arquivo IS 'Coluna que contém o arquivo de cada imagem.';
COMMENT ON COLUMN public.produtos.imagem_charset IS 'Coluna que contém o charset de cada imagem.';
COMMENT ON COLUMN public.produtos.imagem_ultima_atualizacao IS 'Coluna que contém a data da ultima atualização de cada imagem.';


CREATE TABLE public.lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                enderco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT loja_id PRIMARY KEY (loja_id)
);
COMMENT ON TABLE public.lojas IS 'Tabela que contém as informações das lojas.';
COMMENT ON COLUMN public.lojas.loja_id IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN public.lojas.nome IS 'Coluna que contém o nome das lojas.';
COMMENT ON COLUMN public.lojas.endereco_web IS 'Coluna para identificar o endereço web da loja.';
COMMENT ON COLUMN public.lojas.enderco_fisico IS 'Coluna que contém o endereço fisico da loja.';
COMMENT ON COLUMN public.lojas.latitude IS 'Coluna que contém latitude em que a loja se posiciona.';
COMMENT ON COLUMN public.lojas.longitude IS 'Coluna que contém longitude em que a loja se posiciona.';
COMMENT ON COLUMN public.lojas.logo IS 'Coluna que contém as logos de cada loja.';
COMMENT ON COLUMN public.lojas.logo_mime_type IS 'Coluna que mostra o mime type de cada logo.';
COMMENT ON COLUMN public.lojas.logo_arquivo IS 'Coluna que contém o arquivo de cada logo.';
COMMENT ON COLUMN public.lojas.logo_charset IS 'Coluna que mostra o charset das logos.';
COMMENT ON COLUMN public.lojas.logo_ultima_atualizacao IS 'Coluna que contém a data da ultima atualização de cada logo.';


CREATE TABLE public.estoque (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE public.estoque IS 'Tabela que contém as informações dos estoques das lojas.';
COMMENT ON COLUMN public.estoque.estoque_id IS 'Coluna com as identificações de cada estoque.';
COMMENT ON COLUMN public.estoque.loja_id IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN public.estoque.produto_id IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN public.estoque.quantidade IS 'Coluna que contém a quantidade de produtos que cada estoque tem.';


CREATE TABLE public.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefpne3 VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE public.clientes IS 'Tabela que mostra informações sobre os clientes.';
COMMENT ON COLUMN public.clientes.cliente_id IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN public.clientes.email IS 'Coluna que contém o email do cliente.';
COMMENT ON COLUMN public.clientes.nome IS 'Coluna que contém o nome dos clientes.';
COMMENT ON COLUMN public.clientes.telefone1 IS 'Coluna contendo um número de telefone que o cliente tem acesso.';
COMMENT ON COLUMN public.clientes.telefone2 IS 'Coluna contendo um número de telefone que o cliente tem acesso.';
COMMENT ON COLUMN public.clientes.telefpne3 IS 'Coluna contendo um número de telefone que o cliente tem acesso.';


CREATE TABLE public.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);
COMMENT ON TABLE public.envios IS 'Tabela que contém as informações dos envios dos produtos da loja.';
COMMENT ON COLUMN public.envios.envio_id IS 'Coluna que contém a identificação dos envios que a loja fez.';
COMMENT ON COLUMN public.envios.loja_id IS 'Coluna com o número de identificação das lojas.';
COMMENT ON COLUMN public.envios.cliente_id IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN public.envios.endereco_entrega IS 'Coluna que contém o endereço em que o produto foi enviado.';
COMMENT ON COLUMN public.envios.status IS 'Coluna que contém os status dos envios da loja.';


CREATE TABLE public.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE public.pedidos IS 'Tabela que mostra os pedidos que foram feitos.';
COMMENT ON COLUMN public.pedidos.pedido_id IS 'Coluna que mostra as identificações dos pedidos feitos.';
COMMENT ON COLUMN public.pedidos.data_hora IS 'Data e hora em que o pedido foi feito.';
COMMENT ON COLUMN public.pedidos.cliente_id IS 'Coluna com o número de identificação do cliente.';
COMMENT ON COLUMN public.pedidos.status IS 'Coluna que contém o status dos pedidos.';
COMMENT ON COLUMN public.pedidos.loja_id IS 'Coluna com o número de identificação das lojas.';


CREATE TABLE public.pedidos_itens (
                produto_id NUMERIC(38) NOT NULL,
                pedido_id NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (produto_id, pedido_id)
);
COMMENT ON TABLE public.pedidos_itens IS 'Tabela que contém as informações dos itens pedidos.';
COMMENT ON COLUMN public.pedidos_itens.produto_id IS 'Coluna que contém a identificação dos produtos.';
COMMENT ON COLUMN public.pedidos_itens.pedido_id IS 'Coluna que mostra as identificações dos pedidos feitos.';
COMMENT ON COLUMN public.pedidos_itens.envio_id IS 'Coluna que contém a identificação dos envios que a loja fez.';
COMMENT ON COLUMN public.pedidos_itens.numero_da_linha IS 'Coluna que contém o número da linha dos itens pedidos.';
COMMENT ON COLUMN public.pedidos_itens.preco_unitario IS 'Coluna que contém o preço unitário dos produtos pedidos.';
COMMENT ON COLUMN public.pedidos_itens.quantidade IS 'Coluna que contém a quantidade dos itens pedidos.';


ALTER TABLE public.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoque ADD CONSTRAINT produtos_estoque_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoque ADD CONSTRAINT lojas_estoque_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES public.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES public.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
