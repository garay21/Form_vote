#### Creacion de base de datos Eliminamos si existe 
drop database if exists bd_votaciones; 
create database bd_votaciones;
use bd_votaciones;

##### tablas

## tabla para los votantes 
drop table if exists votantes;
create table votantes(
	rut varchar(12) primary key unique,
    nombre varchar(20) not null,
    alias varchar(20) not null,
    email varchar(50) not null,
    fk_comuna bigint not null,
    motivo varchar(50) not null
);

## tabla para cada voto almacenando id del candidatto y el id del votante
drop table if exists voto;
create table voto(
	id_voto bigint auto_increment primary key,
    fk_votante varchar(12) not null unique,
    fk_candidato bigint not null
);

## tabla para los candidato 
create table candidatos(
	id_candidato bigint auto_increment primary key,
    nombre varchar(20) not null
);

## tabla para las regiones
DROP TABLE IF EXISTS region;
CREATE TABLE region(
    region_id INT(5) NOT NULL AUTO_INCREMENT,
    region_name VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (region_id)
);

## tabla para las comunas
DROP TABLE IF EXISTS commune;
CREATE TABLE commune(
    commune_id INT NOT NULL AUTO_INCREMENT,
    commune_name VARCHAR(40) UNIQUE NOT NULL,
    fk_region_id INT NOT NULL, 
    PRIMARY KEY (commune_id),
    FOREIGN KEY (fk_region_id) REFERENCES region (region_id) 
);

-- //////////////////////////////////////////////////////////////////////////////////////////////////////--
-- PROCEDIMIENTOS DEL FORMULARIO--
-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv --
## procedimiento para agregar votante y el voto omitido
DELIMITER $$
DROP PROCEDURE IF exists IngresarFormulario$$ /*Ingresa una comuna*/
CREATE PROCEDURE IngresarFormulario(in nombre varchar(20), in alias varchar(20),in rut varchar(12),in email varchar(50),in comuna bigint, in motivo varchar(50), in idcandidato bigint)
BEGIN
	INSERT INTO `bd_votaciones`.`votantes` (`rut`, `nombre`, `alias`, `email`, `fk_comuna`, `motivo`) 
	VALUES (rut, nombre, alias, email, comuna, motivo);	
    INSERT INTO `bd_votaciones`.`voto` (`fk_votante`, `fk_candidato`) VALUES (rut, idcandidato);
END$$

-- //////////////////////////////////////////////////////////////////////////////////////////////////////--
-- PROCEDIMIENTOS DE REGIÓN Y COMUNA--
-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv --

INSERT INTO REGION VALUES (1, 'Tarapacá');
INSERT INTO REGION VALUES (2, 'Antofagasta');
INSERT INTO REGION VALUES (3, 'Atacama');
INSERT INTO REGION VALUES (4, 'Coquimbo');
INSERT INTO REGION VALUES (5, 'Valparaíso');
INSERT INTO REGION VALUES (6, 'M. de Santiago');
INSERT INTO REGION VALUES (7, 'O´Higgins');
INSERT INTO REGION VALUES (8, 'Maule');
INSERT INTO REGION VALUES (9, 'Ñuble');
INSERT INTO REGION VALUES (10, 'Biobío');
INSERT INTO REGION VALUES (11, 'Araucanía');
INSERT INTO REGION VALUES (12, 'Los Ríos');
INSERT INTO REGION VALUES (13, 'Los Lagos');
INSERT INTO REGION VALUES (14, 'Aysén');
INSERT INTO REGION VALUES (15, 'Arica y Parinacota');
INSERT INTO REGION VALUES (16, 'Magallanes / A.C');


DELIMITER $$
DROP PROCEDURE IF exists IngresarCom$$ /*Ingresa una comuna*/
CREATE PROCEDURE IngresarCom(IN nombre varchar(30), IN id_region int)
BEGIN
	INSERT IGNORE INTO commune (commune_name, fk_region_id) VALUES (nombre, id_region);
END$$

-- INGRESA TODAS LAS COMUNAS DE CHILE --
DELIMITER $$
DROP PROCEDURE IF exists IngresarALL$$ 
CREATE PROCEDURE IngresarALL()
BEGIN

