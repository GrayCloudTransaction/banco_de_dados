USE `ScriptGCT`;

CREATE OR REPLACE VIEW `vw_registro_geral` AS 
SELECT 
    `registro`.`data_registro`,
    `registro`.`valor_registro`,
    `unidade_medida`.`unidade_medida`,
    `unidade_medida`.`tipo_medida`,
    `modelo_componente`.`metrica_maxima`,
    `modelo_componente`.`modelo`,
    `modelo_componente`.`fabricante`,
    `modelo_componente`.`fk_servidor` 
    
FROM `registro` 
    INNER JOIN `modelo_componente` ON 
        `registro`.`fk_modelo_componente` = `modelo_componente`.`id_modelo_componente`
    
    INNER JOIN `componente` ON 
        `componente`.`id_componente` = `modelo_componente`.`fk_componente`

    INNER JOIN `unidade_medida` ON 
        `unidade_medida`.`fk_componente` = `componente`.`id_componente`;

SELECT * FROM `vw_registro_geral` WHERE `fk_servidor` = 1;

