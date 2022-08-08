--------------- Practicas---------------

--------------- Practica 1 ---------------

-- 1.1 Obtener los nombres de los productos de la tienda.
SELECT Nombre FROM ARTICULOS;

-- 1.2 Obtener los nombres y los precios de los productos de la tienda.
SELECT Nombre, Precio FROM ARTICULOS;

-- 1.3 Obtener el nombre de los productos cuyo precio sea menor o igual a 4000.
SELECT Nombre FROM ARTICULOS WHERE Precio <= 4000;

-- 1.4 Obtener todos los datos de los art�culos cuyo precio est� entre los 4000 y los 12000 (ambas cantidades incluidas).
/* Con AND */
SELECT * FROM ARTICULOS
WHERE Precio >= 4000 AND Precio <= 12000;
/* Con BETWEEN */
SELECT * FROM ARTICULOS
WHERE Precio BETWEEN 4000 AND 12000;

-- 1.5 Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166,386)
/* Sin AS */
SELECT Nombre, Precio * 166.386/20 FROM ARTICULOS;
/* Con AS */
SELECT Nombre, Precio * 166.386/20 AS PrecioPtas FROM ARTICULOS;

-- Seleccionar el precio medio (promedio) de todos los productos.
SELECT AVG(Precio) FROM ARTICULOS;

-- 1.6 Obtener el precio medio de los art�culos cuyo c�digo de fabricante sea 2.
SELECT AVG(Precio) FROM ARTICULOS WHERE Fabricante=2;

-- 1.7 Obtener el numero de art�culos cuyo precio sea mayor o igual a 6000.
SELECT COUNT(*) FROM ARTICULOS WHERE Precio >= 6000;

-- 1.8 Obtener el nombre y precio de los art�culos cuyo precio sea mayor o igual a 6000
-- y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT Nombre, Precio FROM ARTICULOS
WHERE Precio >= 6000
ORDER BY Precio DESC, Nombre;

-- 1.9 Obtener un listado completo de art�culos, incluyendo por cada articulo los datos del articulo y de su fabricante.
/* Sin INNER JOIN */
SELECT * FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/* Con INNER JOIN */
SELECT *
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo;

-- 1.10 Obtener un listado de art�culos, incluyendo el nombre del art�culo, su precio, y el nombre de su fabricante.
/* Sin INNER JOIN */
SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/* Con INNER JOIN */
SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo;

-- 1.11 Obtener el precio medio de los productos de cada fabricante, mostrando solo los c�digos de fabricante.
SELECT AVG(Precio), Fabricante FROM ARTICULOS
GROUP BY Fabricante;

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los c�digos de fabricante.
SELECT AVG(Precio), Fabricante FROM ARTICULOS
GROUP BY Fabricante;

-- 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
/* Sin INNER JOIN */
SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre;
/* Con INNER JOIN */
SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre;

-- 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 6000.
/* Sin INNER JOIN */
SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
HAVING AVG(Precio) >= 6000
/* Con INNER JOIN */
SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
HAVING AVG(Precio) >= 6000;

-- 1.15. Obtener el nombre y precio del art�culo m�s barato.
SELECT Nombre, Precio
FROM ARTICULOS
WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS);

-- 1.16. Obtener una lista con el nombre y precio de los art�culos m�s caros de cada proveedor (incluyendo el nombre del proveedor).
/* Sin INNER JOIN */
SELECT A.Nombre, A.Precio, F.Nombre
FROM ARTICULOS A, FABRICANTES F
WHERE A.Fabricante = F.Codigo
	AND A.Precio =
	(
		SELECT MAX(A.Precio)
		FROM ARTICULOS A
		WHERE A.Fabricante = F.Codigo
	);
/* Con INNER JOIN */
SELECT A.Nombre, A.Precio, F.Nombre
FROM ARTICULOS A INNER JOIN FABRICANTES F
ON A.Fabricante = F.Codigo
	AND A.Precio =
	(
		SELECT MAX(A.Precio)
		FROM ARTICULOS A
		WHERE A.Fabricante = F.Codigo
	);

