CREATE TABLE regiones
   ( region_id NUMBER 
   CONSTRAINT region_id_nn NOT NULL 
   , region_nombre VARCHAR2(25) 
   );

CREATE UNIQUE INDEX reg_id_pk
         ON regiones (region_id);

ALTER TABLE regiones
         ADD ( CONSTRAINT reg_id_pk
   PRIMARY KEY (region_id)
   ) ;
       

CREATE TABLE poblaciones 
   ( poblacion_id CHAR(2) 
   CONSTRAINT poblacion_id_nn NOT NULL 
   , poblacion_nombre VARCHAR2(40) 
   , region_id NUMBER 
   , CONSTRAINT poblacion_c_id_pk 
   PRIMARY KEY (poblacion_id) 
   ) ;



ALTER TABLE poblaciones
         ADD ( CONSTRAINT countr_reg_fk
   FOREIGN KEY (region_id)
   REFERENCES regiones(region_id) 
   ) ;
       

CREATE TABLE localizaciones
   ( localizacion_id NUMBER(4)
   , direccion VARCHAR2(40)
   , postal_codigo VARCHAR2(12)
   , ciudad VARCHAR2(30)
   CONSTRAINT loc_ciudad_nn NOT NULL
   , provincia VARCHAR2(25)
   , poblacion_id CHAR(2)
   ) ;

CREATE UNIQUE INDEX loc_id_pk
         ON localizaciones (localizacion_id) ;

ALTER TABLE localizaciones
         ADD ( CONSTRAINT loc_id_pk
   PRIMARY KEY (localizacion_id)
   , CONSTRAINT loc_c_id_fk
   FOREIGN KEY (poblacion_id)
   REFERENCES poblaciones(poblacion_id) 
   ) ;

CREATE SEQUENCE localizaciones_seq
   START WITH 3300
   INCREMENT BY 100
   MAXVALUE 9900
   NOCACHE
   NOCYCLE;

       

CREATE TABLE departamentos
   ( departamento_id NUMBER(4)
   , departamento_nombre VARCHAR2(30)
   CONSTRAINT dept_nombre_nn NOT NULL
   , manager_id NUMBER(6)
   , localizacion_id NUMBER(4)
   ) ;

CREATE UNIQUE INDEX dept_id_pk
         ON departamentos (departamento_id) ;

ALTER TABLE departamentos
         ADD ( CONSTRAINT dept_id_pk
   PRIMARY KEY (departamento_id)
   , CONSTRAINT dept_loc_fk
   FOREIGN KEY (localizacion_id)
   REFERENCES localizaciones (localizacion_id)
   ) ;

CREATE SEQUENCE departamentos_seq
   START WITH 280
   INCREMENT BY 10
   MAXVALUE 9990
   NOCACHE
   NOCYCLE;
       

CREATE TABLE trabajos
   ( trabajo_id VARCHAR2(10)
   , trabajo_nombre VARCHAR2(35)
   CONSTRAINT trabajo_nombre_nn NOT NULL
   , min_salario NUMBER(6)
   , max_salario NUMBER(6)
   ) ;

CREATE UNIQUE INDEX trabajo_id_pk 
         ON trabajos (trabajo_id) ;

ALTER TABLE trabajos
         ADD ( CONSTRAINT trabajo_id_pk
   PRIMARY KEY(trabajo_id)
   ) ;
       

CREATE TABLE empleados
   ( empleado_id NUMBER(6)
   , nombre VARCHAR2(20)
   , apellido VARCHAR2(25)
   CONSTRAINT emp_apellido_nn NOT NULL
   , email VARCHAR2(25)
   CONSTRAINT emp_email_nn NOT NULL
   , telefono VARCHAR2(20)
   , contraTo_date date
   CONSTRAINT emp_contraTo_date_nn NOT NULL
   , trabajo_id VARCHAR2(10)
   CONSTRAINT emp_trabajo_nn NOT NULL
   , salario NUMBER(8,2)
   , comision NUMBER(2,2)
   , manager_id NUMBER(6)
   , departamento_id NUMBER(4)
   , CONSTRAINT emp_salario_min
   CHECK (salario > 0) 
   , CONSTRAINT emp_email_uk
   UNIQUE (email)
   ) ;

