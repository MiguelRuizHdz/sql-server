
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