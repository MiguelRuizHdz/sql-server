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