CREATE UNIQUE INDEX emp_emp_id_pk
         ON empleados (empleado_id) ;
       

ALTER TABLE empleados
         ADD ( CONSTRAINT emp_emp_id_pk
   PRIMARY KEY (empleado_id)
   , CONSTRAINT emp_dept_fk
   FOREIGN KEY (departamento_id)
   REFERENCES departamentos
   , CONSTRAINT emp_trabajo_fk
   FOREIGN KEY (trabajo_id)
   REFERENCES trabajos (trabajo_id)
   , CONSTRAINT emp_manager_fk
   FOREIGN KEY (manager_id)
   REFERENCES empleados
   ) ;

ALTER TABLE departamentos
         ADD ( CONSTRAINT dept_mgr_fk
   FOREIGN KEY (manager_id)
   REFERENCES empleados (empleado_id)
   ) ;
       
       

CREATE SEQUENCE empleados_seq
   START WITH 207
   INCREMENT BY 1
   NOCACHE
   NOCYCLE;

CREATE TABLE trabajo_historial
   ( empleado_id NUMBER(6)
   CONSTRAINT jhist_empleado_nn NOT NULL
   , start_fecha date
   CONSTRAINT jhist_start_fecha_nn NOT NULL
   , end_fecha date
   CONSTRAINT jhist_end_fecha_nn NOT NULL
   , trabajo_id VARCHAR2(10)
   CONSTRAINT jhist_trabajo_nn NOT NULL
   , departamento_id NUMBER(4)
   , CONSTRAINT jhist_fecha_interval
   CHECK (end_fecha > start_fecha)
   ) ;

CREATE UNIQUE INDEX jhist_emp_id_st_fecha_pk 
         ON trabajo_historial (empleado_id, start_fecha) ;

ALTER TABLE trabajo_historial
         ADD ( CONSTRAINT jhist_emp_id_st_fecha_pk
   PRIMARY KEY (empleado_id, start_fecha)
   , CONSTRAINT jhist_trabajo_fk
   FOREIGN KEY (trabajo_id)
   REFERENCES trabajos
   , CONSTRAINT jhist_emp_fk
   FOREIGN KEY (empleado_id)
   REFERENCES empleados
   , CONSTRAINT jhist_dept_fk
   FOREIGN KEY (departamento_id)
   REFERENCES departamentos
   ) ;

       

CREATE OR REPLACE VIEW emp_details_view
   (empleado_id,
   trabajo_id,
   manager_id,
   departamento_id,
   localizacion_id,
   poblacion_id,
   nombre,
   apellido,
   salario,
   comision,
   departamento_nombre,
   trabajo_nombre,
   ciudad,
   provincia,
   poblacion_nombre,
   region_nombre)
   AS SELECT
   e.empleado_id, 
   e.trabajo_id, 
   e.manager_id, 
   e.departamento_id,
   d.localizacion_id,
   l.poblacion_id,
   e.nombre,
   e.apellido,
   e.salario,
   e.comision,
   d.departamento_nombre,
   j.trabajo_nombre,
   l.ciudad,
   l.provincia,
   c.poblacion_nombre,
   r.region_nombre
   FROM
   empleados e,
   departamentos d,
   trabajos j,
   localizaciones l,
   poblaciones c,
   regiones r
   WHERE e.departamento_id = d.departamento_id
   AND d.localizacion_id = l.localizacion_id
   AND l.poblacion_id = c.poblacion_id
   AND c.region_id = r.region_id
   AND j.trabajo_id = e.trabajo_id 
   WITH READ ONLY;