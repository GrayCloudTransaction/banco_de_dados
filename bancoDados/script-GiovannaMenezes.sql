USE `ScriptGCT`

CREATE TABLE IF NOT EXISTS `processo_gm` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	pid INT,
    nome VARCHAR(200),
    uso_cpu DOUBLE,
    uso_memoria DOUBLE, 
    bytes_utilizados DOUBLE,
    swap_utilizada DOUBLE,
    data_registro DATETIME,
    fk_servidor INT NOT NULL,
    FOREIGN KEY (`fk_servidor`) REFERENCES servidor(`id_servidor`) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW `vw_processos_consumidores_gm` AS
 SELECT * FROM `processo_gm` 
 WHERE uso_cpu > 50 
 ORDER BY uso_cpu;
 
-- INSERTS
INSERT INTO `processo_gm` VALUES 
    (NULL, "2307", "firefox", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "1805", "java", 53.1, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "1311", "node", 52.5, 0.73, 0.0, 0.0, now(), 3),
    (NULL, "2307", "systemd", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "gsd-power", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "Isolated Web Co", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "gsd-smartcard", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "idle_inject/5", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "mariadbd", 20.9, 1.86, 0.0, 0.0, now(), 3),
    (NULL, "2307", "npm run dev", 20.9, 1.86, 0.0, 0.0, now(), 3),    
    (NULL, "2307", "firefox", 20.9, 1.86, 0.0, 0.0, now(), 2),
    (NULL, "1805", "java", 53.1, 1.86, 0.0, 0.0, now(), 2),
    (NULL, "1311", "node", 52.5, 0.73, 0.0, 0.0, now(), 2),
    (NULL, "2307", "systemd", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "gsd-power", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "Isolated Web Co", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "gsd-smartcard", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "idle_inject/5", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "mariadbd", 20.9, 1.86, 0.0, 0.0, now(), 1),
    (NULL, "2307", "npm run dev", 20.9, 1.86, 0.0, 0.0, now(), 1);

--  SELECTS 
 SELECT * FROM processo_gm;
 SELECT * FROM vw_processos_consumidores_gm WHERE fk_servidor = 3 LIMIT 10;