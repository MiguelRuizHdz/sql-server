Use Farmacia; -- usar la base de datos

CREATE TABLE EMPLEADOS (ID int, Nombre varchar (50))
insert into EMPLEADOS values (1, 'Mario Juarez'),
(2, 'Jose Lopez'),
(3, 'Esteban Lozano'),
(4, 'Isai Sandoval'),
(5, 'Miguel Ruiz')
select * from EMPLEADOS;

delete from EMPLEADOS -- elimina solo registros.

drop table EMPLEADOS -- elimina toda la tabla.

select nombre from empleados;

select nombre from empleados where ID=5; -- Informacion

exec sp_tables @table_owner='dbo'; --sirve para visualizar las tablas existentes. 

exec sp_columns empleados; --sirve para visualizar las columnas definidas en la tabla. 

----------------------

create table alumnos1(Matricula int identity, nombre varchar(100)) -- Permite agregar un valor de identidad numerica secuencial 
insert into alumnos1 values ('Sergio Gonzalez'),('Maria Morales')
select * from alumnos1;

create table clientes (ID int primary key, nombre varchar(30)) -- Primary Key sirve para evitar duplicados 

-- insert into clientes values (1, 'Sergio Gonzalez'),(1, 'Maria Morales') -- Ya no es posible tener un duplicado en el ID
insert into clientes values (1,'Sergio Gonzalez'),(2, 'Maria Morales'), (3, 'Juan Rodriguez') 
select * from clientes;

---------------------

alter table clientes add direccion varchar(100) -- AGREGAR NUEVO CAMPO 
select * from clientes 

update clientes set direccion='TORRE MIRAVALLE' where ID = 1; -- Modifica uno en particular 
update clientes set direccion='AV CONSTITUCION' where ID = 2 -- Modifica uno en particular 
update clientes set direccion='AV UNIVERSIDAD' where ID = 3 -- Modifica uno en particular 


alter table clientes drop column direccion;--ELIMINA UN CAMPO EN ESPECIFICO 
select * from clientes 
alter table clientes alter column nombre varchar(50) -- EDITA EL CAMPO EN CUANTO A SU DEFINICION 

EXECUTE sp_rename 'clientes.nombre3', 'Nombre'; -- Para renombrar un campo de alguna tabla. 