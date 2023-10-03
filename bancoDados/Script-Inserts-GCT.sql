-- Cadastro de Empresas
INSERT INTO `Empresa` (`razao_social`, `cnpj`, `numero_imovel`, `cep`, `email`, `telefone`) 
VALUES  ('Pague Seguro',"61.186.888/0093-01", 763, '09260-640', 'pagueSeguro@gmail.com', '123123123')
	, ('SPTECH', "61.186.888/0093-01", 298,'09260-640', 'sptech@gmail.com', '456456456')
	, ('Amazon', "61.186.888/0093-01", 234,'09260-640', 'amazon@gmail.com', '889877677');
Select * from `Empresa`;


-- Cadastro de Gerentes
INSERT INTO `Funcionario` (`nome`, `email`, `senha`, `cargo`, `cpf`, `permissao`, `fk_gerente`, `fk_empresa`)
VALUES ('Gabriel', 'gabriel@gmail.com', '12345', 'Gerente', '690.969.360-43', '1', null, 1)
	, ('Fernando Brandão', 'fernado@gmail.com', '12345', 'Presidente', '226.146.010-47', '1', null, 2)
    , ('Cláudio', 'claudio@gmail.com', '12345', 'Gerente', '810.791.190-35', '1', null, 3);


-- Cadastro de Funcionários
INSERT INTO `Funcionario` (`nome`, `email`, `senha`, `cargo`, `cpf`, `permissao`, `fk_gerente`, `fk_empresa`)
values ('Cleiton Rodrigues', 'cleiton@gmail.com', '12345', 'Analísta Junior', "514.184.580-07", '2', 1, 1)
	, ('Carlos Souza', 'carlos@gmail.com', '12345', 'Analísta Sênior', "541.886.660-56", '1', 2, 2)
    , ('Pedro Henrique', 'pedro@gmail.com', '12345', 'Analísta Sênior', "091.045.750-67", '1', 3, 3);

SELECT * FROM `Funcionario`;


-- Cadastro de Servidores 
INSERT INTO `servidor` (`nome`, `codigo`, `tipo`, `descricao`, `fk_empresa`)
VALUES ('SERVER-AHRL1NB', 'XPTO-0987', 'Servidor Principal', 'Servidor responsável por executar X tarefa', 1)
	, ('SERVER-9HJD2AL', 'XP-9384', 'Servidor de Backup', 'Servidor responsável por backups', 1)
    , ('SERVER-UHD71P6', 'LOC-0284', 'Servidor de Homologação', 'Servidor responsável por Homologações ', 1);
    