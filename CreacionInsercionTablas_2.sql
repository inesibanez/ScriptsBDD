-- Elimina las tablas si ya existen para evitar errores de creación.
DROP TABLE IF EXISTS RECURSOS_CLASES_BLOQUES;
DROP TABLE IF EXISTS RECURSOS;
DROP TABLE IF EXISTS BLOQUES;
GO

-- Crea la tabla RECURSOS que almacena información sobre los recursos educativos.
CREATE TABLE RECURSOS (
    ID VARCHAR(6),                -- Identificador único para cada recurso.
    ID_BUSQUEDA VARCHAR(5),       -- Identificador de búsqueda asociado al recurso.
    NOMBRE VARCHAR(100),          -- Nombre descriptivo del recurso.
    ENLACE VARCHAR(500),          -- Enlace al recurso (URL).
    INSTRUCCIONES VARCHAR(800),   -- Instrucciones asociadas al uso del recurso.
    ENLACE_IMAGEN VARCHAR(500),   -- Enlace a la imagen relacionada con el recurso.
    ENLACE_VIDEO VARCHAR(100),    -- Enlace a un video asociado con el recurso.
    AUTOR VARCHAR(150),           -- Autor del recurso.
    ORDEN INT,                    -- Orden del recurso dentro de un bloque.
    RECURSO_ADAPTADO VARCHAR(6),  -- Identificador de un recurso adaptado (si aplica).
    PRIMARY KEY (ID)              -- Define la clave primaria en el campo ID.
);

-- Crea la tabla BLOQUES que almacena información sobre los bloques temáticos.
CREATE TABLE BLOQUES (
    ID VARCHAR(2),               -- Identificador único para cada bloque.
    NOMBRE VARCHAR(255),         -- Nombre descriptivo del bloque.
    PRIMARY KEY (ID)             -- Define la clave primaria en el campo ID.
);
GO

-- Inserta datos iniciales en la tabla BLOQUES.
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

-- Inserta datos iniciales en la tabla RECURSOS.
-- Se ha eliminado el comando para no mostrar los datos.
GO


