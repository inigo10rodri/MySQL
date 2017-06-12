drop table departamentos;
drop table auditoria_depart_i_b;
create table departamentos(
dept_no TINYINT(2) NOT NULL,
dnombre VARCHAR(15),
localidad VARCHAR(15),
primary key(dept_no)

);
create table auditoria_depart_i_b(
fecha DATE,
hora  TIME,
codigo_dept TINYINT(2),
nombre_dept VARCHAR(15),
operacion VARCHAR(15));


create table auditoria_depart_modif(
fecha  DATE, 
hora  TIME ,
cod_dept_viejo TINYINT(2) ,
cod_dept_nuevo TINYINT(2) ,
nom_dept_viejo VARCHAR(15) ,
nom_dept_nuevo VARCHAR(15) 

);

