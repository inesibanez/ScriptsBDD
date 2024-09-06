-- Elimina las tablas si ya existen para evitar errores de creación.
DROP TABLE IF EXISTS RECURSOS_CLASES_BLOQUES;
DROP TABLE IF EXISTS CLASES;
DROP TABLE IF EXISTS NIVELES_EDUCATIVOS;
DROP TABLE IF EXISTS CURSOS;
DROP TABLE IF EXISTS MODALIDADES;
GO

-- Crea la tabla NIVELES_EDUCATIVOS que almacena los diferentes niveles educativos.
CREATE TABLE NIVELES_EDUCATIVOS (
    ID VARCHAR(2),              -- Identificador único para cada nivel educativo.
    NOMBRE VARCHAR(255),        -- Nombre descriptivo del nivel educativo.
    PRIMARY KEY (ID)            -- Define la clave primaria en el campo ID.
);

-- Crea la tabla CURSOS que almacena los diferentes cursos.
CREATE TABLE CURSOS (
    ID VARCHAR(2),              -- Identificador único para cada curso.
    NOMBRE VARCHAR(255),        -- Nombre descriptivo del curso.
    PRIMARY KEY (ID)            -- Define la clave primaria en el campo ID.
);

-- Crea la tabla MODALIDADES que almacena las diferentes modalidades educativas.
CREATE TABLE MODALIDADES (
    ID VARCHAR(2),              -- Identificador único para cada modalidad.
    NOMBRE VARCHAR(255),        -- Nombre descriptivo de la modalidad.
    PRIMARY KEY (ID)            -- Define la clave primaria en el campo ID.
);

-- Crea la tabla CLASES que almacena la información de las clases, incluyendo
-- el nivel educativo, curso y modalidad asociados.
CREATE TABLE CLASES (
    ID VARCHAR(10),             -- Identificador único para cada clase.
    NOMBRE VARCHAR(255),        -- Nombre descriptivo de la clase.
    ID_NIVEL_EDUCATIVO VARCHAR(2), -- Identificador del nivel educativo asociado.
    ID_CURSO VARCHAR(2),        -- Identificador del curso asociado.
    ID_MODALIDAD VARCHAR(2),    -- Identificador de la modalidad asociada.
    PRIMARY KEY (ID)            -- Define la clave primaria en el campo ID.
);

-- Establece la relación entre CLASES y NIVELES_EDUCATIVOS.
ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_niveles] FOREIGN KEY([ID_NIVEL_EDUCATIVO])
REFERENCES NIVELES_EDUCATIVOS ([ID])
ON UPDATE CASCADE            -- Si el ID del nivel educativo cambia, también cambia en CLASES.
ON DELETE CASCADE;           -- Si un nivel educativo se elimina, también se eliminan las clases asociadas.

-- Establece la relación entre CLASES y CURSOS.
ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_cursos] FOREIGN KEY([ID_CURSO])
REFERENCES CURSOS ([ID])
ON UPDATE CASCADE            -- Si el ID del curso cambia, también cambia en CLASES.
ON DELETE CASCADE;           -- Si un curso se elimina, también se eliminan las clases asociadas.

-- Establece la relación entre CLASES y MODALIDADES.
ALTER TABLE CLASES ADD CONSTRAINT [FK_clases_modalidades] FOREIGN KEY([ID_MODALIDAD])
REFERENCES MODALIDADES ([ID])
ON UPDATE CASCADE            -- Si el ID de la modalidad cambia, también cambia en CLASES.
ON DELETE CASCADE;           -- Si una modalidad se elimina, también se eliminan las clases asociadas.
GO

-- Inserta datos en la tabla NIVELES_EDUCATIVOS.
INSERT INTO NIVELES_EDUCATIVOS VALUES 
	('I', 'INFANTIL'),
	('P', 'PRIMARIA'),
	('E', 'E.S.O'),
	('B', 'BACHILLER');

-- Inserta datos en la tabla CURSOS.
INSERT INTO CURSOS VALUES 
	('1', '1º'),
	('2', '2º'),
	('3', '3º'),
	('4', '4º'),
	('5', '5º'),
	('6', '6º');

-- Inserta datos en la tabla MODALIDADES.
INSERT INTO MODALIDADES VALUES 
	('O', 'ORDINARIA'),
	('AC', 'ACADÉMICAS'),
	('AP', 'APLICADAS'),
	('CN', 'CIENCIAS'),
	('CS', 'LETRAS'),
	('E', 'TEA');
GO

-- Inserta datos en la tabla CLASES.
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