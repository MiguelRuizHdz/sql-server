---- Prácticas


------- Práctica 1
create table libros ( 
  titulo varchar(20), 
  autor varchar(30), 
  editorial varchar(15)) 
 
 exec sp_columns libros 
 
 insert into libros(titulo,autor,editorial) values 
  ('El aleph','Borges','Emece') 
 insert into libros(titulo,autor,editorial) values 
  ('Martin Fierro','Jose Hernandez','Emece') 
 insert into libros(titulo,autor,editorial) values 
  ('Martin Fierro','Jose Hernandez','Planeta') 
 insert into libros(titulo,autor,editorial) values 
  ('Aprenda PHP','Mario Molina','Siglo XXI') 
 
 select * from libros 
  where autor='Borges' 
 
 select titulo from libros 
  where editorial='Emece' 
 
 select editorial from libros 
  where titulo='Martin Fierro' 



  
----- Practica 2 Parte 1
create table agenda1( 
    apellido varchar(30), 
    nombre varchar(20), 
    domicilio varchar(30), 
    telefono varchar(11)
);


insert into agenda1 (apellido,nombre,domicilio,telefono) 
values ('Acosta','Alberto','Colon 123','4234567'); 

insert into agenda1 (apellido,nombre,domicilio,telefono) 
values ('Juarez','Juan','Avellaneda 135','4458787'); 

insert into agenda1 (apellido,nombre,domicilio,telefono) 
values ('Lopez','Maria','Urquiza 333','4545454'); 

insert into agenda1(apellido,nombre,domicilio,telefono) 
values ('Lopez','Jose','Urquiza 333','4545454'); 

insert into agenda1 (apellido,nombre,domicilio,telefono) 
values ('Suarez','Susana','Gral. Paz 1234','4123456'); 

select * from agenda1; 

update agenda1 set nombre='Juan Jose' 
where nombre='Juan'; 

select * from agenda1; 

update agenda1 set telefono='4445566' 
where telefono='4545454'; 

select * from agenda1; 

update agenda1 set nombre='Juan Jose' 
where nombre='Juan';
select * from agenda1; 


----- Practica 2 Parte 2
create table libros1 ( 
    titulo varchar(30), 
    autor varchar(20), 
    editorial varchar(15), 
    precio float 
); 
 

insert into libros1 (titulo, autor, editorial, precio) 
values ('El aleph','Borges','Emece',25.00); 

insert into libros1 (titulo, autor, editorial, precio) 
values ('Martin Fierro','Jose Hernandez','Planeta',35.50); 

insert into libros1 (titulo, autor, editorial, precio) 
values ('Aprenda PHP','Mario Molina','Emece',45.50); 

insert into libros1 (titulo, autor, editorial, precio) 
values ('Cervantes y el quijote','Borges','Emece',25); 

insert into libros1 (titulo, autor, editorial, precio) 
values ('Matematica estas ahi','Paenza','Siglo XXI',15); 

select * from libros1; 

update libros1 set autor='Adrian Paenza' 
where autor='Paenza'; 

select * from libros1; 

update libros1 set autor='Adrian Paenza' 
where autor='Paenza'; 

select * from libros1; 

update libros1 set precio=27 
where autor='Mario Molina'; 

select * from libros1; 

update libros1 set editorial='Emece S.A.' 
where editorial='Emece'; 

select * from libros1; 



------- Práctica 3 parte 1

create table medicamentos( 
    codigo int identity, 
    nombre varchar(20) not null, 
    laboratorio varchar(20), 
    precio float, 
    cantidad integer 
); 

exec sp_columns medicamentos; 

insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100); 
insert into medicamentos (nombre, laboratorio,precio,cantidad) 
values('Buscapina','Roche',4.10,200); 
insert into medicamentos (nombre, laboratorio,precio,cantidad) 
values('Amoxidal 500','Bayer',15.60,100); 

select * from medicamentos; 

insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) 
values(4,'Amoxilina 500','Bayer',15.60,100); 

--update medicamentos set codigo=5 
--where nombre='Bayaspirina'; 

delete from medicamentos 
where codigo=3; 


select * from medicamentos; 





------- Práctica 3 parte 2

create table peliculas( 
    codigo int identity, 
    titulo varchar(40), 
    actor varchar(20), 
    duracion int, 
    primary key(codigo) 
); 

exec sp_columns peliculas; 

insert into peliculas (titulo,actor,duracion) 
values('Mision imposible','Tom Cruise',120); 
insert into peliculas (titulo,actor,duracion) 
values('Harry Potter y la piedra filosofal','Daniel R.',180); 
insert into peliculas (titulo,actor,duracion) 
values('Harry Potter y la camara secreta','Daniel R.',190); 
insert into peliculas (titulo,actor,duracion) 
values('Mision imposible 2','Tom Cruise',120); 
insert into peliculas (titulo,actor,duracion) 
values('La vida es bella','zzz',220); 

select * from peliculas; 

--update peliculas set codigo=7 
--where codigo=4; 

delete from peliculas 
where titulo='La vida es bella'; 

insert into peliculas (titulo,actor,duracion) 
values('Elsa y Fred','China Zorrilla',90); 

select * from peliculas; 


-------- Práctica 4

create table libros3( 
    codigo int identity, 
    titulo varchar(40) not null, 
    autor varchar(20) default 'Desconocido', 
    editorial varchar(20), 
    precio decimal(6,2), 
    cantidad int default 0, 
    primary key (codigo) 
); 

insert into libros3 (titulo,autor,editorial,precio) 
values('El aleph','Borges','Emece',25); 
insert into libros3 
values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100); 
insert into libros3 (titulo,autor,editorial,precio,cantidad) 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50); 

select titulo, autor,editorial,precio,cantidad, 
precio*cantidad as 'monto total' 
from libros3; 

select titulo,autor,precio, 
precio*0.1 as descuento, 
precio-(precio*0.1) as 'precio final' 
from libros3 
where editorial='Emece'; 

select titulo+'-'+autor as "Título y autor" 
from libros3; 


------- Práctica 5

create table articulos( 
    codigo integer, 
    nombre varchar(20), 
    descripcion varchar(30), 
    precio float, 
    cantidad integer 
); 

exec sp_columns articulos; 

insert into articulos (codigo, nombre, descripcion, precio,cantidad) 
values (1,'impresora','Epson Stylus C45',400.80,20); 
insert into articulos (codigo, nombre, descripcion, precio,cantidad) 
values (2,'impresora','Epson Stylus C85',500,30); 
insert into articulos (codigo, nombre, descripcion, precio,cantidad) 
values (3,'monitor','Samsung 14',800,10); 
insert into articulos (codigo, nombre, descripcion, precio,cantidad) 
values (4,'teclado','ingles Biswal',100,50); 
insert into articulos (codigo, nombre, descripcion, precio,cantidad) 
values (5,'teclado','español Biswal',90,50); 

select * from articulos 
where nombre='impresora'; 

select * from articulos 
where precio>=400; 

select codigo,nombre 
from articulos 
where cantidad<30; 

select nombre, descripcion 
from articulos 
where precio<>100; 