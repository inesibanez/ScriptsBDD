-- ==================================================================================
-- Script de Creación de Tablas y Relaciones para la apicación de GeoGebra.
-- Descripción: Este script crea las tablas necesarias para almacenar los datos 
--              relacionados con los niveles educativos, cursos, modalidades y clases 
--              en un sistema educativo estableciendo las relaciones entre estas
--				tablas. Después crea las tablas necesarias para almacenar los datos 
--              relacionados con los recursos y bloques.
--				Por último, crea la tabla de relación que conecta los recursos con 
--              las clases y los bloques y establece las claves foráneas para 
--              asegurar la integridad referencial entre las tablas relacionadas.
--				Rellena todas estas tablas con datos de inicio.
-- ==================================================================================

DROP TABLE IF EXISTS RECURSOS_CLASES_BLOQUES;
DROP TABLE IF EXISTS RECURSOS;
DROP TABLE IF EXISTS BLOQUES;
DROP TABLE IF EXISTS CLASES;
DROP TABLE IF EXISTS NIVELES_EDUCATIVOS;
DROP TABLE IF EXISTS CURSOS;
DROP TABLE IF EXISTS MODALIDADES;
GO

CREATE TABLE NIVELES_EDUCATIVOS (
    ID VARCHAR(2),
    NOMBRE VARCHAR(255),
    PRIMARY KEY (ID)
);

CREATE TABLE CURSOS (
    ID VARCHAR(2),
    NOMBRE VARCHAR(255),
    PRIMARY KEY (ID)
);

CREATE TABLE MODALIDADES (
    ID VARCHAR(2),
    NOMBRE VARCHAR(255),
    PRIMARY KEY (ID)
);

CREATE TABLE CLASES (
    ID VARCHAR(10),
    NOMBRE VARCHAR(255),
    ID_NIVEL_EDUCATIVO VARCHAR(2),
    ID_CURSO VARCHAR(2),
    ID_MODALIDAD VARCHAR(2),
    PRIMARY KEY (ID)
);

ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_niveles] FOREIGN KEY([ID_NIVEL_EDUCATIVO])
REFERENCES NIVELES_EDUCATIVOS ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_cursos] FOREIGN KEY([ID_CURSO])
REFERENCES CURSOS ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_modalidades] FOREIGN KEY([ID_MODALIDAD])
REFERENCES MODALIDADES ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;
GO

INSERT INTO NIVELES_EDUCATIVOS VALUES 
	('I', 'INFANTIL'),
	('P', 'PRIMARIA'),
	('E', 'E.S.O'),
	('B', 'BACHILLER');

INSERT INTO CURSOS VALUES 
	('1', '1º'),
	('2', '2º'),
	('3', '3º'),
	('4', '4º'),
	('5', '5º'),
	('6', '6º');

INSERT INTO MODALIDADES VALUES 
	('O', 'ORDINARIA'),
	('AC', 'ACADÉMICAS'),
	('AP', 'APLICADAS'),
	('CN', 'CIENCIAS'),
	('CS', 'LETRAS');
GO

INSERT INTO CLASES VALUES
	('1I', '3 AÑOS', 'I', '1', 'O'),
	('2I', '4 AÑOS', 'I', '2', 'O'),
	('3I', '5 AÑOS', 'I', '3', 'O'),
	('1P', '1º de Primaria', 'P', '1', 'O'),
	('2P', '2º de Primaria', 'P', '2', 'O'),
	('3P', '3º de Primaria', 'P', '3', 'O'),
	('4P', '4º de Primaria', 'P', '4', 'O'),
	('5P', '5º de Primaria', 'P', '5', 'O'),
	('6P', '6º de Primaria', 'P', '6', 'O'),
	('1E', '1º de E.S.O.', 'E', '1', 'O'),
	('2E', '2º de E.S.O.', 'E', '2', 'O'),
	('3EAC', '3º de E.S.O. (Académicas)', 'E', '3', 'AC'),
	('3EAP', '3º de E.S.O. (Aplicadas)', 'E', '3', 'AP'),
	('4EAC', '4º de E.S.O. (Académicas)', 'E', '4', 'AC'),
	('4EAP', '4º de E.S.O. (Aplicadas)', 'E', '4', 'AP'),
	('1BCN', '1º de Bachiller de Ciencias', 'B', '1', 'CN'),
	('1BCS', '1º de Bachiller de Ciencias Sociales', 'B', '1', 'CS'),
	('2BCN', '2º de Bachiller de Ciencias', 'B', '2', 'CN'),
	('2BCS', '2º de Bachiller de Ciencias Sociales', 'B', '2', 'CS'); 
GO    

CREATE TABLE RECURSOS (
    ID VARCHAR(6),
	ID_BUSQUEDA VARCHAR(5),
    NOMBRE VARCHAR(100),
    ENLACE VARCHAR(500),
    INSTRUCCIONES VARCHAR(800),
	ENLACE_IMAGEN VARCHAR(500),
    ENLACE_VIDEO VARCHAR(100),
	AUTOR VARCHAR(150),
	ORDEN INT,
	RECURSO_ADAPTADO VARCHAR(6),
	PRIMARY KEY (ID)
);

CREATE TABLE BLOQUES (
    ID VARCHAR(2),
    NOMBRE VARCHAR(255),
    PRIMARY KEY (ID)
);
GO

INSERT INTO BLOQUES VALUES 
	('G', 'GEOMETRÍA'),
	('N', 'NÚMEROS'),
	('A', 'ÁLGEBRA'),
	('F', 'FUNCIONES'),
	('E', 'ESTADÍSTICA'),
	('M', 'MEDIDA'),
	('L', 'HABILIDADES LÓGICAS'),
	('AD', 'RECURSOS ADAPTADOS')
;

-- INSERT INTO RECURSOS VALUES
-- Se ha eliminado el comando para no mostrar los datos.
GO  

CREATE TABLE RECURSOS_CLASES_BLOQUES (
    ID_RECURSO VARCHAR(6),
    ID_CLASE VARCHAR(10),
    ID_BLOQUE VARCHAR(2),
	PRIMARY KEY (ID_RECURSO, ID_CLASE, ID_BLOQUE)
);

ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_recursos] FOREIGN KEY([ID_RECURSO])
REFERENCES RECURSOS ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_clases] FOREIGN KEY([ID_CLASE])
REFERENCES CLASES ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_bloques] FOREIGN KEY([ID_BLOQUE])
REFERENCES BLOQUES ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE;
GO
	

-- INSERT INTO RECURSOS_CLASES_BLOQUES VALUES 
-- Se ha eliminado el comando para no mostrar los datos.
GO

CREATE PROCEDURE crea_hueco

	@numOrden AS INT
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE RECURSOS SET ORDEN=ORDEN+1 WHERE ORDEN >= @numOrden;
END
GO