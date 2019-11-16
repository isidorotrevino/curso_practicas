create table catalogo (
	id integer not null primary key,
	clasificacion text not null,
	clave text,
	nombre text
);

create sequence seq_catalogo;

create table sub_clasificacion(
	id int not null primary key,
	id_clasificacion int,
	id_ropa int,
	id_accesorios int,
	id_hogar int,
	id_papeleria int,
	id_ocasiones_especiales int,
	FOREIGN KEY (id_clasificacion) REFERENCES catalogo(id),
	FOREIGN KEY (id_ropa) REFERENCES catalogo(id),
	FOREIGN KEY (id_accesorios) REFERENCES catalogo(id),
	FOREIGN KEY (id_hogar) REFERENCES catalogo(id),
	FOREIGN KEY (id_papeleria) REFERENCES catalogo(id),
	FOREIGN KEY (id_ocasiones_especiales) REFERENCES catalogo(id)
);

create sequence seq_sub_clasificacion;

create table producto (
	id int not null primary key,
	nombre text,
	precio numeric,
	id_sub_clasificacion int,
	id_material int,
	id_tecnica int,
	id_tamano int,
	id_color int,
	id_genero int,
	foreign key (id_sub_clasificacion) references sub_clasificacion(id),
	foreign key (id_material) references catalogo(id),
	foreign key (id_tecnica) references catalogo(id),
	foreign key (id_tamano) references catalogo(id),
	foreign key (id_color) references catalogo(id),
	foreign key (id_genero) references catalogo(id)
);
create sequence seq_producto;

CREATE VIEW vw_subclasificacion AS
SELECT sb.id,
c.nombre as clasificacion,
r.nombre as ropa,
a.nombre as accesorios,
h.nombre as hogar,
p.nombre as papeleria,
o.nombre as ocasiones_especiales
FROM sub_clasificacion sb
LEFT JOIN catalogo c
ON sb.id_clasificacion = c.id
LEFT JOIN catalogo r
ON sb.id_ropa = r.id
LEFT JOIN catalogo a
on sb.id_accesorios = a.id
LEFT JOIN catalogo h
ON sb.id_hogar = h.id
LEFT JOIN catalogo p
ON sb.id_papeleria = p.id
LEFt JOIN catalogo o
ON sb.id_ocasiones_especiales = o.id;

