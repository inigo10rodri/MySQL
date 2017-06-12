CREATE TABLE empleados(
emp_num  SMALLINT(4) UNSIGNED NOT NULL,
apellido VARCHAR(10),
oficio   VARCHAR(10) ,
dir     SMALLINT ,
fecha_alt  DATE ,
salario  FLOAT(6,2), 
comision FLOAT(6,2),
dept_no TINYINT(2) NOT NULL, 
PRIMARY KEY (emp_num),
FOREIGN KEY (dept_no) REFERENCES departamentos (dept_no)
);

CREATE TABLE AUDITORIA_EMPLEADO(
fecha DATE ,
hora  TIME ,
num_empl_viejo SMALLINT(4) ,
num_empl_nuevo SMALLINT(4) ,
apellido_empl_viejo  VARCHAR(10) ,
apellido_empl_nuevo VARCHAR(10) ,
operacion VARCHAR(15) 

);