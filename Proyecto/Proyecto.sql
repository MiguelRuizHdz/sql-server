--- Crear la BD MisClientesDeudores. 
Create database MCD;

USE MCD;

create table Clientes ( 
	Id int identity primary key NOT NULL, 
	Nombre varchar(45) NOT NULL, 
	Apellido varchar(45), 
	Telefono nchar(10),
	Direccion varchar(200), 
	Correo varchar(100)
)

create table Adeudos ( 
	Id int identity primary key NOT NULL, 
	IdCliente int NOT NULL,
	FechaCreacion datetime NOT NULL,
	Concepto varchar(50),
	Monto money,
	FechaPagarAntesDe datetime, 
	Saldo money,
	foreign key(IdCliente) references Clientes(Id)
)

create table Pagos ( 
	Id int identity primary key NOT NULL,
	IdAdeudo int NOT NULL,
	FechaPago datetime NOT NULL, 
	Monto money NOT NULL,
	foreign key(IdAdeudo) references Adeudos(Id)
)

insert into Clientes(Nombre, Apellido, Telefono, Direccion, Correo) values 
('Juan', 'Flores', 8183810102, 'TRIANGULOS 114, ARCO VIAL, MONTERREY, NL, C.P.66023', 'juan.flores@gmail.com'),
('Liz', 'Ponce',  8183871880, 'CLLE FLORA 201, GOLONDRINAS, MONTERREY, NL, C.P.66649', 'liz.ponce@gmail.com'),
('Luis', 'Díaz', 8111680323, 'AVE ROMULO GARZA LOC. 8, ANTIGUO CORRAL DE PIEDRA, MONTERREY, NL, C.P.66490', 'luis.diaz@gmail.com'),
('Karina', 'Sandoval', 8262673021, 'CLL 3 GUERRAS NO 107, ZAMBRANO, MONTEMORELOS, NL, C.P.67512', 'karina.sandoval@gmail.com'),
('Juliana', 'Bravo', 8182516019, 'AVE DIEGO DIAZ DE BERLANGA 196 LOC 25, HACIENDA DE SANTO DOMINGO, MONTERREY, NL, C.P.66449', 'juliana.bravo@gmail.com'),
('Reyna', 'Morales', 8112853486, 'PRV CUERNAVACA 1313, BUENOS AIRES, MONTERREY, NL, C.P.64800', 'reyna.morales@gmail.com'),
('Victor', 'Flores',  8183602407, 'CALLE INSURGENTES 2500 INT 34, VISTA HERMOSA, MONTERREY, NL, C.P.64620', 'victor.flores@gmail.com'),
('Alejandra', 'Pérez', 8212126335, 'CLL JOSE VASCONCELOS 200, DEL VALLE, MONTERREY, NL, C.P.66220', 'alejandra.perez@gmail.com'),
('Pedro', 'Mendoza', 8110934135, 'CLLE ANTIGUO CAMINO AL MILAGRO 113, EL MILAGRO, MONTERREY, NL, C.P.66634', 'pedro.mendoza@gmail.com'),
('Lourdes', 'Rojas', 8183480296, 'CLL VICENTE GUERRERO 3417, DEL NORTE, MONTERREY, NL, C.P.64500', 'lourdes.rojas@gmail.com');

insert into Adeudos(IdCliente, FechaCreacion, Concepto, Monto, FechaPagarAntesDe, Saldo) values
(1, '20220716 10:50:57 AM', 'Ropa', 801.43, '20220816', 801.43),
(2, '20220718 12:48:42 PM', 'Zapatos', 729.99, '20220818', 729.99),
(7, '20220721 11:22:32 AM', 'Cartera', 229.99, '20220821', 229.99),
(4, '20220721 09:24:12 AM', 'Libro', 319.99, '20220821', 319.99),
(2, '20220724 03:12:48 PM', 'Labial', 89.99, '20220824', 89.99),
(3, '20220726 11:47:18 AM', 'Estuche', 229.99, '20220826', 229.99),
(9, '20220727 03:22:28 PM', 'Pantalón', 479.99, '20220827', 479.99),
(5, '20220730 11:22:37 AM', 'Termo de colores', 329.99, '20220830', 329.99),
(6, '20220803 05:46:28 PM', 'Paraguas', 400, '20220903', 400),
(10, '20220804 04:52:34 PM', 'Mochila', 629.99, '20220904', 629.99);

insert into Pagos(IdAdeudo, FechaPago, Monto) values
(1, '20220720 12:20:26 PM', 200),
(2, '20220720 02:38:52 PM', 300),
(4, '20220724 09:24:12 AM', 200),
(3, '20220728 10:23:23 AM', 229.99),
(5, '20220731 11:37:16 AM', 20),
(6, '20220804 05:12:38 PM', 400),
(10, '20220805 09:52:34 AM', 390);

