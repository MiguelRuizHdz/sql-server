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

insert into medicamentos (nombre, laboratorio,precio,cantidad) 
values('Bayaspirina','Bayer',15.60,100); 

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

update peliculas set codigo=7 
where codigo=4; 

delete from peliculas 
where titulo='La vida es bella'; 

insert into peliculas (titulo,actor,duracion) 
values('Elsa y Fred','China Zorrilla',90); 

select * from peliculas; 

