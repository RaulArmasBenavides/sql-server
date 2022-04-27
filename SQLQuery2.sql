use dblogistica


select * from clientes 

update servicio set folio ='0000000' where idServicio =1 



--DETALLE DE LA FACTURA  
create table protocolo 
( 
  idprotocolo int IDENTITY NOT NULL PRIMARY KEY,
  folio nvarchar(10),
  nombrecliente nvarchar(50),
  potencia nvarchar(30),
  voltaje nvarchar(23),
  Hz nvarchar(10),
  Horometro nvarchar(10),
  Tipo_gob nvarchar(40),
  Tipo_panel_control nvarchar(20),
  SerieAlternador nvarchar(10),
  SerieMotor nvarchar(10), 
  estado nchar(2), 
  --datos de prueba de carga 
  a11 nvarchar(5),
  a12 nvarchar(5),
  a13 nvarchar(5),
  a21 nvarchar(5),
  a22 nvarchar(5),
  a23 nvarchar(5),
  a31 nvarchar(5),
  a32 nvarchar(5),
  a33 nvarchar(5),
  voltaje_bateria nvarchar(10),
  temp_motor nvarchar(10),
  presion nvarchar(10),
  med_combu nvarchar(10)
);
go


insert into protocolo (folio,nombrecliente,SerieAlternador,SerieMotor,estado,a11,a12,a13,a21,a22,a23,a31,a32,a33,voltaje_bateria,temp_motor,presion,med_combu)
values ('1234567','METRO','123','124','S','1','1','1','1','1','1','1','1','1','90','90','90','90');


select * from pedido  where tabla ='pedido'


select * from clientes 






alter table  cotizacion
add  descripcion nvarchar (200), monto nvarchar(20);



--TABLA DETALLE DE CONFORMACIÓN DE SERVICIO 
create table detalle_conforservicio
(
   iddetalle_conforservicio int IDENTITY NOT NULL PRIMARY KEY,
   horas  int,
   descripción nvarchar(100),
   observaciones nvarchar(100),
   idconfor_servicio int FOREIGN KEY REFERENCES confor_servicio(idconfor_servicio) ON DELETE CASCADE,
  --idorden_compra int FOREIGN KEY REFERENCES orden_compra(idorden_compra) ON DELETE CASCADE,
  --constraint fk_idgrupodetallepedido	foreign key (id_pedido) references grupo(id_grupo),
)

INSERT into detalle_conforservicio values (2,'test1','test2',1);



--cabecera 
select * from confor_servicio


--detalle 
select * from detalle_conforservicio where idconfor_servicio = 8 









select id_grupo from grupo_ma where codigo = 'MANTENIMEINTO CORRECTIVO 2' and estado ='S' 


---TR_PROTOCOLO
drop trigger if exists dbo.tr_protocolo_insert;
go
create or ALTER  trigger dbo.tr_protocolo_insert
on dbo.protocolo
for insert
as
begin
		insert into dbo.aud_audit_modif(codigo, observaciones, tabla, valor_antes,valor_despues, usuario,usuario_bd,fecha) 
		SELECT I.folio,'SE REGISTRÓ UN NUEVO PROTOCOLO DE PRUEBA  '+ I.folio ,'protocolo',NULL, NULL, 'rol',CURRENT_USER, GETDATE()
		FROM INSERTED I;
end;

go


---tr_detalle_conforservicio_insert
drop trigger if exists dbo.tr_detalle_conforservicio_insert;
go
create or ALTER  trigger dbo.tr_detalle_conforservicio_insert
on dbo.detalle_conforservicio
for insert
as
begin
		insert into dbo.aud_audit_modif(codigo, observaciones, tabla, valor_antes,valor_despues, usuario,usuario_bd,fecha) 
		SELECT CAST(I.iddetalle_conforservicio AS varchar(10)) ,'SE REGISTRÓ UN NUEVO DETALLE DE ACTA DE CONFORMIDAD  '+  CAST(I.iddetalle_conforservicio AS varchar(10)) ,'detalle_conforservicio',NULL, NULL, 'rol',CURRENT_USER, GETDATE()
		FROM INSERTED I;
end;

go