CREATE VIEW vw_producto AS
SELECT p.id,
p.nombre,
p.precio,
s.id as id_sub_clasificacion,
s.clasificacion,
s.ropa,
s.accesorios,
s.hogar,
s.papeleria,
s.ocasiones_especiales,
m.nombre as material,
tm.nombre as tamano,
c.nombre as color,
g.nombre as genero
FROM producto p
LEFT JOIN vw_subclasificacion s
ON p.id_sub_clasificacion = s.id
LEFT JOIN catalogo m
ON p.id_material = m.id
LEFT JOIN catalogo t
ON p.id_tecnica = t.id
LEFT JOIN catalogo tm
ON p.id_tamano = tm.id
LEFT JOIN catalogo c
ON p.id_color = c.id
LEFT JOIN catalogo g
ON p.id_genero = g.id;

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','AN','ANILLO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','AR','ARETES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','BA','BANDANA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','BB','BOLSA BAMBOO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','BO','BOLSA  ');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','BT','BOLSA TOTE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','CI','CINTURÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','CO','COLLAR/CORREA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','DI','DIJE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','IE','IDENTIFICADOR EQUIPAJE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','LA','LAPICERA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','LL','LLAVERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','MO','MORRAL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','PI','PLACA IDENTIFICACIÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','PU','PULSERA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'accesorios','SO','SOMBRILLA');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'clasificacion','AC','ACCESORIOS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'clasificacion','HO','HOGAR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'clasificacion','OE','OCASIONES ESPECIALES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'clasificacion','PP','PAPELERÍA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'clasificacion','RO','ROPA');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AG','PLATA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AM','AMARILLO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AQ','AQUA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AR','AURORA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AU','ORO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','AZ','AZUL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','BE','BEIGE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','BL','BLANCO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','CA','CAFÉ');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','CU','COBRE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','ES','ESMERILADO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','FL','FOTOLUMINISCENTE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','GR','GRIS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','JA','JASPE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','LI','LILA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','LE','LIMÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','MA','MARINO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','MG','MAGENTA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','MO','MORADO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','MS','MOSTAZA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','NA','NARANJA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','NE','NEÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','NG','NEGRO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','PE','PERLA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','RJ','ROJO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','RS','ROSA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','SA','SATINADO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','SP','ESPECIAL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','TR','TRANSPARENTE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','VE','VERDE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'color','VI','VINO');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','MJ','MUJER');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','HM','HOMBRE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','NA','NIÑA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','NO','NIÑO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','BB','BEBÉ');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','MS','MASCOTA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'genero','NE','NEUTRO');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','AC','ACEITERA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','AG','AGITADOR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','AL','ALCANCÍA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','AN','ÁNFORA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','AZ','AZULEJO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','BO','BOTELLA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CB','CABEZAS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CC','CAJAS CHELERAS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CF','CAFETERA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CH','CHAROLA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CL','COLGANTE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CO','COPA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CT','TAZA CUADRADA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','CU','CUADRO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','DP','DECOPASTEL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','DS','DESTAPADOR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','DT','DECOTAZA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','DU','DULCERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','IN','INFUSOR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','JA','JARRA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','LA','LATA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','LM','LÁMPARA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','MC','MACETA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','MJ','MASON JAR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PA','PLATO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PB','PORTABOTELLAS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PC','PORTACUCHILLOS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PG','POSAVASOS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PH','PORTAHUEVO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PL','PORTALLAVES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PO','POCILLO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PT','TAZA/PLATO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','PV','PORTAVELAS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','RC','RECONOCIMIENTO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','RE','RELOJ');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','SA','SALERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','SE','SEÑALES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','SO','SOPORTE/ORGANIZADOR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','SR','SERVILLETERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TA','TARRO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TC','TAZA CÓNICA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TD','TAZA PAREJA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TE','TERMO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TM','TAZA MÁGICA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TN','TAZÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TP','TABLA PARA PICAR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TS','TEQUILERO/SHOT');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TU','TUMBLER');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','TZ','TAZA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','VL','VOLUMÉTRICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'hogar','VS','VASO');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','CR','CERÁMICA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','IM','IMÁN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','MD','MADERA/MDF');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','ME','METAL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','MX','MIXTO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','PC','PAPEL/CARTÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','PL','PLÁSTICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','PP','POLIPROPILENO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','SP','ESPECIAL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','TX','TEXTIL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'material','VD','VIDRIO');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','AN','ANIVERSARIO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','BA','BAUTIZO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','BO','BODA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','CU','CUMPLEAÑOS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','DA','DÍA DE LOS ABUELOS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','DM','DÍA DE LA MADRE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','DN','DÍA DEL NIÑO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','DP','DÍA DEL PADRE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','FI','FIESTA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','HL','HALLOWEEN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','MX','MÉXICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','NA','NAVIDAD');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','NY','AÑO NUEVO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','PA','PASCUA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','PC','PRIMERA COMUNIÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','SH','SHOWERS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','SV','SAN VALENTÍN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','VC','VUELTA A CLASES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ocasiones_especiales','XV','XV AÑOS');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','CA','CALENDARIO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','FO','FÓLDER');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','IN','INVITACIONES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','LI','LIBRETA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','PO','POSTAL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','RE','REGLA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','SE','SEPARADOR');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','SI','SEPARADOR IMÁN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','ST','STICKERS');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','TA','TARJETA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'papeleria','TB','TABLA PARA ANOTAR');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','BB','BABERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','BL','BLUSÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','GA','GORRA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','GO','GORRO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','HO','SUDADERA CON CIERRE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','MA','MANDIL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PA','PAREO/PAÑUELO/PALIACATE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PL','PLAYERA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PML','PLAYERA MANGA LARGA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PN','PAÑALERO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PO','POLO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','POL','POLO MANGA LARGA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PR','PLAYERA RANGLAN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','PV','PLAYERA V');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','SC','SUDADERA CON CAPUCHA Y GORRA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','SU','SUDADERA  ');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','TO','TOALLA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'ropa','TT','TANK TOP');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','XCH','EXTRA CHICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','CH','CHICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','M','MEDIANO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','G','GRANDE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','XG','EXTRA GRANDE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','XXG','DOBLE EXTRA GRANDE');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','U','ÚNICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','3M','3 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','6M','6 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','9M','9 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','12M','12 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','18M','18 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','24M','24 MESES');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T1','1');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T2','2');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T3','3');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T4','4');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T5','5');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T6','6');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T7','7');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T8','8');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T9','9');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T10','10');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T11','11');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T12','12');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tamano','T13','13');

INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','BR','BROCA');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','CV','CORTE VINIL');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','GM','GRABADO METÁLICO');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','IM','IMPRESIÓN');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','LS','LÁSER');
INSERT INTO catalogo (id, clasificacion,clave,nombre) VALUES (nextval('seq_catalogo'),'tecnica','SB','SUBLIMACIÓN');
