
----- Practica 1

--- Crear la BD Películas y Salas. 
create table Peliculas ( 
	Codigo int identity primary key, 
	Nombre nvarchar(100), 
	CalificacionEdad int,
)

create table Salas ( 
	Codigo int identity primary key, 
	Nombre nvarchar(100), 
	Pelicula int, 
	foreign key(Pelicula) references Peliculas(Codigo)
)

--- Insertar 10 registros por tabla. 

insert into Peliculas (Nombre, CalificacionEdad) 
values('Minions: El origen de Gru', 1), ('Black Phone', 18), ('DC Liga de supermascotas', 1), ('Elvis', null), ('Thor: Love and Thunder', 13), ('Patatín y Patatón: Las vacaciones de Patatín', 1), ('Un héroe samurai: La leyenda de Hank', 1), ('¡Nop!', null), ('One Piece Gold', 13), ('Los perdonados', null); 

insert into Salas (Nombre, Pelicula) 
values ('Sala A', 1), ('Sala B', 2), ('Sala C', 3), ('Sala D', 4), ('Sala E', 5), ('Sala F', 6), ('Sala G', 7), ('Sala H', 8), ('Sala I', 9), ('Sala J', 10);
-- Crear la vista de esas tablas. 

-- Realizar las consultas del punto 4.1 al 4.10. 

-- 4.1. Mostrar el nombre de todas las películas.
SELECT Nombre FROM PELICULAS
-- 4.2. Mostrar las distintas calificaciones de edad que existen.
SELECT DISTINCT CalificacionEdad FROM PELICULAS
-- 4.3. Mostrar todas las películas que no han sido calificadas.
SELECT * FROM PELICULAS WHERE CalificacionEdad IS NULL
-- 4.4. Mostrar todas las salas que no proyectan ninguna película.
SELECT * FROM SALAS WHERE Pelicula IS NULL
-- 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película.
SELECT *
FROM SALAS LEFT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS.Codigo
-- 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.
SELECT *
FROM SALAS RIGHT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS.Codigo
-- 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala.
/* Con JOIN */
SELECT PELICULAS.Nombre
FROM SALAS RIGHT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS.Codigo
WHERE SALAS.Pelicula IS NULL
/* Con Subconsulta */
SELECT Nombre FROM PELICULAS
WHERE Codigo NOT IN
(
SELECT Pelicula FROM SALAS
WHERE Pelicula IS NOT NULL
)
-- 4.8. Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años.
INSERT INTO PELICULAS(Nombre,CalificacionEdad) VALUES('Uno, Dos, Tres',7)
-- 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no recomendables para menores de 13 años'.
UPDATE PELICULAS SET CalificacionEdad=13 WHERE CalificacionEdad IS NULL
-- 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos.
DELETE FROM SALAS WHERE Pelicula IN
(SELECT Codigo FROM PELICULAS WHERE CalificacionEdad = 0)

-- Crear una copia de seguridad de la BD. 

-- Exportar ambas tablas a Excel. 

-- Crear al menos 5 procedimientos almacenados. 

-- 1
create procedure CONSULTAS_PELICULAS
as
SELECT * FROM Peliculas 
WHERE CalificacionEdad = 1;

EXECUTE CONSULTAS_PELICULAS;


-- 2
create procedure CONSULTAS_PELICULASNC
as
SELECT * FROM Peliculas 
WHERE CalificacionEdad IS NULL;

EXECUTE CONSULTAS_PELICULASNC;

--3
create procedure CONSULTAR_SalasSinPelicula
as
SELECT * FROM SALAS
WHERE Pelicula IS NULL;

EXECUTE CONSULTAR_SalasSinPelicula;



-- 4
create procedure CONSULTAR_CLASIFICACIONES
as
SELECT DISTINCT CalificacionEdad 
FROM PELICULAS;

EXECUTE CONSULTAR_CLASIFICACIONES;

-- 5
create procedure BUSCAR_PELICULASBYCLASS
@CalificacionEdad INT
as
SELECT * FROM PELICULAS
WHERE CalificacionEdad = @CalificacionEdad;

EXECUTE BUSCAR_PELICULASBYCLASS '1';
