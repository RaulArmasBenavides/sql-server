--TABLA BODEGA
create table bodega 
( idbod int IDENTITY NOT NULL,
  idbodega nchar(10), 
  descripcion varchar(200) NOT NULL, 
  estado nchar(2) NOT NULL,
  PRIMARY KEY(idbodega,idbod)
);
go

--TABLA UBICACION
create table ubicacion 
( idubi int IDENTITY NOT NULL, 
  codigo nchar(20) NOT NULL,
  zona nchar(5) NOT NULL, 
  lado nchar(5) NOT NULL, 
  columna nchar(5) NOT NULL, 
  fila nchar(5) NOT NULL, 
  estado nchar(2) NOT NULL, 
  idbodega nchar(10) NOT NULL,
  PRIMARY KEY(idubi),
);
go

select * From material 


ALTER TABLE ubicacion
ADD FOREIGN KEY (idbod,idbodega) REFERENCES bodega(idbod,idbodega);
 
 insert into ubicacion values ('00A00A','00','A','00','A','S','0001')

insert into bodega values ('0001','ALMACEN PRINCIPAL','S')
insert into bodega values ('0002','ALMACEN SJL','S')
insert into bodega values ('0003','ALMACEN CAÑETE','S')
insert into bodega values ('0004','ALMACEN SANTA CLARA','S')
insert into bodega values ('0005','ALMACEN PPUENTE','S')
insert into bodega values ('0006','R1','S')
insert into bodega values ('0007','R2','S')
insert into bodega values ('0008','R3','S')
insert into bodega values ('0009','R4','S')
insert into bodega values ('0010','R5','S')
insert into bodega values ('0011','ALMACEN EPPS','S')
insert into bodega values ('0012','ALMACEN PRADERAS','S')
insert into bodega values ('0013','VENTA Y PROYECTOS','S')

--TABLA USUARIOS 
create table usuarios 
( idusuarios int IDENTITY NOT NULL,
  usuario  nchar(10),
  clave    nchar(10),
  email_corporativo  nvarchar(30),
  fecha_cambio_pass DATE,
  permiso nchar(10),
  PRIMARY KEY(idusuarios),
  idempleado int FOREIGN KEY REFERENCES empleado(idempleado) ON DELETE CASCADE
);
go


select GETDATE() as today  From usuarios 


SELECT CONVERT(datetime, CONVERT(varchar, GETDATE(), 110))

SELECT CAST(CAST(GETDATE() AS DATE) AS SMALLDATETIME)


select * from dual

insert into empleado values ('ARMAS','BENAVIDES','RAUL','H','985395111','S','CALLE FORTUNATO QUESADA','73262442')


exec  usp_RegistrarUsuario @usuario='rarmas',@clave='trilce',@email_corporativo ='rarmas@gmail.com',@permiso='RW--',@id =4



 SELECT 'rarmas',ENCRYPTBYPASSPHRASE('password', 'trilce') ,'rarmas@gmail.com',
		 (select CAST(CAST(GETDATE() AS DATE) AS SMALLDATETIME)),'RW--', 4












select * From mytable