update Adeudos
set saldo = saldo - 200
where id = 1;
update Adeudos
set saldo = saldo - 300
where id = 2;
update Adeudos
set saldo = saldo - 200
where id = 4;
update Adeudos
set saldo = saldo - 229.99
where id = 3;
update Adeudos
set saldo = saldo - 20
where id = 5;
update Adeudos
set saldo = saldo - 400
where id = 6;
update Adeudos
set saldo = saldo - 390
where id = 10;


----- 15 Consultas ----

---1. Directorio de clientes
Select *
from clientes;

-- 2
Select * from Clientes where nombre = 'juan';

-- 3
Select Nombre, Monto, Concepto
from Adeudos as a INNER JOIN Clientes as c 
ON a.IdCliente = c.Id;

-- 4
Select *
from Clientes as c INNER JOIN Adeudos as a
ON c.Id = a.IdCliente where nombre = 'liz';

-- 5
SELECT SUM(Monto) as MeHanPagado FROM Pagos;

-- 6
SELECT Nombre, SUM(Saldo) as Adeudos
from Clientes as c INNER JOIN Adeudos as a
ON c.Id = a.IdCliente where nombre = 'liz'
Group By Nombre;

-- 7
SELECT SUM(Monto) as PagosHoy FROM Pagos
where FechaPago between convert(datetime,convert(varchar(11),GETDATE(),106)) and GETDATE();


-- 8
SELECT SUM(Monto) as AdeudosHoy FROM Adeudos
where fechaCreacion between convert(datetime,convert(varchar(11),GETDATE(),106)) and GETDATE();

-- 9
SELECT Count(*) TotalConceptosMeDeben FROM Adeudos Where saldo > 0;

-- 10
SELECT Sum(saldo) TotalMeDeben FROM Adeudos;

-- 11
Select * from Adeudos as a INNER JOIN Pagos as p 
ON a.Id = p.IdAdeudo;

-- 12
Select Sum(p.Monto) as Pagado
from Adeudos as a INNER JOIN Pagos as p 
ON a.Id = p.IdAdeudo
where idCliente = 2;

-- 13
Select a.concepto as Concepto, Sum(p.Monto) as Pagado,  a.monto as Total
from Adeudos as a INNER JOIN Pagos as p 
ON a.Id = p.IdAdeudo
where idCliente = 2
group by a.concepto, a.monto;

-- 14
SELECT Concepto, FechaPago, p.monto FROM Pagos as p  INNER JOIN Adeudos as a
ON a.Id = p.IdAdeudo
where FechaPago between convert(datetime,convert(varchar(11),GETDATE(),106)) and GETDATE();

-- 15
select Nombre+' ' + Apellido as "Nombre completo", condicion=
  case 
   when Saldo > 0 and FechaPagarAntesDe < GETDATE() then 'Pago atrasado'
   when Saldo > 0 and FechaPagarAntesDe > GETDATE() then 'Pago pendiente'
   when Saldo < 0 then 'Al corriente'
  end
from Adeudos as a INNER JOIN Clientes as c 
ON a.IdCliente = c.Id;



-- Procedimientos almacenados

-- 1
create procedure pa_cliente_debe_total
  @idCliente int
as
  SELECT Nombre, SUM(Saldo) as Adeudos
  from Clientes as c INNER JOIN Adeudos as a
  ON c.Id = a.IdCliente where idCliente = @idCliente
  Group By Nombre;

    exec pa_cliente_debe_total 1;

-- 2
create procedure pa_filtrar_adeudos_fechas
  @dateStart date,
  @dateFinal date
as
  SELECT SUM(Monto) as "Total en Adeudos" FROM Adeudos
  where fechaCreacion between @dateStart and @dateFinal;
  

    exec pa_filtrar_adeudos_fechas '20220801', '20220805';

-- 3
create procedure pa_filtrar_pagos_fechas
  @dateStart date,
  @dateFinal date
as
  SELECT SUM(Monto) as TotalPagos FROM Pagos
  where FechaPago between @dateStart and @dateFinal;
  

    exec pa_filtrar_pagos_fechas '20220801', '20220805';

-- 4
create procedure pa_cliente_adeudos_total
  @idCliente int
as
  SELECT Nombre, Concepto, FechaPagarAntesDe, Saldo
  from Clientes as c INNER JOIN Adeudos as a
  ON c.Id = a.IdCliente where idCliente = @idCliente;

    exec pa_cliente_adeudos_total 1;

-- 5
-- Pagar y actualizar adeudo
create procedure pa_pagar_adeudo
  @idadeudo int,
  @monto money
 as
  update Adeudos
  set saldo = saldo - @monto
  where id= @idadeudo;
  insert into Pagos(IdAdeudo, FechaPago, Monto) values
(@idadeudo, GETDATE(), @monto);
     
  exec pa_pagar_adeudo 1, 200;

