CREATE DATABASE IF NOT EXISTS `ScriptGCT` DEFAULT CHARACTER SET utf8 ;
USE `ScriptGCT`;

CREATE TABLE IF NOT EXISTS `componente` (
  `id_componente` INT NOT NULL auto_increment,
  `tipo_componente` VARCHAR(60) NULL,
  PRIMARY KEY (`id_componente`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` INT NOT NULL auto_increment,
  `razao_social` VARCHAR(120) NULL,
  `cnpj` CHAR(14) NULL,
  `numero_imovel` INT NULL,
  `cep` CHAR(9) NULL,
  `email` VARCHAR(150) NULL,
  `telefone` VARCHAR(11) NULL,
  PRIMARY KEY (`id_empresa`)
);

CREATE TABLE IF NOT EXISTS `chamados` (
  `id_chamados` INT NOT NULL auto_increment,
  `titulo` VARCHAR(60) NULL,
  `descricao` VARCHAR(200) NULL,
  `data_hora` DATETIME NULL,
  `status` VARCHAR(30) NULL,
  `fk_componente` INT NOT NULL,
  `fk_empresa` INT NOT NULL,
  PRIMARY KEY (`id_chamados`),
  FOREIGN KEY (`fk_componente`) REFERENCES `componente` (`id_componente`),
  FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (id_empresa)
);

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_funcionario` INT NOT NULL primary key auto_increment,
  `nome` VARCHAR(120) NULL,
  `email` VARCHAR(150) NULL,
  `senha` VARCHAR(150) NULL,
  `cargo` VARCHAR(90) NULL,
  `cpf` CHAR(14) NULL,
  `permissao` INT NOT NULL,
  `fk_gerente` INT,
  `fk_empresa` INT NOT NULL,
  FOREIGN KEY (`fk_gerente`) REFERENCES funcionario(`id_funcionario`),
  FOREIGN KEY (`fk_empresa`) REFERENCES empresa(`id_empresa`)
);


CREATE TABLE IF NOT EXISTS `servidor` (
  `id_servidor` INT NOT NULL auto_increment,
  `nome` VARCHAR(60) NULL,
  `codigo` VARCHAR(50) NULL,
  `tipo` VARCHAR(100) NULL,
  `descricao` VARCHAR(200) NULL,
  `fk_empresa` INT NOT NULL,
  PRIMARY KEY (`id_servidor`),
  FOREIGN KEY (`fk_empresa`)REFERENCES `empresa` (`id_empresa`)
);


CREATE TABLE IF NOT EXISTS `unidade_medida` (
  `id_unidade_medida` INT NOT NULL auto_increment,
  `unidade_medida` VARCHAR(60) NULL,
  `tipo_medida` VARCHAR(60) NULL,
  `fk_componente` INT NOT NULL,
  PRIMARY KEY (`id_unidade_medida`),
    FOREIGN KEY (`fk_componente`)
    REFERENCES `componente` (`id_componente`)
);


CREATE TABLE IF NOT EXISTS `modelo_componente` (
  `id_modelo_componente` INT NOT NULL auto_increment,
  `modelo` VARCHAR(50) NULL,
  `fabricante` VARCHAR(60) NULL,
  `fk_servidor` INT NOT NULL,
  `fk_componente` INT NOT NULL,
  `metrica_maxima` VARCHAR(45) NULL,
  PRIMARY KEY (`id_modelo_componente`),
    FOREIGN KEY (`fk_servidor`)
    REFERENCES `servidor` (`id_servidor`),
    FOREIGN KEY (`fk_componente`)
    REFERENCES `componente` (`id_componente`)
);

CREATE TABLE IF NOT EXISTS `registro` (
  `id_registro` INT NOT NULL auto_increment,
  `valor_registro` DOUBLE NULL,
  `data_registro` DATETIME NULL,
  `fk_modelo_componente` INT NOT NULL,
  PRIMARY KEY (`id_registro`),
    FOREIGN KEY (`fk_modelo_componente`)
    REFERENCES `modelo_componente` (`id_modelo_componente`)
);