CALL IngresarCom('Alto Hospicio',1);
CALL IngresarCom('Iquique',1);
CALL IngresarCom('Camiña',1);
CALL IngresarCom('Colchane',1);
CALL IngresarCom('Huara',1);
CALL IngresarCom('Pica',1);
CALL IngresarCom('Pozo Almoste',1);

CALL IngresarCom('Antofagasta',2);
CALL IngresarCom('Mejillones',2);
CALL IngresarCom('Sierra Gorda',2);
CALL IngresarCom('Taltal',2);
CALL IngresarCom('Calama',2);
CALL IngresarCom('Ollagüe',2);
CALL IngresarCom('San Pedro de Atacama',2);
CALL IngresarCom('María Elena',2);
CALL IngresarCom('Tocopilla',2);

CALL IngresarCom('Chañaral',3);
CALL IngresarCom('Diego de Almagro',3);
CALL IngresarCom('Caldera',3);
CALL IngresarCom('Copiapó',3);
CALL IngresarCom('Tierra Amarilla',3);
CALL IngresarCom('Alto del Carmen',3);
CALL IngresarCom('Freirina',3);
CALL IngresarCom('Huasco',3);
CALL IngresarCom('Vallenar',3);

CALL IngresarCom('Canela',4);
CALL IngresarCom('Illapel',4);
CALL IngresarCom('Los Vilos',4);
CALL IngresarCom('Salamanca',4);
CALL IngresarCom('Andacollo',4);
CALL IngresarCom('Coquimbo',4);
CALL IngresarCom('La Serena',4);
CALL IngresarCom('Paihuano',4);
CALL IngresarCom('Vicuña',4);
CALL IngresarCom('Combarbalá',4);
CALL IngresarCom('Monte Patria',4);
CALL IngresarCom('Ovalle',4);
CALL IngresarCom('Punitaqui',4);
CALL IngresarCom('Río Hurtado',4);

CALL IngresarCom('Isla de Pascua',5);
CALL IngresarCom('Calle Larga',5);
CALL IngresarCom('Los Andes',5);
CALL IngresarCom('Rinconada',5);
CALL IngresarCom('San Esteban',5);
CALL IngresarCom('Cabildo',5);
CALL IngresarCom('La Ligua',5);
CALL IngresarCom('Papudo',5);
CALL IngresarCom('Petorca',5);
CALL IngresarCom('Zapallar',5);
CALL IngresarCom('Hijuelas',5);
CALL IngresarCom('La Calera',5);
CALL IngresarCom('La Cruz',5);
CALL IngresarCom('Nogales',5);
CALL IngresarCom('Quillota',5);
CALL IngresarCom('Algarrobo',5);
CALL IngresarCom('Cartagena',5);
CALL IngresarCom('El Quisco',5);
CALL IngresarCom('El Tabo',5);
CALL IngresarCom('San Antonio',5);
CALL IngresarCom('Santo Domingo',5);
CALL IngresarCom('Catemu',5);
CALL IngresarCom('Llay-Llay',5);
CALL IngresarCom('Panquehue',5);
CALL IngresarCom('Putaendo',5);
CALL IngresarCom('San Felipe',5);
CALL IngresarCom('Santa María',5);
CALL IngresarCom('Casablanca',5);
CALL IngresarCom('Concón',5);
CALL IngresarCom('Juan Fernández',5);
CALL IngresarCom('Puchuncaví',5);
CALL IngresarCom('Quintero',5);
CALL IngresarCom('Valparaíso',5);
CALL IngresarCom('Viña del Mar',5);
CALL IngresarCom('Limache',5);
CALL IngresarCom('Olmué',5);
CALL IngresarCom('Quilpué',5);
CALL IngresarCom('Villa Alemana',5);

