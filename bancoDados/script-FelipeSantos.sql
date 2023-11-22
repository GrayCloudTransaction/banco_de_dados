USE `ScriptGCT`;

CREATE TABLE IF NOT EXISTS tb_preco_componente(
	id_preco_componente INT PRIMARY KEY AUTO_INCREMENT
    , fk_componente INT 
    , FOREIGN KEY (fk_componente) REFERENCES componente(id_componente)
	, preco DECIMAL(10,5) COMMENT 'Preço de uso do componente'
    , fonte VARCHAR(50) COMMENT 'De onde é a fonte do preço. Ex: AWS, Azure, etc...'
) COMMENT 'Tabela que armezana o preço de cada componente diáriamente';

CREATE TABLE IF NOT EXISTS tb_extrato_componente(
	id_extrato_componente INT PRIMARY KEY AUTO_INCREMENT
    , fk_preco_componente INT
    , FOREIGN KEY (fk_preco_componente) REFERENCES tb_preco_componente(id_preco_componente) 
	, fk_servidor INT 
    , FOREIGN KEY (fk_servidor) REFERENCES servidor(id_servidor)
    , dia_registro DATE COMMENT 'Dia do Registro para extrato diário'
    , qtd_horas INT COMMENT 'Quantidade de Hora que o servidor funcionou'
    , valor_calculado DECIMAL(10,5) COMMENT 'Valor calculado com base na quantidade de horas e valor do componente'
) COMMENT 'Tabela para armazenar extrato diário de cada componente';

-- INSERT <----------------------------------------------------
INSERT INTO tb_preco_componente (fk_componente, preco, fonte)
VALUES (1, 0.052, 'AWS')
	, (2, 0.004, 'AWS')
    , (3, 0.15, 'AWS');

-- SELECT <----------------------------------------------------
SELECT * FROM componente;
SELECT * FROM tb_extrato_componente;
SELECT * FROM tb_preco_componente;
-- VIEWS <-----------------------------------------------------
    
