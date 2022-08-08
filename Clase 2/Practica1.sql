-- Practica 1

-- 1.1 Obtener los nombres de los productos de la tienda.
SELECT Nombre FROM ARTICULOS;

-- 1.2 Obtener los nombres y los precios de los productos de la tienda.
SELECT Nombre, Precio FROM ARTICULOS;

-- 1.3 Obtener el nombre de los productos cuyo precio sea menor o igual a 4000.
SELECT Nombre FROM ARTICULOS WHERE Precio <= 4000;

-- 1.4 Obtener todos los datos de los artículos cuyo precio esté entre los 4000 y los 12000 (ambas cantidades incluidas).
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

-- 1.6 Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
SELECT AVG(Precio) FROM ARTICULOS WHERE Fabricante=2;

-- 1.7 Obtener el numero de artículos cuyo precio sea mayor o igual a 6000.
SELECT COUNT(*) FROM ARTICULOS WHERE Precio >= 6000;

-- 1.8 Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 6000
-- y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT Nombre, Precio FROM ARTICULOS
WHERE Precio >= 6000
ORDER BY Precio DESC, Nombre;

-- 1.9 Obtener un listado completo de artículos, incluyendo por cada articulo los datos del articulo y de su fabricante.
/* Sin INNER JOIN */
SELECT * FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/* Con INNER JOIN */
SELECT *
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo;

-- 1.10 Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
/* Sin INNER JOIN */
SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/* Con INNER JOIN */
SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo;

-- 1.11 Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
SELECT AVG(Precio), Fabricante FROM ARTICULOS
GROUP BY Fabricante;

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
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

-- 1.15. Obtener el nombre y precio del artículo más barato.
SELECT Nombre, Precio
FROM ARTICULOS
WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS);

-- 1.16. Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
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

-- 1.17. Añadir un nuevo producto: Altavoces de 1400 (del fabricante 1)
INSERT INTO ARTICULOS( Nombre , Precio , Fabricante)
VALUES ( 'Altavoces' , 1400 , 1 )

-- 1.18. Cambiar el nombre del producto 8 a 'Impresora Laser'
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