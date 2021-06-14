CREATE DATABASE `BDBANCOS`;
USE BDBANCOS;

CREATE TABLE Provincia (
  pvcId INT NOT NULL,
  pvcDescripcion VARCHAR(45) NULL,
  pvc_pasId INT NULL,
  PRIMARY KEY (pvcId)
);

CREATE TABLE Localidad (
  locId INT NOT NULL,
  locDescripcion VARCHAR(45) NULL,
  loc_pvcId INT NULL,
  PRIMARY KEY (locId),
  CONSTRAINT fk_loc_provincia
    FOREIGN KEY (loc_pvcId)
    REFERENCES Provincia (pvcId)
);

CREATE TABLE `Prestamos`
(
 `Nro_Prestamo` int auto_increment,
 `Nro_Cuenta` int NOT NULL,
 `Fecha_Alta` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `Importe_Prestamo` decimal not null,
 `Importe_Total_Pagar` decimal not null,
 `Plazo_Meses` int not null,
 `Monto_Mensual` decimal not null,
 `Saldo_Restante` decimal not null,
 `Cuotas_Restantes` int not null,
 `Estado_Prestamo` bool not null default true,
 `Estado_Solicitud` bool not null default false,

 PRIMARY KEY (`Nro_Prestamo`));
 ALTER TABLE Prestamos AUTO_INCREMENT = 3245678; 
 
 create table `Usuarios`
 (
 `Dni_U` varchar(20) not null,
 `Cuil_U` varchar(20) null unique,
 `Username_U` varchar(20) null unique,
 `Password_U` varchar(20) null,
 `Tipo_U` int not null,
 `Nombre_U` varchar(30) not null,
 `Apellido_U` varchar(30) not null,
 `Sexo_U` varchar(30) not null,
 `Nacionalidad_U` varchar(30) not null,
 `Direccion_U` varchar(30) not null,
 `Localidad_U` varchar(30) not null,
 `Provincia_U` varchar(30) not null,
 `Fecha_Nacimiento_U` datetime not null,
 `Telefono_U` varchar(20) not null,
 `Mail_U` varchar(30) not null unique,
  `Estado_U` bool not null default true,
 
 primary key (`Dni_U`)
 );
 
 create table `Tipo_Usuarios`
 (
 `Tipo_Usuario` int not null,
 `Descripcion_TU` varchar(50) not null,
 
 primary key(`Tipo_Usuario`)
 );
 
  alter table Usuarios
 add constraint Tipo_U_FK foreign key (`Tipo_U`) references Tipo_Usuarios(`Tipo_Usuario`);
 
 create table Tipo_Cuentas
 (
  `Tipo_Cuenta_TC` int not null,
 `Descripcion_TC` varchar(50) not null,
 
 primary key(`Tipo_Cuenta_TC`)
 );

 create table `Cuentas` 
 (
 `Nro_Cuenta_C` int NOT NULL,
`Tipo_Cuenta_C` int NOT NULL,
 `Dni_C` varchar(20) not null,
  `CBU_C` varchar(50) null unique,
`Saldo_C` decimal not null default 10000,
`Estado_C` bool not null default true,
`Fecha_Alta` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

 primary key (`Nro_Cuenta_C`)
 );
 
   alter table Prestamos
 add constraint Nro_Cuenta_FK foreign key (`Nro_Cuenta`) references Cuentas(`Nro_Cuenta_C`);
 
 alter table Cuentas
 add constraint Tipo_Cuenta_C_FK foreign key (`Tipo_Cuenta_C`) references Tipo_Cuentas(`Tipo_Cuenta_TC`);
 
 alter table Cuentas
 add constraint Dni_C_FK foreign key (`Dni_C`) references Usuarios(`Dni_U`);
 
  create table Tipo_Movimientos
 (
  `Tipo_Movimientos_TM` int not null,
 `Descripcion_TM` varchar(50) not null,
 
 primary key(`Tipo_Movimientos_TM`)
 );

 create table `Movimientos` 
 (
 `Cod_Movimiento_M` int auto_increment NOT NULL,
	`Nro_Cuenta_M` int NOT NULL,
 `Tipo_Movimiento_M` int not null,
  `Importe_M` decimal not null,
  `Fecha_M` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `Mensaje_M` varchar(50) null,

 primary key (`Cod_Movimiento_M`)
 );
 
  alter table Movimientos
 add constraint Tipo_Movimiento_M_FK foreign key (`Tipo_Movimiento_M`) references Tipo_Movimientos(`Tipo_Movimientos_TM`);
 
  alter table Movimientos
 add constraint Nro_Cuenta_M_FK foreign key (`Nro_Cuenta_M`) references Cuentas(`Nro_Cuenta_C`);
 
 -- CARGA DE DATOS --
 
 -- TIPO DE USUARIOS --

 INSERT INTO Tipo_Usuarios (Tipo_Usuario, Descripcion_TU) VALUES (1,'Administrador'), (2, 'Cliente');
 
 -- USUARIOS --
 
-- admins --
INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('35987123','20-35987123-5','admin','admin',1,'Matias','Fernandez','Hombre','Argentino','José Hernandez 512','Villa Ballester','Buenos Aires','1990-12-31','4556-9807','armandogon@trustbank.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('32365777','20-32365777-5','soyadm','soyadm',1,'Natalia','Font','Mujer','Argentina','Cerrito 5332','CABA','Buenos Aires','1993-10-05','4334-9556','natifont@trustbank.com');

-- clientes --
INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('32870494','20-32870494-6','javscript','dog123',2,'Javier','Hernandez','Hombre','Argentino','Marengo 6522','Villa Martelli','Buenos Aires','1987-11-10','4689-1260','javi2002@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('28380245','17-28380245-2','belustm','cat123',2,'Belen','Gimenez','Mujer','Argentina','Av los incas 5423','Devoto','Buenos Aires','1989-03-01','4234-7654','belustm@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('29878594','20-29878594-6','Sofia23','sofi333',2,'Sofia','Reyes','Mujer','Argentina','Italia 2543','San Martin','Buenos Aires','2000-08-05','4766-6121','sofiareyes@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('37913882','20-37913882-6','gonzastm','gonzi24',2,'Gonzalo','Reyes','Hombre','Argentino','Mar del plata 1197','Del Viso','Buenos Aires','2000-11-15','4876-5454','gonzagenx@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('20875555','10-20875555-7','Alexandra23','aossa',2,'Alexandra','Ossa','Mujer','Colombia','Av Medallin 1442','Antioquia','Medallin','1980-04-22','-','aossa@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('16444555','20-16444555-6','juanci','jperez',2,'Juan','Perez','Hombre','Argentino','Av Corrientes 4422','Villa Crespo','Buenos Aires','1980-07-27','5566-7788','iamjp@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('28556744','20-28556744-5','ceci96','ceci96',2,'Cecilia','Martinez','Mujer','Argentina','Marcos sastre 3334','Villa Adelina','Buenos Aires','1985-12-15','4665-1234','cecilong@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('34578904','19-34578904-8','Martin33','pvsz333',2,'Martin','Sanchez','Hombre','Argentino','Paraná 5262','Villa Adelina','Buenos Aires','1992-05-05','4222-7653','martinsanchez@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('29006005','20-29006005-6','carito22','coco22',2,'Carolina','Dos Santos','Mujer','Argentina','Posadas 2342','Munro','Buenos Aires','1992-12-04','4234-1111','caro22@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('25556989','20-25556989-6','jero22','cmasmas',2,'Jeronimo','Diaz','Hombre','Argentino','Av 9 de julio 3322','CABA','Buenos Aires','1990-10-10','4124-0985','jeroval@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('20789054','20-35789054-3','adribtc','goeth',2,'Adrian','Jimenez','Hombre','Argentino','Av Maipu 2341','Olivos','Buenos Aires','1975-11-10','4359-1322','adribtc@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('22456778','20-22456778-6','jimenut','loveanimal',2,'Jimena','Lopez','Mujer','Argentina','Av La Plata 6562','CABA','Buenos Aires','1995-04-03','4256-6765','jimerrhh@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('23334567','20-23334567-6','Julianprog','juli88',2,'Julian','Acosta','Hombre','Argentino','Mariano Acosta 2332','Flores','Buenos Aires','1985-11-12','4556-7878','julianacosta@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('27557444','21-27557444-4','Gema','gema123',2,'Gema','Garcia Godoy','Mujer','Argentina','Av San Martin 2522','Escobar','Buenos Aires','1984-09-12','4567-1346','ggodoy@gmail.com');

INSERT INTO Usuarios (Dni_U, Cuil_U,Username_U,Password_U,Tipo_U,Nombre_U,Apellido_U,Sexo_U,Nacionalidad_U,Direccion_U,Localidad_U,Provincia_U,Fecha_Nacimiento_U,Telefono_U,Mail_U)
VALUES ('29334899','16-29334899-6','Luciano','luc33',2,'Luciano','Ruiz','Hombre','Argentino','Av Cabilod 3522','Palermo','Buenos Aires','1982-01-22','4344-3456','lruiz22@gmail.com');

-- TIPO DE CUENTAS -- 

 INSERT INTO Tipo_Cuentas (Tipo_Cuenta_TC,Descripcion_TC)
 VALUES (1,'Caja de ahorro') , (2,'Cuenta corriente');

-- CUENTAS -- 

INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550705,1,'28556744','8216262','2020-10-11'),(523567,2,'28556744','8214362','2020-10-11');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550706,1,'25556989','8216263','2020-10-12'),(523568,2,'25556989','8214363','2020-10-12');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550707,1,'27557444','8216264','2020-09-13'),(523569,2,'27557444','8214364','2020-09-13');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550708,1,'22456778','8216265','2020-11-09'),(523570,2,'22456778','8214365','2020-11-09'),(550709,1,'22456778','8214366','2020-11-09');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550710,1,'28380245','8216267','2020-11-05'),(523571,2,'28380245','5214336','2020-11-05'),(550711,1,'28380245','8214368','2020-11-05');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550712,1,'34578904','8216269','2020-05-05');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550713,1,'20875555','9216270','2020-06-06');
 
 INSERT INTO Cuentas (Nro_Cuenta_C,Tipo_Cuenta_C,Dni_C,CBU_C,Fecha_Alta)
 VALUES (550714,1,'32870494','6216271','2020-06-06');
 
-- TIPOS DE MOVIMIENTOS --

INSERT INTO Tipo_Movimientos (Tipo_Movimientos_TM,Descripcion_TM)
 VALUES (1,'Alta de cuenta'),(2,'Alta de prestamo'),(3,'Pago de prestamo'),(4,'Transferencia');

-- MOVIMIENTOS -- 

-- ALTA DE TODAS LAS CUENTAS REFLEJADO EN TABLA MOVIMIENTOS -- 
-- PENDIENTE CREAR TRIGGER O SP PARA CUANDO SE DA DE ALTA UNA CUENTA REFLEJARLO EN TABLA MOVIMIENTOS -- 

-- alta de cajas de ahorro --

 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550705,1,10000,'2020-10-11','Se da de alta cuenta nueva');
 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550706,1,10000,'2020-10-12','Se da de alta cuenta nueva');
  INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550707,1,10000,'2020-09-13','Se da de alta cuenta nueva');
   INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550708,1,10000,'2020-11-09','Se da de alta cuenta nueva');
    INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550709,1,10000,'2020-11-09','Se da de alta cuenta nueva');
     INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550710,1,10000,'2020-11-05','Se da de alta cuenta nueva');
      INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550711,1,10000,'2020-11-05','Se da de alta cuenta nueva');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,1,10000,'2020-05-05','Se da de alta cuenta nueva');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,1,10000,'2020-06-06','Se da de alta cuenta nueva');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550714,1,10000,'2020-06-06','Se da de alta cuenta nueva');
 
 -- alta de cuentas corrientes --
 
 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523567,1,10000,'2020-10-11','Se da de alta cuenta nueva');
 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523568,1,10000,'2020-10-12','Se da de alta cuenta nueva');
  INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523569,1,10000,'2020-09-13','Se da de alta cuenta nueva');
   INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523570,1,10000,'2020-11-09','Se da de alta cuenta nueva');
    INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523571,1,10000,'2020-11-05','Se da de alta cuenta nueva');
    
 -- prestamos -- 
       INSERT INTO Movimientos(Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550711,2,25000,'2020-11-06','Se da de alta nuevo prestamo');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,2,15000,'2020-05-12','Se da de alta nuevo prestamo');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,2,50000,'2020-07-10','Se da de alta nuevo prestamoa');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550714,2,30000,'2020-10-10','Se da de alta nuevo prestamo');
     INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523571,2,22000,'2020-11-09','Se da de alta nuevo prestamo');
 
 -- pago de prestamos -- 
 
       INSERT INTO Movimientos(Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,3,2500,'2020-06-12','Pago de cuota 1');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,3,2500,'2020-07-12','Pago de cuota 2');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,3,2500,'2020-08-12','Pago de cuota 3');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,3,2500,'2020-09-12','Pago de cuota 4');
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550712,3,2500,'2020-10-12','Pago de cuota 5');
 
 
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,3,8333,'2020-08-10','Pago de cuota 1');
        INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,3,8333,'2020-09-10','Pago de cuota 2');
   INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,3,8333,'2020-10-10','Pago de cuota 3');
    INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550713,3,8333,'2020-11-10','Pago de cuota 4');
 
       INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550714,3,5000,'2020-11-10','Pago de cuota 1');

 -- transferencias -- 
  INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550705,4,1000,'2020-10-15','Pago de honorarios');
 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550706,4,2300,'2020-10-15','Cuota');
  INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550707,4,4000,'2020-10-13','Pago de expensas');
   INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550708,4,250,'2020-11-09','No declara');
    INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (550709,4,8500,'2020-11-10','Pago de alquiler');
  INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523567,4,1200,'2020-10-11','Otros');
 INSERT INTO Movimientos (Nro_Cuenta_M,Tipo_Movimiento_M,Importe_M,Fecha_M,Mensaje_M)
 VALUES (523568,4,5000,'2020-10-30','Pago de servicios');

-- PRESTAMOS --

-- se generan en false para luego setear el estado desde el sector administrador --
-- cuanto se genera el pago de una cuota se setean las cuotas restantes y el monto restante a pagar --

INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550711,'2020-11-06',25000,50000,12,4167,50000,12);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550712,'2020-05-12',15000,30000,12,2500,17500,7);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550713,'2020-07-10',50000,100000,12,8333,66668,8);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550714,'2020-10-10',30000,60000,12,5000,55000,11);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523571,'2020-11-09',22000,44000,12,3666,44000,12);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523571,'2020-11-09',22000,44000,12,3666,44000,12);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550707,'2019-10-10',3000000,6000000,12,500000,500000,1);

INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550707,'2020-10-10',30000,60000,12,5000,55000,11);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523569,'2020-10-10',30000,60000,12,5000,55000,11);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523567,'2020-11-09',22000,44000,12,3666,44000,12);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (550707,'2020-6-10',30000,60000,12,5000,55000,11);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523569,'2020-6-12',30000,60000,12,5000,55000,11);
INSERT INTO Prestamos (Nro_Cuenta,Fecha_Alta,Importe_Prestamo,Importe_Total_Pagar,Plazo_Meses,Monto_Mensual,Saldo_Restante,Cuotas_Restantes)
VALUES (523567,'2020-7-09',22000,44000,12,3666,44000,12);

INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (1, 'BUENOS AIRES', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (2, 'CATAMARCA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (3, 'CHACO', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (4, 'CHUBUT', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (5, 'CÓRDOBA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (6, 'CORRIENTES', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (7, 'ENTRE RÍOS', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (8, 'FORMOSA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (9, 'JUJUY', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (10, 'LA PAMPA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (11, 'LA RIOJA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (12, 'MENDOZA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (13, 'MISIONES', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (14, 'NEUQUÉN', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (15, 'RÍO NEGRO', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (16, 'SALTA', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (17, 'SAN JUAN', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (18, 'SAN LUIS', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (19, 'SANTA CRUZ', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (20, 'SANTA FE', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (21, 'SANTIAGO DEL ESTERO', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (22, 'TIERRA DEL FUEGO', 1);
INSERT INTO provincia (pvcId , pvcDescripcion, pvc_pasId) VALUES (23, 'TUCUMÁN', 1);

INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1,'11 DE SEPTIEMBRE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2,'20 DE JUNIO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(3,'25 DE MAYO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(4,'25 DE MAYO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(5,'3 DE FEBRERO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(6,'A. ALSINA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(7,'ADOLFO GONZÁLES CHÁVES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(8,'ACASSUSO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(9,'ADROGUÉ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(10,'AGRONOMÍA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(11,'AGUAS VERDES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(12,'ALBERTI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(13,'ALDO BONZI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(14,'ALMAGRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(15,'ÁREA RESERVA CINTURÓN ECOLÓGICO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(16,'ARRECIFES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(17,'AVELLANEDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(18,'AYACUCHO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(19,'AZUL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(20,'BAHÍA BLANCA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(21,'BALCARCE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(22,'BALVANERA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(23,'BANFIELD',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(24,'BARADERO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(25,'BARRACAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(26,'BARRIO PARQUE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(27,'BARRIO SANTA TERESITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(28,'BECCAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(29,'BELGRANO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(30,'BELLA VISTA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(31,'BENITO JUÁREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(32,'BERAZATEGUI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(33,'BERISSO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(34,'BERNAL ESTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(35,'BERNAL OESTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(36,'BILLINGHURST',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(37,'BOCA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(38,'BOEDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(39,'BOLÍVAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(40,'BOULOGNE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(41,'BRAGADO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(42,'BRANDSEN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(43,'BURZACO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(44,'CABALLITO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(45,'CAMPANA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(46,'CAÑUELAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(47,'CAPILLA DEL SEÑOR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(48,'CAPITÁN SARMIENTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(49,'CARAPACHAY',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(50,'CARAPACHAY',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(51,'CARHUE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(52,'CARILÓ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(53,'CARLOS CASARES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(54,'CARLOS TEJEDOR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(55,'CARMEN DE ARECO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(56,'CARMEN DE PATAGONES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(57,'CASEROS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(58,'CASTELAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(59,'CASTELLI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(60,'CHACABUCO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(61,'CHACARITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(62,'CHASCOMÚS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(63,'CHIVILCOY',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(64,'CHURRUCA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(65,'CIUDAD EVITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(66,'CIUDAD MADERO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(67,'CIUDADELA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(68,'CLAYPOLE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(69,'COGHLAN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(70,'COLEGIALES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(71,'COLÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(72,'CONSTITUCIÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(73,'CORONEL DORREGO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(74,'CORONEL PRINGLES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(75,'CORONEL ROSALES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(76,'CORONEL SUAREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(77,'COSTA AZUL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(78,'COSTA CHICA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(79,'COSTA DEL ESTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(80,'COSTA ESMERALDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(81,'CRUCECITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(82,'DAIREAUX',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(83,'DARREGUEIRA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(84,'DEL VISO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(85,'DOCK SUD',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(86,'DOLORES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(87,'DON BOSCO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(88,'DON ORIONE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(89,'DON TORCUATO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(90,'EL JAGÜEL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(91,'EL LIBERTADOR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(92,'EL PALOMAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(93,'EL TALA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(94,'EL TRÉBOL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(95,'ENSENADA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(96,'ESCOBAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(97,'EXALTACIÓN DE LA CRUZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(98,'EZEIZA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(99,'EZPELETA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(100,'FLORENCIO VARELA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(101,'FLORENTINO AMEGHINO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(102,'FLORES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(103,'FLORESTA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(104,'FLORIDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(105,'FRANCISCO ÁLVAREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(106,'GARÍN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(107,'GERLI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(108,'GLEW',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(109,'GONZÁLEZ CATÁN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(110,'GENERAL ALVARADO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(111,'GENERAL ALVEAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(112,'GENERAL ARENALES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(113,'GENERAL BELGRANO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(114,'GENERAL GUIDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(115,'GENERAL LAMADRID',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(116,'GENERAL LAMADRID',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(117,'GENERAL LAS HERAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(118,'GENERAL LAVALLE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(119,'GENERAL MADARIAGA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(120,'GENERAL PACHECO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(121,'GENERAL PAZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(122,'GENERAL PINTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(123,'GENERAL PUEYRREDÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(124,'GENERAL RODRÍGUEZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(125,'GENERAL VIAMONTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(126,'GENERAL VILLEGAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(127,'GRAND BOURG',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(128,'GREGORIO DE LAFERRERE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(129,'GUAMINÍ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(130,'GUERNICA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(131,'GUILLERMO ENRIQUE HUDSON',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(132,'HAEDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(133,'HIPÓLITO YRIGOYEN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(134,'HURLINGHAM',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(135,'INGENIERO MASCHWITZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(136,'INGENIERO SOURDEAUX',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(137,'ISIDRO CASANOVA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(138,'ITUZAINGÓ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(139,'JOSÉ CLEMENTE PAZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(140,'JOSÉ INGENIEROS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(141,'JOSÉ MARMOL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(142,'JUNÍN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(143,'LA LUCILA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(144,'LA PATERNAL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(145,'LA PLATA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(146,'LA REJA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(147,'LA TABLADA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(148,'LANÚS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(149,'LAPRIDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(150,'LAS FLORES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(151,'LAS TONINAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(152,'LEANDRO NICÉFORO ALEM',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(153,'LINCOLN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(154,'LINIERS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(155,'LLAVALLOL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(156,'LOBERIA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(157,'LOBOS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(158,'LOMA HERMOSA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(159,'LOMAS DE ZAMORA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(160,'LOMAS DEL MILLÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(161,'LOMAS DEL MIRADOR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(162,'LONGCHAMPS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(163,'LOS CARDALES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(164,'LOS POLVORINES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(165,'LOS TOLDOS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(166,'LUCILA DEL MAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(167,'LUIS GUILLÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(168,'LUJÁN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(169,'MAGDALENA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(170,'MAIPÚ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(171,'MALVINAS ARGENTINAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(172,'MAR CHIQUITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(173,'MAR DE AJÓ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(174,'MAR DE LAS PAMPAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(175,'MAR DEL PLATA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(176,'MAR DEL TUYÚ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(177,'MARCOS PAZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(178,'MARTÍN CORONADO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(179,'MARTÍNEZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(180,'MATADEROS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(181,'MERCEDES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(182,'MERLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(183,'MINISTRO RIVADAVIA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(184,'MIRAMAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(185,'MONSERRAT',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(186,'MONTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(187,'MONTE CASTRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(188,'MONTE CHINGOLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(189,'MONTE GRANDE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(190,'MONTE HERMOSO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(191,'MORENO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(192,'MORÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(193,'MUNRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(194,'MUÑIZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(195,'NAVARRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(196,'NECOCHEA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(197,'NUEVA POMPEYA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(198,'NÚÑEZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(199,'OLAVARRÍA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(200,'OLIVOS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(201,'PABLO NOGUÉS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(202,'PABLO PODESTÁ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(203,'PALERMO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(204,'PARQUE AVELLANEDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(205,'PARQUE CHACABUCO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(206,'PARQUE CHAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(207,'PARQUE PATRICIOS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(208,'PARTIDO DE LA COSTA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(209,'PASO DEL REY',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(210,'PEHUAJÓ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(211,'PELLEGRINI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(212,'PEREYRA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(213,'PERGAMINO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(214,'PIGÜÉ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(215,'PILA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(216,'PILAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(217,'PINAMAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(218,'PINAR DEL SOL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(219,'PIÑEIRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(220,'PLÁTANOS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(221,'POLVORINES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(222,'PONTEVEDRA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(223,'PRESIDENTE PERÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(224,'PUÁN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(225,'PUERTO MADERO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(226,'PUNTA INDIO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(227,'QUILMES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(228,'RAFAEL CALZADA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(229,'RAFAEL CASTILLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(230,'RAMALLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(231,'RAMOS MEJÍA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(232,'RANELAGH',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(233,'RAUCH',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(234,'RECOLETA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(235,'REMEDIOS DE ESCALADA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(236,'RETIRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(237,'RIVADAVIA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(238,'ROJAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(239,'ROQUE PÉREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(240,'SAAVEDRA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(241,'SAAVEDRA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(242,'SÁENZ PEÑA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(243,'SALADILLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(244,'SALLIQUELÓ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(245,'SALTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(246,'SAN ANDRÉS DE GILES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(247,'SAN ANTONIO DE ARECO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(248,'SAN ANTONIO DE PADUA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(249,'SAN ANTONIO DE PADUA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(250,'SAN BERNARDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(251,'SAN CAYETANO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(252,'SAN CLEMENTE DEL TUYÚ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(253,'SAN CRISTÓBAL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(254,'SAN FERNANDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(255,'SAN FRANCISCO SOLANO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(256,'SAN ISIDRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(257,'SAN JOSÉ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(258,'SAN JUSTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(259,'SAN MARTÍN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(260,'SAN MIGUEL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(261,'SAN NICOLÁS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(262,'SAN NICOLÁS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(263,'SAN PEDRO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(264,'SAN TELMO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(265,'SAN VICENTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(266,'SANTA TERESITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(267,'SANTOS LUGARES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(268,'SARANDÍ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(269,'SOURIGUES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(270,'SUIPACHA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(271,'TANDIL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(272,'TAPALQUÉ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(273,'TAPIALES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(274,'TEMPERLEY',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(275,'TIGRE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(276,'TORDILLO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(277,'TORNQUIST',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(278,'TORTUGUITAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(279,'TRENQUE LAUQUEN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(280,'TRES LOMAS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(281,'TRISTÁN SUÁREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(282,'TRUJUI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(283,'TURDERA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(284,'VALENTÍN ALSINA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(285,'VÉLEZ SÁRSFIELD',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(286,'VERSALLES',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(287,'VICENTE LÓPEZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(288,'VILLA ADELINA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(289,'VILLA BALLESTER',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(290,'VILLA BOSCH',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(291,'VILLA CARAZA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(292,'VILLA CELINA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(293,'VILLA CENTENARIO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(294,'VILLA CRESPO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(295,'VILLA DE MAYO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(296,'VILLA DEL PARQUE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(297,'VILLA DEVOTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(298,'VILLA DIAMANTE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(299,'VILLA DOMÍNICO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(300,'VILLA ESPAÑA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(301,'VILLA FIORITO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(302,'VILLA GESELL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(303,'VILLA GENERAL MITRE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(304,'VILLA GUILLERMINA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(305,'VILLA INSUPERABLE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(306,'VILLA JOSÉ LEÓN SUÁREZ',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(307,'VILLA LA FLORIDA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(308,'VILLA LUGANO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(309,'VILLA LURO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(310,'VILLA LUZURIAGA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(311,'VILLA MARTELLI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(312,'VILLA OBRERA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(313,'VILLA ORTÚZAR',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(314,'VILLA PROGRESO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(315,'VILLA PUEYRREDÓN',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(316,'VILLA RAFFO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(317,'VILLA REAL',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(318,'VILLA RIACHUELO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(319,'VILLA SANTA RITA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(320,'VILLA SARMIENTO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(321,'VILLA SOLDATI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(322,'VILLA TESEI',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(323,'VILLA UDAONDO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(324,'VILLA URQUIZA',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(325,'VILLARINO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(326,'VIRREY DEL PINO',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(327,'WILDE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(328,'WILLIAM MORRIS',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(329,'ZÁRATE',1);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(330,'ACONQUIJA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(331,'ANCASTI',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(332,'ANDALGALÁ',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(333,'ANTOFAGASTA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(334,'BELÉN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(335,'CAPAYÁN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(336,'CAPITAL (CATAMARCA)',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(337,'CORRAL QUEMADO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(338,'EL ALTO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(339,'EL RODEO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(340,'F.MAMERTO ESQUIÚ',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(341,'FIAMBALÁ',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(342,'HUALFÍN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(343,'HUILLAPIMA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(344,'ICAÑO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(345,'LA PUERTA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(346,'LAS JUNTAS',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(347,'LONDRES',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(348,'LOS ALTOS',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(349,'LOS VARELA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(350,'MUTQUÍN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(351,'PACLÍN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(352,'POMAN',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(353,'POZO DE LA PIEDRA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(354,'PUERTA DE CORRAL',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(355,'PUERTA SAN JOSÉ',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(356,'RECREO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(357,'S.F.V DE 4',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(358,'SAN FERNANDO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(359,'SAN FERNANDO DEL VALLE',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(360,'SAN JOSÉ',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(361,'SANTA MARÍA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(362,'SANTA ROSA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(363,'SAUJIL',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(364,'TAPSO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(365,'TINOGASTA',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(366,'VALLE VIEJO',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(367,'VILLA VIL',2);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(368,'AVIÁ TERAÍ',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(369,'BARRANQUERAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(370,'BASAIL',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(371,'CAMPO LARGO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(372,'CAPITAL (CHACO)',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(373,'CAPITÁN SOLARI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(374,'CHARADAI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(375,'CHARATA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(376,'CHOROTIS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(377,'CIERVO PETISO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(378,'CNEL. DU GRATY',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(379,'COLONIA BENÍTEZ',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(380,'COLONIA ELISA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(381,'COLONIA POPULAR',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(382,'COLONIAS UNIDAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(383,'CONCEPCIÓN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(384,'CORZUELA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(385,'COTE LAI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(386,'EL SAUZALITO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(387,'ENRIQUE URIEN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(388,'FONTANA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(389,'FUERTE ESPERANZA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(390,'GANCEDO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(391,'GENERAL CAPDEVILA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(392,'GENERAL PINERO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(393,'GENERAL SAN MARTÍN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(394,'GENERAL VEDIA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(395,'HERMOSO CAMPO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(396,'ISLA DEL CERRITO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(397,'JUAN JOSE CASTELLI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(398,'LA CLOTILDE',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(399,'LA EDUVIGIS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(400,'LA ESCONDIDA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(401,'LA LEONESA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(402,'LA TIGRA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(403,'LA VERDE',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(404,'LAGUNA BLANCA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(405,'LAGUNA LIMPIA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(406,'LAPACHITO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(407,'LAS BREÑAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(408,'LAS GARCITAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(409,'LAS PALMAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(410,'LOS FRENTONES',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(411,'MACHAGAI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(412,'MAKALLÉ',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(413,'MARGARITA BELÉN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(414,'MIRAFLORES',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(415,'MISIÓN N. POMPEYA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(416,'NAPENAY',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(417,'PAMPA ALMIRÓN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(418,'PAMPA DEL INDIO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(419,'PAMPA DEL INFIERNO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(420,'PRESIDENCIA DE LA PLAZA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(421,'PRESIDENCIA ROCA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(422,'PRESIDENCIA ROQUE SÁENZ PEÑA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(423,'PUERTO BERMEJO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(424,'PUERTO EVA PERÓN',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(425,'PUERO TIROL',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(426,'PUERTO VILELAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(427,'QUITILIPI',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(428,'RESISTENCIA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(429,'SÁENZ PEÑA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(430,'SAMUHÚ',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(431,'SAN BERNARDO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(432,'SANTA SYLVINA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(433,'TACO POZO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(434,'TRES ISLETAS',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(435,'VILLA ÁNGELA',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(436,'VILLA BERTHET',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(437,'VILLA RÍO BERMEJITO',3);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(438,'ALDEA APELEG',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(439,'ALDEA BELEIRO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(440,'ALDEA EPULEF',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(441,'ALTO RÍO SENGERR',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(442,'BUEN PASTO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(443,'CAMARONES',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(444,'CARRENLEUFÚ',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(445,'CHOLILA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(446,'CO. CENTINELA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(447,'COLAN CONHUÉ',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(448,'COMODORO RIVADAVIA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(449,'CORCOVADO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(450,'CUSHAMEN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(451,'DIQUE F. AMEGHINO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(452,'DOLAVÓN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(453,'DR. RICARDO ROJAS',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(454,'EL HOYO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(455,'EL MAITÉN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(456,'EPUYÉN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(457,'ESQUEL',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(458,'FACUNDO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(459,'GAIMÁN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(460,'GAN GAN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(461,'GASTRE',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(462,'GOBERNADOR COSTA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(463,'GUALJAINA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(464,'JOSÉ DE SAN MARTÍN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(465,'LAGO BLANCO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(466,'LAGO PUELO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(467,'LAGUNITA SALADA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(468,'LAS PLUMAS',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(469,'LOS ALTARES',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(470,'PASO DE LOS INDIOS',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(471,'PASO DEL SAPO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(472,'PUERTO MADRYN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(473,'PUERTO PIRÁMIDES',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(474,'RADA TILLY',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(475,'RAWSON',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(476,'RÍO MAYO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(477,'RÍO PICO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(478,'SARMIENTO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(479,'TECKA',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(480,'TELSEN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(481,'TRELEW',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(482,'TREVELIN',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(483,'VEINTIOCHO DE JULIO',4);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(484,'ACHIRAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(485,'AGUA DE ORO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(486,'ALCIRA GIGENA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(487,'ALMAFUERTE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(488,'ALPA CORRAL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(489,'ALTA GRACIA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(490,'AMBOY',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(491,'ANISACATE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(492,'ARIAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(493,'ARROYITO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(494,'ARROYO DE LOS PATOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(495,'ASCOCHINGA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(496,'ATHOS PAMPA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(497,'BALLESTEROS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(498,'BALNEARIA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(499,'BELL VILLE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(500,'BERROTARÁN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(501,'BIALET MASSE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(502,'BRINKMANN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(503,'CABALANGO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(504,'CALMAYO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(505,'CAMINIAGA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(506,'CANALS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(507,'CAÑADA DEL SAUCE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(508,'CAPILLA DEL MONTE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(509,'CASA GRANDE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(510,'CAVANAGH',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(511,'CERRO CHAMPAQUI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(512,'CERRO COLORADO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(513,'CHARBONIER',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(514,'CIUDAD DE CÓRDOBA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(515,'COLONIA CAROYA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(516,'COPACABANA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(517,'CORONEL MOLDES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(518,'CORRAL DE BUSTOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(519,'COSQUÍN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(520,'CRUZ ALTA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(521,'CRUZ CHICA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(522,'CRUZ DEL EJE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(523,'CRUZ GRANDE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(524,'CUESTA BLANCA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(525,'DALMACIO VELEZ SARSFIELD',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(526,'DEAN FUNES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(527,'DEL CAMPILLO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(528,'DESPEÑADEROS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(529,'DEVOTO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(530,'EL DURAZNO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(531,'EL MANZANO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(532,'EL TÍO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(533,'EMBALSE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(534,'ESTANCIA VIEJA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(535,'FALDA DEL CARMEN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(536,'GENERAL BALDISSERA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(537,'GENERAL CABRERA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(538,'GENERAL DEHEZA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(539,'GENERAL LEVALLE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(540,'HERNANDO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(541,'HUERTA GRANDE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(542,'HUINCA RENANCO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(543,'ICHO CRUZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(544,'IFFLINGER',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(545,'INTIYACO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(546,'ISCHILÍN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(547,'JAMES CRAIK',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(548,'JESÚS MARÍA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(549,'JOSÉ DE LA QUINTANA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(550,'JOVITA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(551,'JUÁREZ CELMAN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(552,'JUSTINIANO POSSE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(553,'LA BOLSA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(554,'LABOULAYE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(555,'LA CALERA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(556,'LA CARLOTA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(557,'LA CESIRA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(558,'LA CRUZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(559,'LA CUMBRE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(560,'LA CUMBRECITA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(561,'LA FALDA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(562,'LA FRANCIA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(563,'LA GRANJA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(564,'LA HIGUERA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(565,'LA PAISANITA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(566,'LA PARA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(567,'LA PAZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(568,'LA POBLACIÓN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(569,'LA RANCHERITA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(570,'LAS ALBAHACAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(571,'LAS CALERAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(572,'LAS CALLES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(573,'LAS CHACRAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(574,'LA SERRANITA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(575,'LAS JARILLAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(576,'LAS PEÑAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(577,'LAS PERDICES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(578,'LAS RABONAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(579,'LAS TAPIAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(580,'LAS VARILLAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(581,'LEONES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(582,'LOMA BOLA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(583,'LOS CERRILLOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(584,'LOS COCOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(585,'LOS CÓNDORES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(586,'LOS GIGANTES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(587,'LOS HORNILLOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(588,'LOS MOLINOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(589,'LOS POZOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(590,'LOS REARTES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(591,'LOS SURGENTES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(592,'LOZA CORRAL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(593,'LUQUE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(594,'LUTTI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(595,'LUYABA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(596,'MARCOS JUÁREZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(597,'MARULL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(598,'MAYU SUMAJ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(599,'MENDIOLAZA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(600,'MINA CLAVERO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(601,'MIRAMAR',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(602,'MOLINARI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(603,'MONTE BUEY',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(604,'MONTE MAÍZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(605,'MORTEROS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(606,'NONO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(607,'OLIVA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(608,'ONCATIVO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(609,'ONGAMIRA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(610,'PANAHOLMA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(611,'PILAR',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(612,'POTRERO DE GARAY',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(613,'QUILINO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(614,'RIO CEBALLOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(615,'RÍO CUARTO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(616,'RÍO DE LOS SAUCES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(617,'RÍO PRIMERO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(618,'RÍO SEGUNDO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(619,'RIO TERCERO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(620,'SACANTA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(621,'SALDAN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(622,'SALSACATE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(623,'SALSIPUEDES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(624,'SAMPACHO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(625,'SAN AGUSTÍN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(626,'SAN A. DE ARREDONDO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(627,'SAN CARLOS MINAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(628,'SAN CLEMENTE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(629,'SAN ESTEBAN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(630,'SAN FRANCISCO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(631,'SAN FRANCISCO DEL CHAÑAR',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(632,'SAN JAVIER',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(633,'SAN JOSE DE LA DORMIDA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(634,'SAN LORENZO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(635,'SAN MARCOS SIERRAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(636,'SAN MIGUEL DE LOS RÍOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(637,'SAN ROQUE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(638,'SANTA CATALINA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(639,'SANTA CRUZ DEL LAGO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(640,'SANTA MARÍA DE PUNILLA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(641,'SANTA MÓNICA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(642,'SANTA ROSA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(643,'SEGUNDA USINA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(644,'SERRANO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(645,'SINSACATE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(646,'TALA HUASI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(647,'TANCACHA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(648,'TANTI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(649,'UCACHA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(650,'UNQUILLO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(651,'VALLE HERMOSO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(652,'VICUÑA MACKENNA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(653,'VILLA ALLENDE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(654,'VILLA ALPINA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(655,'VILLA AMANCAY',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(656,'VILLA ANIMI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(657,'VILLA ASCASUBI',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(658,'VILLA BERNA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(659,'VILLA CAÑADA DEL SAUCE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(660,'VILLA CARLOS PAZ',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(661,'VILLA CERRO AZUL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(662,'VILLA CIUDAD DE AMÉRICA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(663,'VILLA CIUDAD PARQUE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(664,'VILLA CURA BROCHERO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(665,'VILLA DEL DIQUE',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(666,'VILLA DEL ROSARIO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(667,'VILLA DEL TOTORAL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(668,'VILLA DE MARÍA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(669,'VILLA DE POCHO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(670,'VILLA DE SOTO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(671,'VILLA DE TULUMBA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(672,'VILLA DOLORES',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(673,'VILLA EL CHACAY',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(674,'VILLA GENERAL BELGRANO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(675,'VILLA GIARDINO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(676,'VILLA HUIDOBRO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(677,'VILLA LA MERCED',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(678,'VILLA DE LAS ROSAS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(679,'VILLA LOS AROMOS',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(680,'VILLA MARIA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(681,'VILLA PARQUE SIQUIMAN',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(682,'VILLA QUILLINZO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(683,'VILLA RUMIPAL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(684,'VILLA SAN MIGUEL',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(685,'VILLA SILVINA',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(686,'VILLA YACANTO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(687,'YACANTO',5);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(688,'ALVEAR',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(689,'BELLA VISTA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(690,'BERÓN DE ASTRADA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(691,'BONPLAND',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(692,'CAÁ CATI',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(693,'CAPITAL (CORRIENTES)',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(694,'CHAVARRÍA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(695,'COLONIA C. PELLEGRINI',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(696,'COLONIA LIBERTAD',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(697,'COLONIA LIEBIG',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(698,'COLONIA STA ROSA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(699,'CONCEPCIÓN',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(700,'CRUZ DE LOS MILAGROS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(701,'CURUZÚ-CUATIÁ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(702,'EMPEDRADO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(703,'ESQUINA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(704,'ESTACIÓN TORRENT',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(705,'FELIPE YOFRÉ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(706,'GARRUCHOS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(707,'GOBERNADOR AGRÓNOMO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(708,'GOBERNADOR MARTÍNEZ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(709,'GOYA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(710,'GUAVIRAVI',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(711,'HERLITZKA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(712,'ITA-IBATE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(713,'ITATÍ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(714,'ITUZAINGÓ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(715,'JOSÉ RAFAEL GÓMEZ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(716,'JUAN PUJOL',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(717,'LA CRUZ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(718,'LAVALLE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(719,'LOMAS DE VALLEJOS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(720,'LORETO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(721,'MARIANO INDALECIO LOZA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(722,'MBURUCUYÁ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(723,'MERCEDES',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(724,'MOCORETÁ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(725,'MONTE CASEROS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(726,'NUEVE DE JULIO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(727,'PALMAR GRANDE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(728,'PARADA PUCHETA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(729,'PASO DE LA PATRIA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(730,'PASO DE LOS LIBRES',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(731,'PEDRO R. FERNANDEZ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(732,'PERUGORRÍA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(733,'PUEBLO LIBERTADOR',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(734,'RAMADA PASO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(735,'RIACHUELO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(736,'SALADAS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(737,'SAN ANTONIO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(738,'SAN CARLOS',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(739,'SAN COSME',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(740,'SAN LORENZO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(741,'20 DEL PALMAR',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(742,'SAN MIGUEL',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(743,'SAN ROQUE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(744,'SANTA ANA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(745,'SANTA LUCÍA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(746,'SANTO TOMÉ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(747,'SAUCE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(748,'TABAY',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(749,'TAPEBICUÁ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(750,'TATACUA',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(751,'VIRASORO',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(752,'YAPEYÚ',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(753,'YATAITÍ CALLE',6);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(754,'ALARCÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(755,'ALCARAZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(756,'ALCARAZ N.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(757,'ALCARAZ S.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(758,'ALDEA ASUNCIÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(759,'ALDEA BRASILERA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(760,'ALDEA ELGENFELD',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(761,'ALDEA GRAPSCHENTAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(762,'ALDEA MARÍA LUISA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(763,'ALDEA PROTESTANTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(764,'ALDEA SALTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(765,'ALDEA SAN ANTONIO (G)',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(766,'ALDEA SAN ANTONIO (P)',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(767,'ALDEA 19',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(768,'ALDEA SAN MIGUEL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(769,'ALDEA SAN RAFAEL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(770,'ALDEA SPATZENKUTTER',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(771,'ALDEA SANTA MARÍA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(772,'ALDEA SANTA ROSA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(773,'ALDEA VALLE MARÍA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(774,'ALTAMIRANO SUR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(775,'ANTELO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(776,'ANTONIO TOMÁS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(777,'ARANGUREN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(778,'ARROYO BARÚ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(779,'ARROYO BURGOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(780,'ARROYO CLÉ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(781,'ARROYO CORRALITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(782,'ARROYO DEL MEDIO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(783,'ARROYO MATURRANGO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(784,'ARROYO PALO SECO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(785,'BANDERAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(786,'BASAVILBASO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(787,'BETBEDER',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(788,'BOVRIL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(789,'CASEROS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(790,'CEIBAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(791,'CERRITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(792,'CHAJARÍ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(793,'CHILCAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(794,'CLODOMIRO LEDESMA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(795,'COLONIA ALEMANA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(796,'COLONIA AVELLANEDA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(797,'COLONIA AVIGDOR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(798,'COLONIA AYUÍ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(799,'COLONIA BAYLINA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(800,'COLONIA CARRASCO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(801,'COLONIA CELINA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(802,'COLONIA CERRITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(803,'COLONIA CRESPO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(804,'COLONIA ELIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(805,'COLONIA ENSAYO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(806,'COLONIA GENERAL ROCA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(807,'COLONIA LA ARGENTINA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(808,'COLONIA MEROU',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(809,'COLONIA OFICIAL Nª3',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(810,'COLONIA OFICIAL Nº13',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(811,'COLONIA OFICIAL Nº14',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(812,'COLONIA OFICIAL Nº5',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(813,'COLONIA REFFINO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(814,'COLONIA TUNAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(815,'COLONIA VIRARÓ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(816,'COLÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(817,'CONCEPCIÓN DEL URUGUAY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(818,'CONCORDIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(819,'CONSCRIPTO BERNARDI',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(820,'COSTA GRANDE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(821,'COSTA SAN ANTONIO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(822,'COSTA URUGUAY N.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(823,'COSTA URUGUAY S.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(824,'CRESPO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(825,'CRUCECITAS 3ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(826,'CRUCECITAS 7ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(827,'CRUCECITAS 8ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(828,'CUCHILLA REDONDA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(829,'CURTIEMBRE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(830,'DIAMANTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(831,'DISTRITO 6º',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(832,'DISTRITO CHAÑAR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(833,'DISTRITO CHIQUEROS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(834,'DISTRITO CUARTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(835,'DISTRITO DIEGO LÓPEZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(836,'DISTRITO PAJONAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(837,'DISTRITO SAUCE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(838,'DISTRITO TALA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(839,'DISTRITO TALITAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(840,'DON CRISTÓBAL 1ª SECCIÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(841,'DON CRISTÓBAL 2ª SECCIÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(842,'DURAZNO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(843,'EL CIMARRÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(844,'EL GRAMILLAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(845,'EL PALENQUE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(846,'EL PINGO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(847,'EL QUEBRACHO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(848,'EL REDOMÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(849,'EL SOLAR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(850,'ENRIQUE CARBO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(851,'ESPINILLO N.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(852,'ESTACIÓN CAMPOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(853,'ESTACIÓN ESCRIÑA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(854,'ESTACIÓN LAZO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(855,'ESTACIÓN RAÍCES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(856,'ESTACIÓN YERÚA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(857,'ESTANCIA GRANDE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(858,'ESTANCIA LÍBAROS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(859,'ESTANCIA RACEDO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(860,'ESTANCIA SOLÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(861,'ESTANCIA YUQUERÍ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(862,'ESTAQUITAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(863,'FAUSTINO M. PARERA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(864,'FEBRE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(865,'FEDERACIÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(866,'FEDERAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(867,'GOBERNADOR ECHAGÜE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(868,'MANSILLA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(869,'GILBERT',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(870,'GONZÁLEZ CALDERÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(871,'GENERAL ALMADA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(872,'GENERAL ALVEAR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(873,'GENERAL CAMPOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(874,'GENERAL GALARZA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(875,'GENERAL RAMÍREZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(876,'GUALEGUAY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(877,'GUALEGUAYCHÚ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(878,'GUALEGUAYCITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(879,'GUARDAMONTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(880,'HAMBIS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(881,'HASENKAMP',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(882,'HERNANDARIAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(883,'HERNÁNDEZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(884,'HERRERA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(885,'HINOJAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(886,'HOCKER',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(887,'INGENIERO SAJAROFF',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(888,'IRAZUSTA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(889,'ISLETAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(890,'JUAN JOSE DE URQUIZA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(891,'JUBILEO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(892,'LA CLARITA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(893,'LA CRIOLLA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(894,'LA ESMERALDA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(895,'LA FLORIDA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(896,'LA FRATERNIDAD',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(897,'LA HIERRA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(898,'LA OLLITA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(899,'LA PAZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(900,'LA PICADA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(901,'LA PROVIDENCIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(902,'LA VERBENA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(903,'LAGUNA BENÍTEZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(904,'LARROQUE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(905,'LAS CUEVAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(906,'LAS GARZAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(907,'LAS GUACHAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(908,'LAS MERCEDES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(909,'LAS MOSCAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(910,'LAS MULITAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(911,'LAS TOSCAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(912,'LAURENCENA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(913,'LIBERTADOR SAN MARTÍN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(914,'LOMA LIMPIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(915,'LOS CEIBOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(916,'LOS CHARRUAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(917,'LOS CONQUISTADORES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(918,'LUCAS GONZÁLEZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(919,'LUCAS N.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(920,'LUCAS S. 1ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(921,'LUCAS S. 2ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(922,'MACIÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(923,'MARÍA GRANDE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(924,'MARÍA GRANDE 2ª',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(925,'MÉDANOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(926,'MOJONES N.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(927,'MOJONES S.',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(928,'MOLINO DOLL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(929,'MONTE REDONDO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(930,'MONTOYA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(931,'MULAS GRANDES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(932,'ÑANCAY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(933,'NOGOYÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(934,'NUEVA ESCOCIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(935,'NUEVA VIZCAYA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(936,'OMBÚ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(937,'ORO VERDE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(938,'PARANÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(939,'PASAJE GUAYAQUIL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(940,'PASAJE LAS TUNAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(941,'PASO DE LA ARENA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(942,'PASO DE LA LAGUNA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(943,'PASO DE LAS PIEDRAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(944,'PASO DUARTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(945,'PASTOR BRITOS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(946,'PEDERNAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(947,'PERDICES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(948,'PICADA BERÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(949,'PIEDRAS BLANCAS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(950,'PRIMER DISTRITO CUCHILLA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(951,'PRIMERO DE MAYO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(952,'PRONUNCIAMIENTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(953,'PUERTO ALGARROBO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(954,'PUERTO IBICUY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(955,'PUEBLO BRUGO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(956,'PUEBLO CAZES',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(957,'PUEBLO GENERAL BELGRANO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(958,'PUEBLO LIEBIG',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(959,'PUERTO YERUÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(960,'PUNTA DEL MONTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(961,'QUEBRACHO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(962,'QUINTO DISTRITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(963,'RAICES OESTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(964,'RINCÓN DE NOGOYÁ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(965,'RINCÓN DEL CINTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(966,'RINCÓN DEL DOLL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(967,'RINCÓN DEL GATO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(968,'ROCAMORA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(969,'ROSARIO DEL TALA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(970,'SAN BENITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(971,'SAN CIPRIANO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(972,'SAN ERNESTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(973,'SAN GUSTAVO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(974,'SAN JAIME',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(975,'SAN JOSÉ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(976,'SAN JOSÉ DE FELICIANO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(977,'SAN JUSTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(978,'SAN MARCIAL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(979,'SAN PEDRO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(980,'SAN RAMÍREZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(981,'SAN RAMÓN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(982,'SAN ROQUE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(983,'SAN SALVADOR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(984,'SAN VÍCTOR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(985,'SANTA ANA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(986,'SANTA ANITA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(987,'SANTA ELENA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(988,'SANTA LUCÍA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(989,'SANTA LUISA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(990,'SAUCE DE LUNA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(991,'SAUCE MONTRULL',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(992,'SAUCE PINTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(993,'SAUCE SUR',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(994,'SEGUÍ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(995,'SIR LEONARD',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(996,'SOSA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(997,'TABOSSI',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(998,'TEZANOS PINTO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(999,'UBAJAY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1000,'URDINARRAIN',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1001,'VEINTE DE SEPTIEMBRE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1002,'VIALE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1003,'VICTORIA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1004,'VILLA CLARA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1005,'VILLA DEL ROSARIO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1006,'VILLA DOMÍNGUEZ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1007,'VILLA ELISA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1008,'VILLA FONTANA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1009,'VILLA GOBERNADOR ETCHEVEHERE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1010,'VILLA MANTERO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1011,'VILLA PARANACITO',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1012,'VILLA URQUIZA',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1013,'VILLAGUAY',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1014,'WALTER MOSS',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1015,'YACARÉ',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1016,'YESO OESTE',7);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1017,'BANCO PAYAGUÁ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1018,'BARTOLOMÉ DE LAS CASAS',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1019,'BUENA VISTA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1020,'CLORINDA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1021,'COLONIA PASTORIL',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1022,'COLONIA SARMIENTO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1023,'COMANDANTE FONTANA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1024,'EL COLORADO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1025,'EL ESPINILLO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1026,'EL POTRILLO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1027,'EL RECREO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1028,'ESTANISLAO DEL CAMPO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1029,'FORMOSA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1030,'FORTÍN LEYES',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1031,'FORTÍN LUGONES',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1032,'GENERAL LUCIO V. MANSILLA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1033,'GENERAL MANUEL BELGRANO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1034,'GENERAL MOSCONI',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1035,'GRAN GUARDIA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1036,'HERRADURA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1037,'IBARRETA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1038,'INGENIERO JUÁREZ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1039,'JUAN GREGORIO BAZÁN',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1040,'LAGUNA BLANCA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1041,'LAGUNA NAICK NECK',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1042,'LAGUNA YEMA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1043,'LAS LOMITAS',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1044,'LOS CHIRIGUANOS',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1045,'MARIANO BOEDO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1046,'MAYOR VICENTE VILLAFAÑE',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1047,'MISIÓN TACAAGLÉ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1048,'MOJÓN DE FIERRO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1049,'PALMA SOLA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1050,'PALO SANTO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1051,'PIRANÉ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1052,'PORTÓN NEGRO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1053,'POSTA CAMBIO ZALAZAR',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1054,'POZO DE MAZA',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1055,'POZO DEL MORTERO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1056,'POZO DEL TIGRE',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1057,'PUERTO PILCOMAYO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1058,'RIACHO HE-HÉ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1059,'RIACHO NEGRO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1060,'SAN FRANCISCO DE LAISHI',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1061,'SAN HILARIO',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1062,'SAN MARTÍN 1',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1063,'SAN MARTÍN 2',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1064,'SIETE PALMAS',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1065,'SUBTENIENTE PERÍN',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1066,'TATANÉ',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1067,'TRES LAGUNAS',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1068,'VILLA DEL CARMEN',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1069,'VILLA DOS TRECE',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1070,'VILLA ESCOLAR',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1071,'VILLA GENERAL GÜEMES',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1072,'VILLA TRINIDAD',8);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1073,'ABDON CASTRO TOLAY',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1074,'ABRA PAMPA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1075,'ABRALAITE',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1076,'AGUAS CALIENTES',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1077,'ARRAYANAL',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1078,'BARRIOS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1079,'CAIMANCITO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1080,'CALILEGUA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1081,'CANGREJILLOS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1082,'CASPALA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1083,'CATUÁ',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1084,'CIENEGUILLAS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1085,'CORANZULLI',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1086,'CUSI-CUSI',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1087,'EL AGUILAR',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1088,'EL CARMEN',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1089,'EL CÓNDOR',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1090,'EL FUERTE',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1091,'EL PIQUETE',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1092,'EL TALAR',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1093,'FRAILE PINTADO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1094,'HIPÓLITO YRIGOYEN',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1095,'HUACALERA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1096,'HUMAHUACA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1097,'LA ESPERANZA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1098,'LA MENDIETA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1099,'LA QUIACA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1100,'LEDESMA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1101,'LIBERTADOR GENERAL SAN MARTIN',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1102,'MAIMARA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1103,'MINA PIRQUITAS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1104,'MONTERRICO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1105,'PALMA SOLA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1106,'PALPALÁ',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1107,'PAMPA BLANCA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1108,'PAMPICHUELA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1109,'PERICO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1110,'PUESTO DEL MARQUÉS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1111,'PUESTO VIEJO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1112,'PUMAHUASI',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1113,'PURMAMARCA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1114,'RINCONADA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1115,'RODEITOS',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1116,'ROSARIO DE RÍO GRANDE',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1117,'SAN ANTONIO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1118,'SAN FRANCISCO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1119,'SAN PEDRO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1120,'SAN RAFAEL',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1121,'SAN SALVADOR',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1122,'SANTA ANA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1123,'SANTA CATALINA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1124,'SANTA CLARA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1125,'SUSQUES',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1126,'TILCARA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1127,'TRES CRUCES',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1128,'TUMBAYA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1129,'VALLE GRANDE',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1130,'VINALITO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1131,'VOLCÁN',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1132,'YALA',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1133,'YAVÍ',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1134,'YUTO',9);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1135,'ABRAMO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1136,'ADOLFO VAN PRAET',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1137,'AGUSTONI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1138,'ALGARROBO DEL AGUILA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1139,'ALPACHIRI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1140,'ALTA ITALIA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1141,'ANGUIL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1142,'ARATA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1143,'ATALIVA ROCA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1144,'BERNARDO LARROUDE',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1145,'BERNASCONI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1146,'CALEUFÚ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1147,'CARRO QUEMADO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1148,'CATRILÓ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1149,'CEBALLOS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1150,'CHACHARRAMENDI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1151,'COLONIA BARÓN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1152,'COLONIA SANTA MARÍA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1153,'CORONEL HILARIO LAGOS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1154,'CUCHILLO-CÓ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1155,'DOBLAS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1156,'DORILA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1157,'EDUARDO CASTEX',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1158,'EMBAJADOR MARTINI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1159,'FALUCHO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1160,'GENERAL ACHA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1161,'GENERAL MANUEL CAMPOS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1162,'GENERAL PICO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1163,'GUATRACHÉ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1164,'INGENIERO LUIGGI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1165,'INTENDENTE ALVEAR',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1166,'JACINTO ARAUZ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1167,'LA ADELA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1168,'LA HUMADA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1169,'LA MARUJA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1170,'LA REFORMA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1171,'LIMAY MAHUIDA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1172,'LONQUIMAY',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1173,'LOVENTUEL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1174,'LUAN TORO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1175,'MACACHÍN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1176,'MAISONNAVE',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1177,'MAURICIO MAYER',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1178,'METILEO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1179,'MIGUEL CANÉ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1180,'MIGUEL RIGLOS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1181,'MONTE NIEVAS',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1182,'PARERA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1183,'PERÚ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1184,'PICHI-HUINCA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1185,'PUELCHES',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1186,'PUELÉN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1187,'QUEHUE',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1188,'QUEMÚ QUEMÚ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1189,'QUETREQUÉN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1190,'RANCUL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1191,'REALICÓ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1192,'RELMO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1193,'ROLÓN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1194,'RUCANELO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1195,'SARAH',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1196,'SPELUZZI',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1197,'SANTA ISABEL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1198,'SANTA ROSA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1199,'SANTA TERESA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1200,'TELÉN',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1201,'TOAY',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1202,'TOMAS M. DE ANCHORENA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1203,'TRENEL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1204,'UNANUE',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1205,'URIBURU',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1206,'VEINTICINCO DE MAYO',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1207,'VERTIZ',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1208,'VICTORICA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1209,'VILLA MIRASOL',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1210,'WINIFREDA',10);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1211,'FAMATINA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1212,'GUANDACOL',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1213,'CAPITAL (LA RIOJA)',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1214,'MALANZÁN',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1215,'OLTA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1216,'PAGANCILLO',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1217,'PATQUIA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1218,'SAN BLAS',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1219,'SAN BLAS DE LOS SAUCES',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1220,'SANAGASTA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1221,'SANTA TERESITA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1222,'TAMA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1223,'ULAPES',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1224,'VILLA CASTELLI',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1225,'VILLA SAN JOSÉ DE VINCHINA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1226,'VILLA SANTA RITA DE CATUNA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1227,'VILLA UNION',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1228,'VINCHINA',11);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1229,'CAÑON DEL ATUEL',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1230,'CHACRAS DE CORIA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1231,'COLONIA SUIZA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1232,'DORREGO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1233,'EL NIHUIL',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1234,'EL SOSNEADO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1235,'GENERAL ALVEAR',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1236,'GLLEN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1237,'GODOY CRUZ',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1238,'GUAYMALLEN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1239,'JUNIN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1240,'LA PAZ',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1241,'LAS CARDITAS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1242,'LAS CUEVAS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1243,'LAS HERAS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1244,'LAS VEGAS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1245,'LAVALLE',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1246,'LOS MOLLES',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1247,'LOS REYUNOS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1248,'LUJÁN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1249,'LUJAN DE CUYO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1250,'MAIPU',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1251,'MALARGUE',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1252,'MANZANO HISTORICO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1253,'CAPITAL (MENDOZA)',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1254,'POTRERILLOS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1255,'RIVADAVIA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1256,'RIVADAVIA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1257,'SAN CARLOS',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1258,'SAN MARTIN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1259,'SAN RAFAEL',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1260,'SANTA ROSA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1261,'TERMAS CACHEUTA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1262,'TUNUYAN',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1263,'TUPUNGATO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1264,'USPALLATA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1265,'VALLE DE UCO',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1266,'VALLE GRANDE',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1267,'VILLA NUEVA',12);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1268,'ALBA POSSE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1269,'ALMAFUERTE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1270,'APÓSTOLES',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1271,'ARISTÓBULO DEL VALLE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1272,'ARROYO DEL MEDIO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1273,'AZARA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1274,'BERNARDO DE IRIGOYEN',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1275,'BONPLAND',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1276,'CAÁ YARI',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1277,'CAMPO GRANDE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1278,'CAMPO RAMÓN',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1279,'CAMPO VIERA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1280,'CANDELARIA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1281,'CAPIOVÍ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1282,'CARAGUATAY',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1283,'COMANDANTE GUACURARÍ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1284,'CERRO AZUL',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1285,'CERRO CORÁ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1286,'COLONIA ALBERDI',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1287,'COLONIA AURORA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1288,'COLONIA DELICIA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1289,'COLONIA POLANA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1290,'COLONIA VICTORIA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1291,'COLONIA WANDA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1292,'CONCEPCIÓN DE LA SIERRA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1293,'CORPUS',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1294,'DOS ARROYOS',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1295,'DOS DE MAYO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1296,'EL ALCÁZAR',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1297,'EL DORADO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1298,'EL SOBERBIO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1299,'ESPERANZA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1300,'F. AMEGHINO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1301,'FACHINAL',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1302,'GARUHAPÉ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1303,'GARUPÁ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1304,'GOBERNADOR LÓPEZ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1305,'GOBERNADOR ROCA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1306,'GENERAL ALVEAR',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1307,'GENERAL URQUIZA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1308,'GUARANÍ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1309,'H. YRIGOYEN',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1310,'IGUAZÚ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1311,'ITACARUARÉ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1312,'JARDÍN AMÉRICA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1313,'LEANDRO N. ALEM',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1314,'LIBERTAD',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1315,'LORETO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1316,'LOS HELECHOS',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1317,'MÁRTIRES',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1318,'MOJÓN GRANDE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1319,'MONTECARLO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1320,'NUEVE DE JULIO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1321,'OBERÁ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1322,'OLEGARIO V. ANDRADE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1323,'PANAMBÍ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1324,'POSADAS',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1325,'PROFUNDIDAD',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1326,'PUERTO IGUAZÚ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1327,'PUERTO LEONI',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1328,'PUERTO PIRAY',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1329,'PUERTO RICO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1330,'RUIZ DE MONTOYA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1331,'SAN ANTONIO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1332,'SAN IGNACIO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1333,'SAN JAVIER',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1334,'SAN JOSÉ',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1335,'SAN MARTÍN',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1336,'SAN PEDRO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1337,'SAN VICENTE',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1338,'SANTIAGO DE LINIERS',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1339,'SANTO PIPO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1340,'SANTA ANA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1341,'SANTA MARÍA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1342,'TRES CAPONES',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1343,'VEINTICINCO DE MAYO',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1344,'WANDA',13);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1345,'AGUADA SAN ROQUE',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1346,'ALUMINÉ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1347,'ANDACOLLO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1348,'AÑELO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1349,'BAJADA DEL AGRIO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1350,'BARRANCAS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1351,'BUTA RANQUIL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1352,'CAPITAL (NEUQUÉN)',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1353,'CAVIAHUÉ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1354,'CENTENARIO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1355,'CHORRIACA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1356,'CHOS MALAL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1357,'CIPOLLETTI',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1358,'COVUNCO ABAJO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1359,'COYUCO COCHICO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1360,'CUTRAL CÓ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1361,'EL CHOLAR',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1362,'EL HUECÚ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1363,'EL SAUCE',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1364,'GUAÑACOS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1365,'HUINGANCO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1366,'LAS COLORADAS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1367,'LAS LAJAS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1368,'LAS OVEJAS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1369,'LONCOPUÉ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1370,'LOS CATUTOS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1371,'LOS CHIHUIDOS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1372,'LOS MICHES',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1373,'MANZANO AMARGO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1374,'OCTAVIO PICO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1375,'PASO AGUERRE',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1376,'PICÚN LEUFÚ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1377,'PIEDRA DEL AGUILA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1378,'PILO LIL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1379,'PLAZA HUINCUL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1380,'PLOTTIER',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1381,'QUILI MALAL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1382,'RAMÓN CASTRO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1383,'RINCÓN DE LOS SAUCES',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1384,'SAN MARTÍN DE LOS ANDES',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1385,'SAN PATRICIO DEL CHAÑAR',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1386,'SANTO TOMÁS',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1387,'SAUZAL BONITO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1388,'SENILLOSA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1389,'TAQUIMILÁN',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1390,'TRICAO MALAL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1391,'VARVARCO',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1392,'VILLA CURÍ LEUVU',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1393,'VILLA DEL NAHUEVE',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1394,'VILLA DEL PUENTE PICÚN LEUVÚ',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1395,'VILLA EL CHOCÓN',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1396,'VILLA LA ANGOSTURA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1397,'VILLA PEHUENIA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1398,'VILLA TRAFUL',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1399,'VISTA ALEGRE',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1400,'ZAPALA',14);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1401,'AGUADA CECILIO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1402,'AGUADA DE GUERRA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1403,'ALLÉN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1404,'ARROYO DE LA VENTANA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1405,'ARROYO LOS BERROS',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1406,'BARILOCHE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1407,'CALTE. CORDERO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1408,'CAMPO GRANDE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1409,'CATRIEL',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1410,'CERRO POLICÍA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1411,'CERVANTES',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1412,'CHELFORO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1413,'CHIMPAY',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1414,'CHINCHINALES',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1415,'CHIPAUQUIL',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1416,'CHOELE CHOEL',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1417,'CINCO SALTOS',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1418,'CIPOLLETTI',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1419,'CLEMENTE ONELLI',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1420,'COLÁN CONHUE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1421,'COMALLO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1422,'COMICÓ',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1423,'CONA NIYEU',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1424,'CORONEL BELISLE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1425,'CUBANEA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1426,'DARWIN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1427,'DINA HUAPI',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1428,'EL BOLSÓN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1429,'EL CAÍN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1430,'EL MANSO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1431,'GENERAL CONESA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1432,'GENERAL ENRIQUE GODOY',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1433,'GENERAL FERNANDEZ ORO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1434,'GENERAL ROCA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1435,'GUARDIA MITRE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1436,'INGENIERO HUERGO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1437,'INGENIERO JACOBACCI',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1438,'LAGUNA BLANCA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1439,'LAMARQUE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1440,'LAS GRUTAS',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1441,'LOS MENUCOS',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1442,'LUIS BELTRÁN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1443,'MAINQUÉ',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1444,'MAMUEL CHOIQUE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1445,'MAQUINCHAO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1446,'MENCUÉ',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1447,'MTRO. RAMOS MEXIA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1448,'NAHUEL NIYEU',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1449,'NAUPA HUEN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1450,'ÑORQUINCO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1451,'OJOS DE AGUA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1452,'PASO DE AGUA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1453,'PASO FLORES',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1454,'PEÑAS BLANCAS',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1455,'PICHI MAHUIDA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1456,'PILCANIYEU',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1457,'POMONA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1458,'PRAHUANIYEU',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1459,'RINCÓN TRENETA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1460,'RÍO CHICO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1461,'RÍO COLORADO',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1462,'ROCA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1463,'SAN ANTONIO OESTE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1464,'SAN JAVIER',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1465,'SIERRA COLORADA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1466,'SIERRA GRANDE',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1467,'SIERRA PAILEMÁN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1468,'VALCHETA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1469,'VALLE AZUL',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1470,'VIEDMA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1471,'VILLA LLANQUÍN',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1472,'VILLA MASCARDI',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1473,'VILLA REGINA',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1474,'YAMINUÉ',15);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1475,'AGUARAY',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1476,'ANGASTACO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1477,'ANIMANÁ',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1478,'APOLINARIO SARAVIA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1479,'CACHI',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1480,'CAFAYATE',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1481,'CAMPO QUIJANO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1482,'CAMPO SANTO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1483,'CERRILLOS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1484,'CHICOANA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1485,'COLONIA SANTA ROSA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1486,'CORONEL MOLDES',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1487,'EL BORDO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1488,'EL CARRIL',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1489,'EL GALPÓN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1490,'EL JARDÍN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1491,'EL POTRERO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1492,'EL QUEBRACHAL',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1493,'EL TALA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1494,'EMBARCACIÓN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1495,'GENERAL BALLIVIÁN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1496,'GENERAL GÜEMES',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1497,'GENERAL MOSCONI',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1498,'GENERAL PIZARRO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1499,'GUACHIPAS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1500,'HIPÓLITO YRIGOYEN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1501,'IRUYA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1502,'ISLA DE CAÑAS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1503,'JOAQUÍN VÍCTOR GONZÁLEZ',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1504,'LA CALDERA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1505,'LA CANDELARIA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1506,'LA MERCED',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1507,'LA POMA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1508,'LA VIÑA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1509,'LAS LAJITAS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1510,'LOS TOLDOS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1511,'MOLINOS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1512,'NAZARENO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1513,'PAYOGASTA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1514,'PICHANAL',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1515,'PROFESOR SALVADOR MAZZA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1516,'RÍO PÎEDRAS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1517,'RIVADAVIA BANDA NORTE',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1518,'RIVADAVIA BANDA SUR',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1519,'ROSARIO DE LA FRONTERA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1520,'ROSARIO DE LERMA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1521,'SALTA',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1522,'SAN ANTONIO DE LOS COBRES',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1523,'SAN CARLOS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1524,'SAN JOSÉ DE METÁN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1525,'SAN RAMÓN DE LA NUEVA ORÁN',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1526,'SANTA VICTORIA ESTE',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1527,'SANTA VICTORIA OESTE',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1528,'SECLANTÁS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1529,'TARTAGAL',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1530,'TOLAR GRANDE',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1531,'URUNDEL',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1532,'VAQUEROS',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1533,'VILLA SAN LORENZO',16);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1534,'9 DE JULIO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1535,'ABERASTAIN - LA RINCONADA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1536,'ANGUALASTO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1537,'ASTICA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1538,'BALDES DEL ROSARIO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1539,'BARREAL - PITUIL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1540,'BARRIO RUTA 40',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1541,'BELLA VISTA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1542,'BERMEJO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1543,'CALINGASTA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1544,'CAÑADA HONDA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1545,'CARPINTERÍA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1546,'CAUCETE',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1547,'CHUCUMA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1548,'CIENAGUITA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1549,'COLONIA FIORITO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1550,'COLONIA FISCAL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1551,'DIVISADERO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1552,'DIVISADERO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1553,'DOS ACEQUIAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1554,'EL ENCÓN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1555,'EL RINCÓN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1556,'EL RINCÓN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1557,'GENERAL SAN MARTÍN - CAMPO AFUERA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1558,'GRAN CHINA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1559,'GUANACACHE',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1560,'HUACO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1561,'IGLESIA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1562,'LAS CHACRITAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1563,'LAS FLORES',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1564,'LAS LAGUNAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1565,'LAS TALAS - LOS MÉDANOS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1566,'LAS TAPIAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1567,'LOS BALDECITOS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1568,'LOS BERROS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1569,'MEDIA AGUA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1570,'MOGNA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1571,'NIQUIVIL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1572,'PAMPA VIEJA - EL FISCAL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1573,'PEDERNAL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1574,'PIE DE PALO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1575,'PISMANTA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1576,'PUNTA DEL MÉDANO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1577,'QUINTO CUARTEL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1578,'RODEO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1579,'SADOP',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1580,'SAN ISIDRO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1581,'SAN ISIDRO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1582,'SAN JOSÉ DE JÁCHAL',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1583,'SAN JUAN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1584,'SAN MARTÍN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1585,'SANTA ROSA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1586,'TAMBERÍAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1587,'TAMBERÍAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1588,'TUDCUM',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1589,'TUPELÍ',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1590,'USNO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1591,'VALLECITO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1592,'VILLA BASILIO NIEVAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1593,'VILLA BORJAS - LA CHIMBERA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1594,'VILLA CENTENARIO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1595,'VILLA DOMINGUITO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1596,'VILLA DON BOSCO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1597,'VILLA EL SALVADOR - SEFAIR TALACASTO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1598,'VILLA EL TANGO',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1599,'VILLA IBÁÑEZ',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1600,'VILLA INDEPENDENCIA',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1601,'VILLA MALVINAS ARGENTINAS',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1602,'VILLA MERCEDES',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1603,'VILLA SAN AGUSTÍN',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1604,'VILLA TACÚ',17);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1605,'ALTO PELADO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1606,'ALTO PENCOSO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1607,'ANCHORENA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1608,'ARIZONA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1609,'BAGUAL',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1610,'BALDE',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1611,'BATAVIA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1612,'BEAZLEY',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1613,'BUENA ESPERANZA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1614,'CANDELARIA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1615,'CAPITAL (SAN LUIS)',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1616,'CAROLINA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1617,'CARPINTERÍA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1618,'CONCARÁN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1619,'CORTADERAS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1620,'EL MORRO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1621,'EL TRAPICHE',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1622,'EL VOLCÁN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1623,'FORTÍN EL PATRIA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1624,'FORTUNA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1625,'FRAGA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1626,'JUAN JORBA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1627,'JUAN LLERENA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1628,'JUANA KOSLAY',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1629,'JUSTO DARACT',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1630,'LA CALERA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1631,'LA FLORIDA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1632,'LA PUNILLA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1633,'LA TOMA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1634,'LAFINUR',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1635,'LAS AGUADAS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1636,'LAS CHACRAS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1637,'LAS LAGUNAS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1638,'LAS VERTIENTES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1639,'LAVAISSE',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1640,'LEANDRO N. ALEM',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1641,'LOS MOLLES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1642,'LUJÁN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1643,'MERCEDES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1644,'MERLO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1645,'NASCHEL',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1646,'NAVIA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1647,'NOGOLÍ',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1648,'NUEVA GALIA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1649,'PAPAGAYOS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1650,'PASO GRANDE',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1651,'POTRERO DE LOS FUNES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1652,'QUINES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1653,'RENCA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1654,'SALADILLO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1655,'SAN FRANCISCO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1656,'SAN GERÓNIMO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1657,'SAN MARTÍN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1658,'SAN PABLO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1659,'SANTA ROSA DE CONLARA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1660,'TALITA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1661,'TILISARAO',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1662,'UNIÓN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1663,'VILLA DE LA QUEBRADA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1664,'VILLA DE PRAGA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1665,'VILLA DEL CARMEN',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1666,'VILLA GENERAL ROCA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1667,'VILLA LARCA',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1668,'VILLA MERCEDES',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1669,'ZANJITAS',18);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1670,'BAJO CARACOLES',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1671,'CALETA OLIVIA',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1672,'CAÑADÓN SECO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1673,'COMANDANTE LUIS PIEDRABUENA',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1674,'EL CALAFATE',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1675,'EL CHALTÉN',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1676,'EL TURBIO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1677,'ESPERANZA',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1678,'FITZ ROY',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1679,'GOBERNADOR GREGORES',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1680,'HIPÓLITO YRIGOYEN',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1681,'JARAMILLO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1682,'JULIA DUFOUR',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1683,'KOLUEL KAIKE',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1684,'LAS HERAS',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1685,'LOS ANTIGUOS',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1686,'MINA 3',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1687,'PERITO MORENO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1688,'PICO TRUNCADO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1689,'PUERTO DESEADO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1690,'PUERTO SAN JULIÁN',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1691,'PUERTO SANTA CRUZ',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1692,'RÍO GALLEGOS',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1693,'RÍO TURBIO',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1694,'ROSPENTEK',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1695,'TRES CERROS',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1696,'TRES LAGOS',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1697,'VEINTIOCHO DE NOVIEMBRE',19);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1698,'AARÓN CASTELLANOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1699,'ACEBAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1700,'AGUARÁ GRANDE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1701,'ALBARELLOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1702,'ALCORTA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1703,'ALDAO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1704,'ALEJANDRA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1705,'ÁLVAREZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1706,'AMBROSETTI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1707,'AMENÁBAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1708,'ANGÉLICA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1709,'ANGELONI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1710,'AREQUITO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1711,'ARMINDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1712,'ARMSTRONG',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1713,'AROCENA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1714,'ARROYO AGUIAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1715,'ARROYO CEIBAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1716,'ARROYO LEYES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1717,'ARROYO SECO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1718,'ARRUFÓ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1719,'ARTEAGA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1720,'ATALIVA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1721,'AURELIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1722,'AVELLANEDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1723,'BARRANCAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1724,'BAUER Y SIGEL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1725,'BELLA ITALIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1726,'BERABEVÚ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1727,'BERNA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1728,'BERNARDO DE IRIGOYEN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1729,'BIGAND',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1730,'BOMBAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1731,'BOUQUET',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1732,'BUSTINZA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1733,'CABAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1734,'CACIQUE ARIACAIQUIN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1735,'CAFFERATA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1736,'CALCHAQUÍ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1737,'CAMPO ANDINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1738,'CAMPO PIAGGIO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1739,'CAÑADA DE GÓMEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1740,'CAÑADA DEL UCLE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1741,'CAÑADA RICA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1742,'CAÑADA ROSQUÍN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1743,'CANDIOTI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1744,'CAPITAL (SANTA FE)',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1745,'CAPITÁN BERMÚDEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1746,'CAPIVARA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1747,'CARCARAÑÁ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1748,'CARLOS PELLEGRINI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1749,'CARMEN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1750,'CARMEN DEL SAUCE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1751,'CARRERAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1752,'CARRIZALES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1753,'CASALEGNO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1754,'CASAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1755,'CASILDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1756,'CASTELAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1757,'CASTELLANOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1758,'CAYASTÁ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1759,'CAYASTACITO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1760,'CENTENO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1761,'CEPEDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1762,'CERES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1763,'CHABÁS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1764,'CHAÑAR LADEADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1765,'CHAPUY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1766,'CHOVET',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1767,'CHRISTOPHERSEN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1768,'CLASSON',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1769,'CNEL. ARNOLD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1770,'CNEL. BOGADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1771,'CNEL. DOMINGUEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1772,'CNEL. FRAGA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1773,'COLONIA ALDAO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1774,'COLONIA ANA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1775,'COLONIA BELGRANO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1776,'COLONIA BICHA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1777,'COLONIA BIGAND',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1778,'COLONIA BOSSI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1779,'COLONIA CAVOUR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1780,'COLONIA CELLO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1781,'COLONIA DOLORES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1782,'COLONIA DOS ROSAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1783,'COLONIA DURÁN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1784,'COLONIA ITURRASPE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1785,'COLONIA MARGARITA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1786,'COLONIA MASCIAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1787,'COLONIA RAQUEL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1788,'COLONIA ROSA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1789,'COLONIA SAN JOSÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1790,'CONSTANZA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1791,'CORONDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1792,'CORREA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1793,'CRISPI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1794,'CULULÚ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1795,'CURUPAYTI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1796,'DESVIO ARIJÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1797,'DIAZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1798,'DIEGO DE ALVEAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1799,'EGUSQUIZA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1800,'EL ARAZÁ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1801,'EL RABÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1802,'EL SOMBRERITO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1803,'EL TRÉBOL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1804,'ELISA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1805,'ELORTONDO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1806,'EMILIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1807,'EMPALME SAN CARLOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1808,'EMPALME VILLA CONSTITUCION',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1809,'ESMERALDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1810,'ESPERANZA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1811,'ESTACIÓN ALVEAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1812,'ESTACION CLUCELLAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1813,'ESTEBAN RAMS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1814,'ESTHER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1815,'ESUSTOLIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1816,'EUSEBIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1817,'FELICIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1818,'FIDELA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1819,'FIGHIERA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1820,'FIRMAT',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1821,'FLORENCIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1822,'FORTÍN OLMOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1823,'FRANCK',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1824,'FRAY LUIS BELTRÁN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1825,'FRONTERA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1826,'FUENTES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1827,'FUNES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1828,'GABOTO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1829,'GALISTEO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1830,'GÁLVEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1831,'GARABALTO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1832,'GARIBALDI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1833,'GATO COLORADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1834,'GOBERNADOR CRESPO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1835,'GESSLER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1836,'GODOY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1837,'GOLONDRINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1838,'GENERAL GELLY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1839,'GENERAL LAGOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1840,'GRANADERO BAIGORRIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1841,'GREGORIA PEREZ DE DENIS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1842,'GRUTLY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1843,'GUADALUPE N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1844,'GÖDEKEN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1845,'HELVECIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1846,'HERSILIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1847,'HIPATÍA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1848,'HUANQUEROS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1849,'HUGENTOBLER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1850,'HUGHES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1851,'HUMBERTO 1º',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1852,'HUMBOLDT',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1853,'IBARLUCEA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1854,'INGENIERO CHANOURDIE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1855,'INTIYACO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1856,'ITUZAINGÓ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1857,'JACINTO L. ARÁUZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1858,'JOSEFINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1859,'JUAN BERNABÉ MOLINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1860,'JUAN DE GARAY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1861,'JUNCAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1862,'LA BRAVA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1863,'LA CABRAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1864,'LA CAMILA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1865,'LA CHISPA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1866,'LA CLARA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1867,'LA CRIOLLA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1868,'LA GALLARETA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1869,'LA LUCILA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1870,'LA PELADA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1871,'LA PENCA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1872,'LA RUBIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1873,'LA SARITA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1874,'LA VANGUARDIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1875,'LABORDEBOY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1876,'LAGUNA PAIVA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1877,'LANDETA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1878,'LANTERI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1879,'LARRECHEA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1880,'LAS AVISPAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1881,'LAS BANDURRIAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1882,'LAS GARZAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1883,'LAS PALMERAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1884,'LAS PAREJAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1885,'LAS PETACAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1886,'LAS ROSAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1887,'LAS TOSCAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1888,'LAS TUNAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1889,'LAZZARINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1890,'LEHMANN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1891,'LLAMBI CAMPBELL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1892,'LOGROÑO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1893,'LOMA ALTA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1894,'LÓPEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1895,'LOS AMORES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1896,'LOS CARDOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1897,'LOS LAURELES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1898,'LOS MOLINOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1899,'LOS QUIRQUINCHOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1900,'LUCIO VICENTE LOPEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1901,'LUIS PALACIOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1902,'MARÍA JUANA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1903,'MARÍA LUISA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1904,'MARÍA SUSANA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1905,'MARÍA TERESA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1906,'MACIEL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1907,'MAGGIOLO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1908,'MALABRIGO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1909,'MARCELINO ESCALADA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1910,'MARGARITA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1911,'MATILDE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1912,'MAUÁ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1913,'MÁXIMO PAZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1914,'MELINCUÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1915,'MIGUEL TORRES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1916,'MOISÉS VILLE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1917,'MONIGOTES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1918,'MONJE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1919,'MONTE OBSCURIDAD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1920,'MONTE VERA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1921,'MONTEFIORE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1922,'MONTES DE OCA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1923,'MURPHY',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1924,'ÑANDUCITA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1925,'NARÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1926,'NELSON',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1927,'NICANOR E. MOLINAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1928,'NUEVO TORINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1929,'OLIVEROS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1930,'PALACIOS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1931,'PAVÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1932,'PAVÓN ARRIBA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1933,'PEDRO GÓMEZ CELLO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1934,'PÉREZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1935,'PEYRANO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1936,'PIAMONTE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1937,'PILAR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1938,'PIÑERO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1939,'PLAZA CLUCELLAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1940,'PORTUGALETE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1941,'POZO BORRADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1942,'PROGRESO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1943,'PROVIDENCIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1944,'PRESIDENTE ROCA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1945,'PUEBLO ANDINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1946,'PUEBLO ESTHER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1947,'PUEBLO GENERAL SAN MARTÍN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1948,'PUEBLO IRIGOYEN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1949,'PUEBLO MARINI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1950,'PUEBLO MUÑOZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1951,'PUEBLO URANGA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1952,'PUJATO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1953,'PUJATO N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1954,'RAFAELA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1955,'RAMAYÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1956,'RAMONA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1957,'RECONQUISTA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1958,'RECREO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1959,'RICARDONE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1960,'RIVADAVIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1961,'ROLDÁN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1962,'ROMANG',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1963,'ROSARIO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1964,'RUEDA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1965,'RUFINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1966,'SA PEREIRA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1967,'SAGUIER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1968,'SALADERO MARIANO CABAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1969,'SALTO GRANDE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1970,'SAN AGUSTÍN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1971,'SAN ANTONIO DE OBLIGADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1972,'SAN BERNARDO (N.J.)',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1973,'SAN BERNARDO (S.J.)',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1974,'SAN CARLOS CENTRO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1975,'SAN CARLOS N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1976,'SAN CARLOS S.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1977,'SAN CRISTÓBAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1978,'SAN EDUARDO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1979,'SAN EUGENIO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1980,'SAN FABIÁN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1981,'SAN FRANCISCO. DE SANTA FÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1982,'SAN GENARO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1983,'SAN GENARO N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1984,'SAN GREGORIO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1985,'SAN GUILLERMO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1986,'SAN JAVIER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1987,'SAN JERÓNIMO DEL SAUCE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1988,'SAN JERÓNIMO N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1989,'SAN JERÓNIMO S.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1990,'SAN JORGE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1991,'SAN JOSÉ DE LA ESQUINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1992,'SAN JOSÉ DEL RINCÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1993,'SAN JUSTO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1994,'SAN LORENZO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1995,'SAN MARIANO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1996,'SAN MARTÍN DE LAS ESCOBAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1997,'SAN MARTÍN N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1998,'SAN VICENTE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(1999,'SANCTI SPITITU',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2000,'SANFORD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2001,'SANTO DOMINGO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2002,'SANTO TOMÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2003,'SANTURCE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2004,'SARGENTO CABRAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2005,'SARMIENTO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2006,'SASTRE',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2007,'SAUCE VIEJO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2008,'SERODINO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2009,'SILVA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2010,'SOLDINI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2011,'SOLEDAD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2012,'SOUTOMAYOR',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2013,'SANTA CLARA DE BUENA VISTA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2014,'SANTA CLARA DE SAGUIER',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2015,'SANTA ISABEL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2016,'SANTA MARGARITA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2017,'SANTA MARIA CENTRO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2018,'SANTA MARÍA N.',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2019,'SANTA ROSA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2020,'SANTA TERESA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2021,'SUARDI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2022,'SUNCHALES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2023,'SUSANA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2024,'TACUARENDÍ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2025,'TACURAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2026,'TARTAGAL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2027,'TEODELINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2028,'THEOBALD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2029,'TIMBÚES',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2030,'TOBA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2031,'TORTUGAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2032,'TOSTADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2033,'TOTORAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2034,'TRAILL',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2035,'VENADO TUERTO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2036,'VERA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2037,'VERA Y PINTADO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2038,'VIDELA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2039,'VILA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2040,'VILLA AMELIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2041,'VILLA ANA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2042,'VILLA CAÑAS',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2043,'VILLA CONSTITUCIÓN',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2044,'VILLA ELOÍSA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2045,'VILLA GOBERNADOR GÁLVEZ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2046,'VILLA GUILLERMINA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2047,'VILLA MINETTI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2048,'VILLA MUGUETA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2049,'VILLA OCAMPO',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2050,'VILLA SAN JOSÉ',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2051,'VILLA SARALEGUI',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2052,'VILLA TRINIDAD',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2053,'VILLADA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2054,'VIRGINIA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2055,'WHEELWRIGHT',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2056,'ZAVALLA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2057,'ZENÓN PEREIRA',20);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2058,'AÑATUYA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2059,'ÁRRAGA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2060,'BANDERA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2061,'BANDERA BAJADA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2062,'BELTRÁN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2063,'BREA POZO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2064,'CAMPO GALLO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2065,'CAPITAL (SANTIAGO DEL ESTERO)',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2066,'CHILCA JULIANA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2067,'CHOYA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2068,'CLODOMIRA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2069,'COLONIA ALPINA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2070,'COLONIA DORA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2071,'COLONIA EL SIMBOLAR ROBLES',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2072,'EL BOBADAL',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2073,'EL CHARCO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2074,'EL MOJÓN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2075,'ESTACIÓN ATAMISQUI',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2076,'ESTACIÓN SIMBOLAR',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2077,'FERNÁNDEZ',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2078,'FORTÍN INCA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2079,'FRÍAS',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2080,'GARZA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2081,'GRAMILLA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2082,'GUARDIA ESCOLTA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2083,'HERRERA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2084,'ICAÑO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2085,'INGENIERO FORRES',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2086,'LA BANDA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2087,'LA CAÑADA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2088,'LAPRIDA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2089,'LAVALLE',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2090,'LORETO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2091,'LOS JURÍES',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2092,'LOS NÚÑEZ',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2093,'LOS PIRPINTOS',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2094,'LOS QUIROGA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2095,'LOS TELARES',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2096,'LUGONES',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2097,'MALBRÁN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2098,'MATARA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2099,'MEDELLÍN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2100,'MONTE QUEMADO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2101,'NUEVA ESPERANZA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2102,'NUEVA FRANCIA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2103,'PALO NEGRO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2104,'PAMPA DE LOS GUANACOS',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2105,'PINTO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2106,'POZO HONDO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2107,'QUIMILÍ',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2108,'REAL SAYANA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2109,'SACHAYOJ',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2110,'SAN PEDRO DE GUASAYÁN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2111,'SELVA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2112,'SOL DE JULIO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2113,'SUMAMPA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2114,'SUNCHO CORRAL',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2115,'TABOADA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2116,'TAPSO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2117,'TERMAS DE RIO HONDO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2118,'TINTINA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2119,'TOMAS YOUNG',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2120,'VILELAS',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2121,'VILLA ATAMISQUI',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2122,'VILLA LA PUNTA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2123,'VILLA OJO DE AGUA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2124,'VILLA RÍO HONDO',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2125,'VILLA SALAVINA',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2126,'VILLA UNIÓN',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2127,'VILMER',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2128,'WEISBURD',21);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2129,'RÍO GRANDE',22);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2130,'TOLHUIN',22);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2131,'USHUAIA',22);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2132,'ACHERAL',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2133,'AGUA DULCE',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2134,'AGUILARES',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2135,'ALDERETES',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2136,'ALPACHIRI',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2137,'ALTO VERDE',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2138,'AMAICHA DEL VALLE',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2139,'AMBERES',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2140,'ANCAJULI',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2141,'ARCADIA',23);
INSERT INTO Localidad (locId, locDescripcion, loc_pvcId) VALUES(2142,'ATAHONA',23);


