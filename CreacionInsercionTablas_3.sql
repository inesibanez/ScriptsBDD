-- Elimina la tabla RECURSOS_CLASES_BLOQUES si ya existe para evitar errores de creación.
DROP TABLE IF EXISTS RECURSOS_CLASES_BLOQUES;
GO

-- Crea la tabla RECURSOS_CLASES_BLOQUES que almacena la relación entre recursos, clases y bloques.
CREATE TABLE RECURSOS_CLASES_BLOQUES (
    ID_RECURSO VARCHAR(6),     -- Identificador del recurso (clave foránea hacia RECURSOS).
    ID_CLASE VARCHAR(10),      -- Identificador de la clase (clave foránea hacia CLASES).
    ID_BLOQUE VARCHAR(2),      -- Identificador del bloque (clave foránea hacia BLOQUES).
    PRIMARY KEY (ID_RECURSO, ID_CLASE, ID_BLOQUE)  -- Define la clave primaria compuesta por los tres identificadores.
);

-- Establece la relación entre RECURSOS_CLASES_BLOQUES y RECURSOS.
ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_recursos] FOREIGN KEY([ID_RECURSO])
REFERENCES RECURSOS ([ID])
ON UPDATE CASCADE             -- Si el ID del recurso cambia, también cambia en RECURSOS_CLASES_BLOQUES.
ON DELETE CASCADE;            -- Si un recurso se elimina, también se eliminan las relaciones asociadas en RECURSOS_CLASES_BLOQUES.

-- Establece la relación entre RECURSOS_CLASES_BLOQUES y CLASES.
ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_clases] FOREIGN KEY([ID_CLASE])
REFERENCES CLASES ([ID])
ON UPDATE CASCADE             -- Si el ID de la clase cambia, también cambia en RECURSOS_CLASESES_BLOQUES.
ON DELETE CASCADE;            -- Si una clase se elimina, también se eliminan las relaciones asociadas en RECURSOS_CLASES_BLOQUES.

-- Establece la relación entre RECURSOS_CLASES_BLOQUES y BLOQUES.
ALTER TABLE RECURSOS_CLASES_BLOQUES ADD CONSTRAINT [FK_recclablo_bloques] FOREIGN KEY([ID_BLOQUE])
REFERENCES BLOQUES ([ID])
ON UPDATE CASCADE             -- Si el ID del bloque cambia, también cambia en RECURSOS_CLASES_BLOQUES.
ON DELETE CASCADE;            -- Si un bloque se elimina, también se eliminan las relaciones asociadas en RECURSOS_CLASES_BLOQUES.
GO
	
-- Inserta datos iniciales en la tabla RECURSOS_CLASES_BLOQUES.
-- Se ha eliminado el comando para no mostrar los datos.
GO
	
	

	