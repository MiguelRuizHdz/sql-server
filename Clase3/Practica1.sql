
----- Practica 1

--- Crear la BD Almacenes. 
create table Almacenes ( 
	Codigo int identity primary key, 
	Lugar varchar(100), 
	Capacidad int, 
)

create table Cajas ( 
	NumReferencia char(5) primary key, 
	Contenido varchar(100), 
	Valor int,
	Almacen int,
	foreign key(Almacen) references Almacenes(Codigo)
)

--- Insertar 10 registros por tabla. 

insert into Almacenes (Lugar,Capacidad) 
values('Bilbao', 200), ('Valencia', 140), ('Sevilla', 100), ('Malaga', 200), ('Nueva York', 270), ('Guadalajara', 180), ('São Paulo', 170), ('Bogotá', 210), ('Monterrey', 240), ('Moscú', 190); 

insert into Cajas (NumReferencia, Contenido, Valor, Almacen) 
values('00001', 'Balones Sports', 120, 1), ('00002', 'Electronicos', 270, 2), ('00003', 'Ropa invierno', 160, 5), ('00004', 'Accesorios', 110, 3), ('00005', 'Ropa verano', 260, 4), 
('00006', 'Libros', 120, 6), ('00007', 'Electronicos', 270, 7), ('00008', 'Cables para celular', 160, 8), ('00009', 'Fundas', 110, 9), ('00010', 'Peluches', 260, 10);

-- Crear la vista de esas tablas. 

-- Realizar las consultas del punto 3.1 al 3.10. 

-- 3.1. Obtener todos los almacenes
SELECT * FROM ALMACENES
-- 3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a $150.
SELECT * FROM CAJAS WHERE Valor > 150
-- 3.3. Obtener los tipos de contenidos de las cajas.
SELECT DISTINCT Contenido FROM CAJAS
-- 3.4. Obtener el valor medio de todas las cajas.
SELECT AVG(Valor) FROM CAJAS
-- 3.5. Obtener el valor medio de las cajas de cada almacen.
SELECT Almacen, AVG(Valor)
FROM CAJAS
GROUP BY Almacen;

-- 3.6. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a $150.
SELECT Almacen, AVG(Valor)
FROM CAJAS
GROUP BY Almacen
HAVING AVG(Valor) > 150
-- 3.7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra.
SELECT NumReferencia, Lugar
FROM ALMACENES INNER JOIN CAJAS
ON ALMACENES.Codigo = CAJAS.Almacen
-- 3.8. Obtener el numero de cajas que hay en cada almacén.
/* Esta consulta no tiene en cuenta los almacenes vacíos */
SELECT Almacen, COUNT(*)
FROM CAJAS
GROUP BY Almacen
/* Esta consulta tiene en cuenta los almacenes vacíos */
SELECT Codigo, COUNT(NumReferencia)
FROM ALMACENES LEFT JOIN CAJAS
ON ALMACENES.Codigo = CAJAS.Almacen
GROUP BY Codigo
-- 3.9. Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad).
SELECT Codigo
FROM ALMACENES
WHERE Capacidad <
(
SELECT COUNT(*)
FROM CAJAS
WHERE Almacen = Codigo
)
-- 3.10. Obtener los numeros de referencia de las cajas que están en Bilbao.
/* Sin subconsultas */
SELECT NumReferencia
FROM ALMACENES LEFT JOIN CAJAS
ON ALMACENES.Codigo = CAJAS.Almacen
WHERE Lugar = 'Bilbao'
/* Con subconsultas */
SELECT NumReferencia
FROM CAJAS
WHERE Almacen IN
(
SELECT Codigo
FROM ALMACENES
WHERE Lugar = 'Bilbao'
)

-- Crear una copia de seguridad de la BD. 

-- Exportar ambas tablas a Excel. 