-- 1.17. A�adir un nuevo producto: Altavoces de 1400 (del fabricante 1)
INSERT INTO ARTICULOS( Nombre , Precio , Fabricante)
VALUES ( 'Altavoces' , 1400 , 1 )

-- 1.18. Cambiar el nombre del producto 8 a �Impresora Laser�
UPDATE ARTICULOS
SET Nombre = 'Impresora Laser'
WHERE Codigo = 8;

-- 1.19. Aplicar un descuento del 10% (multiplicar el precio por 0.9) a todos los productos.
UPDATE ARTICULOS
SET Precio = Precio * 0.9;

-- 1.20. Aplicar un descuento de $200 a todos los productos cuyo precio sea mayor o igual $240.
UPDATE ARTICULOS
SET Precio = Precio - 200
WHERE Precio >= 240;



--------------- Practica 2 ---------------

------ Creaci�n de tablas

-- Fase 1
-- Creaci�n de tablas, primary key y foreign key
create table departamentos (codigo int identity primary key, nombre varchar(100), presupuesto int )
create table empleados (dni varchar(8) primary key, nombre varchar(100), apellidos varchar(255), departamento int, foreign key(departamento) references departamentos(codigo) )

-- Fase 2
-- Colocaci�n de datos
insert into departamentos values ('L�gistica', 400000), ('RH', 200000), ('TI', 600000), ('Producci�n', 200000), ('Finanzas', 300000), ('Compras', 450000);
select * from departamentos;
insert into empleados values ('00000001', 'Juan', 'P�rez', 1), ('00000002', 'Franco', 'Herrera', 2), ('00000003', 'Carla', 'Garc�a', 2), ('00000004', 'Isabel', 'Garza', 3), ('00000005', 'Lucas', 'L�pez', 3), ('00000006', 'Sandra', 'R�mirez', 4), ('00000007', 'Jos�', 'Hern�ndez', 5), ('00000008', 'Alicia', 'Flores', 6), ('00000009', 'Valeria', 'Ayala', 1), ('00000010', 'Mar�a', 'L�pez', 3);
select * from empleados;

------- Ejercicios

-- 2.1. Obtener los apellidos de los empleados.
SELECT Apellidos FROM EMPLEADOS;

-- 2.2. Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT Apellidos FROM EMPLEADOS;

-- 2.3. Obtener todos los datos de los empleados que se apellidan 'L�pez'.
SELECT * FROM EMPLEADOS WHERE Apellidos = 'L�pez';

-- 2.4. Obtener todos los datos de los empleados que se apellidan 'L�pez' y los que se apellidan 'P�rez'.
/* Con OR */
SELECT * FROM EMPLEADOS
WHERE Apellidos = 'L�pez' OR Apellidos = 'P�rez'
/* Con IN */
SELECT * FROM EMPLEADOS
WHERE Apellidos IN ('L�pez' , 'P�rez')

-- 2.5. Obtener todos los datos de los empleados que trabajan para el departamento 4.
SELECT * FROM EMPLEADOS WHERE Departamento = 4;

-- 2.6. Obtener todos los datos de los empleados que trabajan para el departamento 3 y para el departamento 5.
/* Con OR */
SELECT * FROM EMPLEADOS
WHERE Departamento = 3 OR Departamento = 5;
/* Con IN */
SELECT * FROM EMPLEADOS
WHERE Departamento IN (3,5);

-- 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'.
SELECT * FROM EMPLEADOS
WHERE Apellidos LIKE 'P%';

-- 2.8. Obtener el presupuesto total de todos los departamentos.
SELECT SUM(Presupuesto) as Presupuesto_Total FROM DEPARTAMENTOS;

-- 2.9. Obtener el numero de empleados en cada departamento.
SELECT Departamento, COUNT(*) as Total_Empleados
FROM EMPLEADOS
GROUP BY Departamento;

-- 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
SELECT *
FROM EMPLEADOS INNER JOIN DEPARTAMENTOS
ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo;