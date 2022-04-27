

--create database proyecto_egener



create table cliente
	(id_cliente int not null primary key ,
	ruc varchar(20) ,
	razon_social varchar(50),
	rubro varchar(50) ,
	fecha_ingreso date 
	)

create table sede
	(id_sede int  not null primary key,
	id_cliente int,
	direccion varchar(50) ,
	distrito varchar(50)  ,
	provincia varchar(50) ,
	departamento varchar(50) ,
	telefono varchar(9) ,
	correo varchar(30) ,
	constraint fk_id_cliente foreign key (id_cliente) references cliente(id_cliente),
	)



create table proveedor
(	id_proveedor int not null primary key,
	ruc varchar(20),
	razon_social varchar(50),
	sector_comercial varchar(50), 
	direccion varchar(50),
	correo varchar(40),
	telefono varchar(9),
	fecha_ingreso date,
)
create table empleado
(
	id_empleado int not null primary key,
	nombres varchar(50) ,
	apellidos varchar(50), 
	dni varchar(8) ,
	cargo varchar(20), 
	fecha_ingreso date, 
	direccion varchar(50), 
	distrito varchar(40) ,
	telefono varchar(9) ,
	salario float ,
)
		
create table vehiculo
(	id_vehiculo int not null primary key,
	placa varchar(10),
	fecha_adquisicion date ,
	marca varchar(20) ,
	color varchar(20) ,
	capacidad int ,
	fecha_revision date,
)

--===============================================================================================================


create table motor
(	id_motor int not null primary key,
	marca varchar(20),
	modelo varchar(20),
	tipo varchar(20),

)


create table alternador
(	id_alternador int not null primary key,
	modelo varchar(20),
	marca varchar(30),
	polea varchar(20),
	tipo_campo varchar(30),
	rotor varchar(20),
	distorsion_armonica float,
	factor_interferencia float,
	ieee_excitacion varchar(20),
	aspecto varchar(20),
	acoplamiento varchar(20),
	tipo_regulador_voltaje varchar(20),
	num_fases_detectadas varchar(20),
	precision_regulacion varchar(20),

)

create table grupo
(	id_grupo int not null primary key,
	modelo varchar(20),
	id_motor int, --llave foranea,
	marca_motor varchar(20),
	modelo_motor varchar(20),
	id_alternador int , --llave foranea
	marca_alternador varchar(20),
	modelo_alternador varchar(50),
	constraint fk_idmotor foreign key (id_motor) references motor(id_motor),
	constraint fk_idalternador foreign key (id_alternador) references alternador(id_alternador),
)

create table parte
(	
	id_parte int not null primary key,
	id_proveedor int,
	descripcion varchar(50),
	marca varchar(30),
	stock int,
	constraint fk_idproveedor foreign key (id_proveedor) references proveedor(id_proveedor),
)

create table insumo
(  id_insumo int not null primary key,
    descripcion varchar(30),
	marca varchar(30),
	und_fisica varchar(10),



)
-------
create table cab_pedido 
(	id_pedido int not null primary key,
	id_cliente int, --llave foranea
	fecha date,
	estado int,
	constraint fk_id_cliente2 foreign key (id_cliente) references cliente(id_cliente),

)

create table cotizacion
(	id_cotizacion int not null primary key,
	id_pedido int,--fk
	estado int,
	fecha date,
	constraint fk_id_pedido foreign key (id_pedido)	references cab_pedido(id_pedido),
)
create table det_cotizacion
(
	id_pedido int,--fk
	id_grupo int, --fk
	descripcion int,
	precio float,
	constraint fk_id_pedido2 foreign key (id_pedido)	references cab_pedido(id_pedido),
	constraint fk_id_grupo foreign key (id_grupo)	references grupo(id_grupo),
)

create table detalle_pedido
(
	id_pedido int,
	id_grupo int,
	plantel int,
	hora float,
	constraint fk_idpedidodetallepedido foreign key (id_pedido) references cab_pedido(id_pedido),
	constraint fk_idgrupodetallepedido	foreign key (id_pedido) references grupo(id_grupo),
)

--=======================================================================================================================0
create table oc_parte
(	id_oc_parte int not null primary key,
	id_proveedor int ,--fk
	id_empleado int, --fk
	fecha_emision date,
	fecha_entrega date,
	cond_pago int ,
	lugar_entre varchar(40),
	
	constraint fk_idproveedor1 foreign key (id_proveedor) references proveedor(id_proveedor),
	constraint fk_idempleado foreign key (id_empleado) references empleado(id_empleado),
)
create table ocp_detalle
(	id_oc_parte int,--fk
	id_parte int, --fk
	cantidad int ,

	constraint fk_oc_parte foreign key (id_oc_parte) references oc_parte(id_oc_parte),
	constraint fk_id_parte foreign key (id_parte) references parte(id_parte),

)

create table control_es
(	id_control_es int not null primary key,
	id_empleado int, --fk
	fecha date,
	constraint fk_id_empleado1 foreign key  (id_empleado) references empleado(id_empleado),
)

create table detalle_es
(	
	id_control_es int ,--fk
	id_parte int, --fk
	tipo_mov int,
	unidades int,
	constraint fk_id_control_es foreign key (id_control_es) references control_es(id_control_es),
	constraint fk_idparte2 foreign key (id_parte) references parte(id_parte),
 )
 -----
 create table orden_servicio 
 (	id_orden_servicio int not null primary key,
	id_cliente int,
	id_grupo int,
	proveedor varchar(20),
	sede varchar(30),
	fecha_ant date,
	fecha date,
	precio float,
	constraint fk_idcliente11 foreign key (id_cliente) references cliente(id_cliente),
	constraint fk_idgrupo foreign key (id_grupo) references grupo(id_grupo),
	
 )


create table servicio
(	id_servicio int not null primary key ,
	horas float,
	detalles varchar(40),
		
)

 create table det_servicio
 (	id_orden_servicio int,
	id_servicio int,
	constraint id_orden_servicio foreign key (id_orden_servicio) references orden_servicio(id_orden_servicio),
	constraint id_servicio1 foreign key (id_servicio) references servicio(id_servicio),

 )


 ------
 create table planificacion
( id_planificacion int not null primary key,
   id_orden_servicio int,
   id_empleado int,
   id_vehiculo int

   constraint id_orden_servicio1 foreign key (id_orden_servicio) references orden_servicio(id_orden_servicio),
	constraint id_empleado3 foreign key (id_empleado) references empleado(id_empleado),
	constraint id_vehiculo2 foreign key (id_vehiculo) references vehiculo(id_vehiculo),
)

create table det_insumo
( id_planificacion int,
id_insumo  int,
unidades int,

constraint id_planificacion foreign key (id_planificacion) references planificacion(id_planificacion),
	constraint id_insumo foreign key (id_insumo) references insumo(id_insumo)
)


create table det_parte
(  id_planificacion int,
id_parte  int,
unidades int,
constraint id_planificacion1 foreign key (id_planificacion) references planificacion(id_planificacion),
	constraint id_parte2 foreign key (id_parte) references parte(id_parte),
)

create table const_servicio
( int_constserv int, 
id_proovedor int, fk
fecha vchar(20),
receptor vchar(20),
id_orden_servicio int, fk	
id_servicio int, fk)

create table prueb_campo
( int_constserv int, fk
id_cliente int, fk
id_grupo int, fk
voltaje int,
hz int,
horometro int,
voltbateria int,
tempagua int,
pres aceitee int,
hoain double,
horafin double,
kw double,
carga double,
fase int,
hzfase int,
voltajefase int,
ampfase int,)