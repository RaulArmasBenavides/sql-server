select  g.codigo as serie, g.potencia,g.tip_gob,g.pan_control,a.marca as marca_alter, a.modelo as modelo_alter,m.marca as marca_motor,m.modelo as modelo_motor , m.id_motor , a.id_alternador
        from grupo_ma g , motor m , alternador a 
        where g.id_alternador = a.id_alternador 
        and g.id_motor = m.id_motor 
        and m.estado='S'
        and a.estado='S'
        and g.estado='S'

		select * from pedido


		ALTER TABLE servicio ALTER COLUMN FechaEntrega DATETIME;

ALTER TABLE confor_servicio 
--ADD nombre_cliente  nvarchar(30), nombre_sede nvarchar(40), direccion nvarchar(40);
--ALTER COLUMN nombre_cliente  nvarchar(30), 
--alter column nombre_sede nvarchar(40),
alter column direccion nvarchar(40);

insert into factura values (getdate(),'S',1,1,'0000001','factura 1 prueba','RMB');


insert into servicio values (getdate(),getdate(),'S','PRIMER SERVICIO XXX','1','RMB',null,null,'0000001');


SELECT * FROM servicio

---TR_SERVICIO
drop trigger if exists dbo.tr_servicio_insert;
go
create or ALTER  trigger dbo.tr_servicio_insert
on dbo.servicio
for insert
as
begin
		insert into dbo.aud_audit_modif(codigo, observaciones, tabla, valor_antes,valor_despues, usuario,usuario_bd,fecha) 
		SELECT  I.folio,'SE REGISTRÓ ORDEN DE SERVICIO '+ I.folio ,'servicio',NULL, NULL, I.rol,CURRENT_USER, GETDATE()
		FROM INSERTED I;
end;

go


create table confor_servicio 
( 
  idconfor_servicio int IDENTITY NOT NULL,
  folio nvarchar(10) NOT NULL,
  fecha datetime NOT NULL,
  estado nchar(2),
  nombre_cliente nvarchar(10) NOT NULL,
  nombre_sede nvarchar(10) NOT NULL,
  direccion nvarchar(10) NOT NULL,
  observaciones nvarchar(100),
  rol varchar(10) NULL,
  rol_aprobador varchar(10) NULL,
  rol_anulador varchar(10) NULL,
  PRIMARY KEY(idconfor_servicio),
  idServicio int FOREIGN KEY REFERENCES servicio(idServicio) ON DELETE CASCADE,
);
go

---TR_CONFOR_SERVICIO
drop trigger if exists dbo.tr_confor_servicio_insert;
go
create or ALTER  trigger dbo.tr_confor_servicio_insert
on dbo.confor_servicio 
for insert
as
begin
		insert into dbo.aud_audit_modif(codigo, observaciones, tabla, valor_antes,valor_despues, usuario,usuario_bd,fecha) 
		SELECT I.folio,'SE REGISTRÓ CONFORMIDAD DE SERVICIO '+ I.folio ,'confor_servicio',NULL, NULL, I.rol,CURRENT_USER, GETDATE()
		FROM INSERTED I;
end;

go

insert into servicio values (getdate(),getdate(),'S','PRIMER SERVICIO XXX','1','RMB',null,null,'0000001');
insert into confor_servicio values ('0000001',getdate(),'S','los alamos s.a.c','SAN MIGUEL','AV.LA MARINA','OK CONFORME','RMB',null,null,1)