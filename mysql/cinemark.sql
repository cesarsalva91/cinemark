use cinemark;


-- *** creamos tabla usuario ***
drop table if exists usuario;
create table usuario(
idUsuario int auto_increment primary key,
nombre varchar (20) not null,
apellido varchar (20)not null,
dni int not null,
nomUsuario varchar (20) not null unique,/*restriccion, no puede exixtir dos valores uguales en la columna*/
pass varchar (12) not null,
email varchar (45) not null,
telefono int not null,
tipoAdmin boolean not null default 0
) engine=innodb default charset=utf8mb4 collate =utf8mb4_0900_ai_ci;
-- insetamos valores
insert into usuario(apellido,nombre,dni,nomUsuario,pass,email,telefono,tipoAdmin)
values('Almiron',' Sebastián',  545464, 'SebasAlmiron', '1234', 'sebasAl@gmal.com', 1557894, 0);
insert into usuario(apellido,nombre,dni,nomUsuario,pass,email,telefono,tipoAdmin)
values('Fernandez ','Ana in', 15445444, 'AnaFer', '1234', 'ana@gmal.com', 144444154, 0);
insert into usuario(apellido,nombre,dni,nomUsuario,pass,email,telefono,tipoAdmin)
values('Salva ','Cesar', 1211211, 'CesarSalva', '45565', 'salva@gmail.com', 545454, 1);
insert into usuario(apellido,nombre,dni,nomUsuario,pass,email,telefono,tipoAdmin)
values('Sarapura','Camila', ' 545464', 'CamilaSarapura', '1234', 'camisa@gmal.com', '144444154', 0);
select*from usuario;


-- *** creamos tabla sala ***

drop table if exists sala;
create table sala (
  idSala int auto_increment primary key,
  nomSala varchar(15) not null unique,
  capacidad int not null,
  sala3d boolean default 0
) engine=InnoDB charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- insertamos valores

insert into sala(nomSala,capacidad)
values('sala1',100);
insert into sala(nomSala,capacidad,sala3d)
values('sala2',45,1);
select*from sala;

-- *** creamos tabla butaca ***
drop table if exists butaca;
create table butaca(
idButaca int auto_increment primary key,
disponible boolean not null default 1,
idSala int not null,
foreign key(idSala)references sala(idSala)
)engine=innodb charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- insertamos valores

insert into butaca(idSala)
values(1);
insert into butaca(idSala)
values(1);
insert into butaca(idSala)
values(1);
insert into butaca(idSala)
values(1);
insert into butaca(idSala)
values(1);
select*from butaca;



-- *** creamos tabla pelicula ***


drop table if exists pelicula;
create table pelicula(
idPelicula int auto_increment primary key,
titulo varchar(45) not null,
info varchar(50) default null,
paraMayores int default null,
precio decimal (10,2)not null,
fecha date not null,
hora time not null,
idSala int not null,
foreign key(idSala)references sala(idSala)
)engine=innodb charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- insertamos valores

insert into pelicula(titulo,info,paraMayores,precio,fecha,hora,idSala)
values('batman','qwerty',13,764.23,'2022-07-10','20',2);
select*from pelicula;


-- *** creamos tabla pago***

drop table pago;
create table pago(
idPago int auto_increment primary key,
cantidadEntrada int not null,
importe decimal(10,2) not null,
porcentajeDescuento int
)engine=innodb charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- insertamos valores
insert into pago(cantidadEntrada,importe,porcentajeDescuento)
values(2,123.40,30);
select*from pago;

-- *** creamos tabla reservas ***


drop table if exists reserva;
create table reserva(
idReservas int auto_increment primary key,
pelicula int not null,
sala int not null,
butaca int not null,
pago int not null,
foreign key(pelicula)references pelicula(idPelicula),
foreign key(sala)references sala(idSala),
foreign key(butaca)references butaca(idButaca),
foreign key(pago)references pago(idPago)
)engine=innodb charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- insertamos valores
insert into reserva(pelicula,sala,butaca,pago)
values(1,1,1,1);
select*from reserva;


-- ** creamos tabla descuento ***

drop table if exists descuento;
create table descuento(
idDescuento int auto_increment primary key,
codigo varchar(10) not null unique,
porcentaje int not null,
info varchar(50)
)engine=innodb charset=utf8mb4 collate=utf8mb4_0900_ai_ci;



-- insertamos valores

insert into descuento(codigo,porcentaje,info)
value('qwerty21',25,'abcdefghi');
select*from descuento;











