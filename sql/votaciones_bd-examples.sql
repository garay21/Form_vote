select * from region;
select * from commune;

select * from candidatos;
select * from votantes;
select * from voto;

DELIMITER $$
DROP PROCEDURE IF exists IngresarFormulario$$ /*Ingresa una comuna*/
CREATE PROCEDURE IngresarFormulario(in nombre varchar(20), in alias varchar(20),in rut varchar(12),in email varchar(50),in comuna bigint, in motivo varchar(50), in idcandidato bigint)
BEGIN
	INSERT INTO `bd_votaciones`.`votantes` (`rut`, `nombre`, `alias`, `email`, `fk_comuna`, `motivo`) 
	VALUES (rut, nombre, alias, email, comuna, motivo);	
    INSERT INTO `bd_votaciones`.`voto` (`fk_votante`, `fk_candidato`) VALUES (rut, idcandidato);
END$$

INSERT INTO `bd_votaciones`.`candidatos` (`nombre`) VALUES ('Javier');
INSERT INTO `bd_votaciones`.`candidatos` (`nombre`) VALUES ('Camila');
INSERT INTO `bd_votaciones`.`candidatos` (`nombre`) VALUES ('Perez');
INSERT INTO `bd_votaciones`.`candidatos` (`nombre`) VALUES ('Jose');
