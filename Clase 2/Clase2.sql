-- Columnas calculadas (operadores aritm�ticos y de concatenaci�n) 

create table libros( 
codigo int identity, 
titulo varchar(40), 
autor varchar(20) default 'Desconocido', 
editorial varchar(20), 
precio decimal(6,2), 
cantidad int default 0, 
primary key (codigo) 

) 

insert into libros (titulo,autor,editorial,precio) 
values('El aleph','Borges','Emece',25); 

insert into libros 
values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100); 

insert into libros (titulo,autor,editorial,precio,cantidad) 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50); 

-- Queremos saber el monto total en dinero de cada libro:  

select titulo, precio,cantidad, 
precio*cantidad as monto_total
from libros; 

-- Conocer el precio de cada libro con un 10% de descuento: 

select titulo,precio, 
precio-(precio*0.1) as descuento
from libros; 

-- Queremos una columna con el t�tulo, el autor y la editorial de cada libro: 

select titulo+'-'+autor+'-'+editorial 
from libros; 



-- Fase 1
-- Creaci�n de tablas, primary key y foreign key
create table fabricantes (codigo int identity primary key, nombre varchar(100) )
create table articulos (codigo int identity primary key, nombre varchar(100), precio int, fabricante int, foreign key(fabricante) references fabricantes(codigo) )

-- Fase 2
-- Colocaci�n de datos
insert into fabricantes values ('SONY'), ('MOTOROLA'), ('MOVISTAR');
select * from fabricantes;
insert into articulos values ('TV', 5000, 1), ('CELULARES', 4000, 2), ('TABLETS', 8000, 3);
select * from articulos;


-- Practica 1

-- Obtener los nombres de los productos de la tienda.
SELECT Nombre FROM ARTICULOS;

-- Obtener los nombres y los precios de los productos de la tienda.
SELECT Nombre, Precio FROM ARTICULOS;

-- Obtener el nombre de los productos cuyo precio sea menor o igual a 4000.
SELECT Nombre FROM ARTICULOS WHERE Precio <= 4000;

-- Obtener todos los datos de los art�culos cuyo precio est� entre los 4000 y los 12000 (ambas cantidades incluidas).
/* Con AND */
SELECT * FROM ARTICULOS
WHERE Precio >= 4000 AND Precio <= 12000;
/* Con BETWEEN */
SELECT * FROM ARTICULOS
WHERE Precio BETWEEN 4000 AND 12000;

-- Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166,386)
/* Sin AS */
SELECT Nombre, Precio * 166.386/20 FROM ARTICULOS;
/* Con AS */
SELECT Nombre, Precio * 166.386/20 AS PrecioPtas FROM ARTICULOS;

-- Seleccionar el precio medio (promedio) de todos los productos.
SELECT AVG(Precio) FROM ARTICULOS;

-- Obtener el precio medio de los art�culos cuyo c�digo de fabricante sea 2.
SELECT AVG(Precio) FROM ARTICULOS WHERE Fabricante=2;

-- Obtener el numero de art�culos cuyo precio sea mayor o igual a 6000.
SELECT COUNT(*) FROM ARTICULOS WHERE Precio >= 6000;

-- Obtener el nombre y precio de los art�culos cuyo precio sea mayor o igual a 6000
-- y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT Nombre, Precio FROM ARTICULOS
WHERE Precio >= 6000
ORDER BY Precio DESC, Nombre;

-- Obtener un listado completo de art�culos, incluyendo por cada articulo los datos del articulo y de su fabricante.
/* Sin INNER JOIN */
SELECT * FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/* Con INNER JOIN */
SELECT *
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo;


--- query similar a vista
SELECT fabricantes.nombre, articulos.nombre AS Articulos, articulos.precio
FROM articulos INNER JOIN fabricantes 
ON articulos.fabricante = fabricantes.codigo