CALL IngresarCom('Colina',6);
CALL IngresarCom('Lampa',6);
CALL IngresarCom('Til Til',6);
CALL IngresarCom('Pirque',6);
CALL IngresarCom('Puente Alto',6);
CALL IngresarCom('San José de Maipo',6);
CALL IngresarCom('Buin',6);
CALL IngresarCom('Calera de Tango',6);
CALL IngresarCom('Paine',6);
CALL IngresarCom('San Bernardo',6);
CALL IngresarCom('Alhué',6);
CALL IngresarCom('Curacaví',6);
CALL IngresarCom('María Pinto',6);
CALL IngresarCom('Melipilla',6);
CALL IngresarCom('San Pedro',6);
CALL IngresarCom('Cerrillos',6);
CALL IngresarCom('Cerro Navia',6);
CALL IngresarCom('Conchalí',6);
CALL IngresarCom('El Bosque',6);
CALL IngresarCom('Estación Central',6);
CALL IngresarCom('Huechuraba',6);
CALL IngresarCom('Independencia',6);
CALL IngresarCom('La Cisterna',6);
CALL IngresarCom('La Granja',6);
CALL IngresarCom('La Florida',6);
CALL IngresarCom('La Pintana',6);
CALL IngresarCom('La Reina',6);
CALL IngresarCom('Las Condes',6);
CALL IngresarCom('Lo Barnechea',6);
CALL IngresarCom('Lo Espejo',6);
CALL IngresarCom('Lo Prado',6);
CALL IngresarCom('Macul',6);
CALL IngresarCom('Maipú',6);
CALL IngresarCom('Ñuñoa',6);
CALL IngresarCom('Pedro Aguirre Cerda',6);
CALL IngresarCom('Peñalolén',6);
CALL IngresarCom('Providencia',6);
CALL IngresarCom('Pudahuel',6);
CALL IngresarCom('Quilicura',6);
CALL IngresarCom('Quinta Normal',6);
CALL IngresarCom('Recoleta',6);
CALL IngresarCom('Renca',6);
CALL IngresarCom('San Miguel',6);
CALL IngresarCom('San Joaquín',6);
CALL IngresarCom('San Ramón',6);
CALL IngresarCom('Santiago',6);
CALL IngresarCom('Vitacura',6);
CALL IngresarCom('El Monte',6);
CALL IngresarCom('Isla de Maipo',6);
CALL IngresarCom('Padre Hurtado',6);
CALL IngresarCom('Peñaflor',6);
CALL IngresarCom('Talagante',6);

CALL IngresarCom('Codegua',7);
CALL IngresarCom('Coinco',7);
CALL IngresarCom('Coltauco',7);
CALL IngresarCom('Doñihue',7);
CALL IngresarCom('Graneros',7);
CALL IngresarCom('Las Cabras',7);
CALL IngresarCom('Machalí',7);
CALL IngresarCom('Malloa',7);
CALL IngresarCom('Mostazal',7);
CALL IngresarCom('Olivar',7);
CALL IngresarCom('Peumo',7);
CALL IngresarCom('Pichidegua',7);
CALL IngresarCom('Quinta de Tilcoco',7);
CALL IngresarCom('Rancagua',7);
CALL IngresarCom('Rengo',7);
CALL IngresarCom('Requínoa',7);
CALL IngresarCom('San Vicente de Tagua Tagua',7);
CALL IngresarCom('La Estrella',7);
CALL IngresarCom('Litueche',7);
CALL IngresarCom('Marchigüe',7);
CALL IngresarCom('Navidad',7);
CALL IngresarCom('Paredones',7);
CALL IngresarCom('Pichilemu',7);
CALL IngresarCom('Chépica',7);
CALL IngresarCom('Chimbarongo',7);
CALL IngresarCom('Lolol',7);
CALL IngresarCom('Nancagua',7);
CALL IngresarCom('Palmilla',7);
CALL IngresarCom('Peralillo',7);
CALL IngresarCom('Placilla',7);
CALL IngresarCom('Pumanque',7);
CALL IngresarCom('San Fernando',7);
CALL IngresarCom('Santa Cruz',7);

