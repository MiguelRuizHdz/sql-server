create table alumnos2 (matricula int identity, Nombre_completo varchar (100), nota decimal (5,2))

insert into alumnos2 values('Ana Acosta',8);
insert into alumnos2 values('Betina Bustos',9);
insert into alumnos2 values('Carlos Caseros',2.5); 
insert into alumnos2 values('Daniel Duarte',7.7);
insert into alumnos2 values('Estela Esper',3.4);
select * from alumnos2

-- Queremos mostrar el nombre y nota de cada alumno y en una columna
--  extra llamada "condicion" empleamos un case que testee la nota 
-- y muestre un mensaje diferente según la nota:
select Nombre_completo,nota, condicion=
 case nota
  when 0 then 'libre'
  when 1 then 'libre'
  when 2 then 'libre'
  when 3 then 'libre'
  when 4 then 'regular'
  when 5 then 'regular'
  when 6 then 'regular'
  when 7 then 'promocionado'
  when 8 then 'promocionado'
  when 9 then 'promocionado'
  when 10 then 'promocionado'
  -- else null --- cambia la salida si no encuentra nada
 end
 from alumnos2;

 -- Obtenemos la misma salida pero empleando el "case" con operadores de comparación:
select Nombre_completo, nota, condicion=
  case 
   when nota < 4 then 'libre'
   when nota >= 4 and nota < 7 then 'regular'
   when nota >= 7 then 'promocionado'
   else 'sin nota'
  end
from alumnos2;


-- PROCEDIMIENTOS ALMACENADOS

-- Creamos el procedimiento:
create procedure CONSULTAS_LIBRO
as
SELECT * FROM libros3 
WHERE cantidad <=150;

-- Ejecutar proc
EXECUTE CONSULTAS_LIBRO;

-- 1 PARAMETRO DE ENTRADA --

create procedure pa_libros_autor
@autor varchar(30)
as
select titulo, editorial, precio 
from libros3
where autor = @autor;

exec pa_libros_autor 'Lewis Carroll'

insert into libros3 values('C#','DESCONOCIDO','Planeta',100, 2);

--2 PARAMETROS DE ENTRADA
create procedure pa_libros_autor_editorial
  @autor varchar(30),
  @editorial varchar(20) 
 as
  select *
   from libros3
   where autor= @autor and
   editorial=@editorial;
     
  exec pa_libros_autor_editorial 'DESCONOCIDO','PLANETA';


 -- Eliminar procedimiento
 drop procedure pa_libros_autor_editorial;