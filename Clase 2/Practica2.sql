--------------- Practica 2 ---------------

------ Creación de tablas

-- Fase 1
-- Creación de tablas, primary key y foreign key
create table departamentos (codigo int identity primary key, nombre varchar(100), presupuesto int )
create table empleados (dni varchar(8) primary key, nombre varchar(100), apellidos varchar(255), departamento int, foreign key(departamento) references departamentos(codigo) )

-- Fase 2
-- Colocación de datos
insert into departamentos values ('Lógistica', 400000), ('RH', 200000), ('TI', 600000), ('Producción', 200000), ('Finanzas', 300000), ('Compras', 450000);
select * from departamentos;
insert into empleados values ('00000001', 'Juan', 'Pérez', 1), ('00000002', 'Franco', 'Herrera', 2), ('00000003', 'Carla', 'García', 2), ('00000004', 'Isabel', 'Garza', 3), ('00000005', 'Lucas', 'López', 3), ('00000006', 'Sandra', 'Rámirez', 4), ('00000007', 'José', 'Hernández', 5), ('00000008', 'Alicia', 'Flores', 6), ('00000009', 'Valeria', 'Ayala', 1), ('00000010', 'María', 'López', 3);
select * from empleados;


------- Ejercicios

-- 2.1. Obtener los apellidos de los empleados.
SELECT Apellidos FROM EMPLEADOS;

-- 2.2. Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT Apellidos FROM EMPLEADOS;

-- 2.3. Obtener todos los datos de los empleados que se apellidan 'López'.
SELECT * FROM EMPLEADOS WHERE Apellidos = 'López';

-- 2.4. Obtener todos los datos de los empleados que se apellidan 'López' y los que se apellidan 'Pérez'.
/* Con OR */
SELECT * FROM EMPLEADOS
WHERE Apellidos = 'López' OR Apellidos = 'Pérez'
/* Con IN */
SELECT * FROM EMPLEADOS
WHERE Apellidos IN ('López' , 'Pérez')

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