CALL IngresarCom('Cauquenes',8);
CALL IngresarCom('Chanco',8);
CALL IngresarCom('Pelluhue',8);
CALL IngresarCom('Curicó',8);
CALL IngresarCom('Hualañé',8);
CALL IngresarCom('Licantén',8);
CALL IngresarCom('Molina',8);
CALL IngresarCom('Rauco',8);
CALL IngresarCom('Romeral',8);
CALL IngresarCom('Sagrada Familia',8);
CALL IngresarCom('Teno',8);
CALL IngresarCom('Vichuquén',8);
CALL IngresarCom('Colbún',8);
CALL IngresarCom('Linares',8);
CALL IngresarCom('Longaví',8);
CALL IngresarCom('Parral',8);
CALL IngresarCom('Retiro',8);
CALL IngresarCom('San Javier',8);
CALL IngresarCom('Villa Alegre',8);
CALL IngresarCom('Yerbas Buenas',8);
CALL IngresarCom('Constituci n',8);
CALL IngresarCom('Curepto',8);
CALL IngresarCom('Empedrado',8);
CALL IngresarCom('Maule',8);
CALL IngresarCom('Pelarco',8);
CALL IngresarCom('Pencahue',8);
CALL IngresarCom('Río Claro',8);
CALL IngresarCom('San Clemente',8);
CALL IngresarCom('San Rafael',8);
CALL IngresarCom('Talca',8);

CALL IngresarCom('Cobquecura',9);
CALL IngresarCom('Coelemu',9);
CALL IngresarCom('Ninhue',9);
CALL IngresarCom('Portezuelo',9);
CALL IngresarCom('Quirihue',9);
CALL IngresarCom('Ránquil',9);
CALL IngresarCom('Trehuaco',9);
CALL IngresarCom('Bulnes',9);
CALL IngresarCom('Chillán Viejo',9);
CALL IngresarCom('Chillán',9);
CALL IngresarCom('El Carmen',9);
CALL IngresarCom('Pemuco',9);
CALL IngresarCom('Pinto',9);
CALL IngresarCom('Quillón',9);
CALL IngresarCom('San Ignacio',9);
CALL IngresarCom('Yungay',9);
CALL IngresarCom('Coihueco',9);
CALL IngresarCom('Ñiquén',9);
CALL IngresarCom('San Carlos',9);
CALL IngresarCom('San Fabián',9);
CALL IngresarCom('San Nicolás',9);

CALL IngresarCom('Arauco',10);
CALL IngresarCom('Cañete',10);
CALL IngresarCom('Contulmo',10);
CALL IngresarCom('Curanilahue',10);
CALL IngresarCom('Lebu',9);
CALL IngresarCom('Los Álamos',9);
CALL IngresarCom('Tirúa',10);
CALL IngresarCom('Alto Biobío',10);
CALL IngresarCom('Antuco',10);
CALL IngresarCom('Cabrero',10);
CALL IngresarCom('Laja',10);
CALL IngresarCom('Los Ángeles',10);
CALL IngresarCom('Mulchén',10);
CALL IngresarCom('Nacimiento',10);
CALL IngresarCom('Negrete',10);
CALL IngresarCom('Quilaco',10);
CALL IngresarCom('Quilleco',10);
CALL IngresarCom('San Rosendo',10);
CALL IngresarCom('Santa Bárbara',10);
CALL IngresarCom('Tucapel',10);
CALL IngresarCom('Yumbel',10);
CALL IngresarCom('Chiguayante',10);
CALL IngresarCom('Concepción',10);
CALL IngresarCom('Coronel',10);
CALL IngresarCom('Florida',10);
CALL IngresarCom('Hualpén',10);
CALL IngresarCom('Hualqui',10);
CALL IngresarCom('Lota',10);
CALL IngresarCom('Penco',10);
CALL IngresarCom('San Pedro de la Paz',10);
CALL IngresarCom('Santa Juana',10);
CALL IngresarCom('Talcahuano',10);
CALL IngresarCom('Tomé',10);

CALL IngresarCom('Carahue',11);
CALL IngresarCom('Cholchol',11);
CALL IngresarCom('Cunco',11);
CALL IngresarCom('Curarrehue',11);
CALL IngresarCom('Freire',11);
CALL IngresarCom('Galvarino',11);
CALL IngresarCom('Gorbea',11);
CALL IngresarCom('Lautaro',11);
CALL IngresarCom('Loncoche',11);
CALL IngresarCom('Melipeuco',11);
CALL IngresarCom('Nueva Imperial',11);
CALL IngresarCom('Padre Las Casas',11);
CALL IngresarCom('Perquenco',11);
CALL IngresarCom('Pitrufquén',11);
CALL IngresarCom('Pucón',11);
CALL IngresarCom('Puerto Saavedra',11);
CALL IngresarCom('Temuco',11);
CALL IngresarCom('Teodoro Schmidt',11);
CALL IngresarCom('Toltén',11);
CALL IngresarCom('Vilcún',11);
CALL IngresarCom('Villarrica',11);
CALL IngresarCom('Angol',11);
CALL IngresarCom('Collipulli',11);
CALL IngresarCom('Curacautín',11);
CALL IngresarCom('Ercilla',11);
CALL IngresarCom('Lonquimay',11);
CALL IngresarCom('Los Sauces',11);
CALL IngresarCom('Lumaco',11);
CALL IngresarCom('Purén',11);
CALL IngresarCom('Renaico',11);
CALL IngresarCom('Traiguén',11);
CALL IngresarCom('Victoria',11);

CALL IngresarCom('La Unión',12);
CALL IngresarCom('Futrono',12);
CALL IngresarCom('Lago Ranco',12);
CALL IngresarCom('Río Bueno',12);
CALL IngresarCom('Valdivia',12);
CALL IngresarCom('Corral',12);
CALL IngresarCom('Lanco',12);
CALL IngresarCom('Los Lagos',12);
CALL IngresarCom('Máfil',12);
CALL IngresarCom('Mariquina',12);
CALL IngresarCom('Paillaco',12);
CALL IngresarCom('Panguipulli',12);

CALL IngresarCom('Ancud',13);
CALL IngresarCom('Castro',13);
CALL IngresarCom('Chonchi',13);
CALL IngresarCom('Curaco de Vélez',13);
CALL IngresarCom('Dalcahue',13);
CALL IngresarCom('Puqueldón',13);
CALL IngresarCom('Queilén',13);
CALL IngresarCom('Quemchi',13);
CALL IngresarCom('Quellón',13);
CALL IngresarCom('Quinchao',13);
CALL IngresarCom('Calbuco',13);
CALL IngresarCom('Cochamó',13);
CALL IngresarCom('Fresia',13);
CALL IngresarCom('Frutillar',13);
CALL IngresarCom('Llanquihue',13);
CALL IngresarCom('Los Muermos',13);
CALL IngresarCom('Maullín',13);
CALL IngresarCom('Puerto Montt',13);
CALL IngresarCom('Puerto Varas',13);
CALL IngresarCom('Osorno',13);
CALL IngresarCom('Puerto Octay',13);
CALL IngresarCom('Purranque',13);
CALL IngresarCom('Puyehue',13);
CALL IngresarCom('Río Negro',13);
CALL IngresarCom('San Juan de la Costa',13);
CALL IngresarCom('San Pablo',13);
CALL IngresarCom('Chaitén',13);
CALL IngresarCom('Futaleufú',13);
CALL IngresarCom('Hualaihué',13);
CALL IngresarCom('Palena',13);

CALL IngresarCom('Cisnes',14);
CALL IngresarCom('Guaitecas',14);
CALL IngresarCom('Aysén',14);
CALL IngresarCom('Cochrane',14);
CALL IngresarCom('OHiggins',14);
CALL IngresarCom('Tortel',14);
CALL IngresarCom('Coyhaique',14);
CALL IngresarCom('Lago Verde',14);
CALL IngresarCom('Chile Chico',14);
CALL IngresarCom('Río Ibáñez',14);

CALL IngresarCom('Arica',15);
CALL IngresarCom('Camarones',15);
CALL IngresarCom('Putre',15);
CALL IngresarCom('General Lagos',15);

CALL IngresarCom('Antártica',16);
CALL IngresarCom('Cabo de Hornos',16);
CALL IngresarCom('Laguna Blanca',16);
CALL IngresarCom('Punta Arenas',16);
CALL IngresarCom('Río Verde',16);
CALL IngresarCom('San Gregorio',16);
CALL IngresarCom('Porvenir',16);
CALL IngresarCom('Primavera',16);
CALL IngresarCom('Timaukel',16);
CALL IngresarCom('Natales',16);
CALL IngresarCom('Torres del Paine',16);

END$$

/*v*/
CALL IngresarALL();