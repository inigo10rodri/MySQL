CREATE TABLE socios (dni VARCHAR(9),  
nombre VARCHAR(25), apellido VARCHAR(25) ,
edad INTEGER(2), num_hermanos INTEGER(2), 
telefono VARCHAR(9));

CREATE TABLE  SOCIOS_SIN_HERMANOS (dni_socio VARCHAR(9)); 

CREATE TABLE SOCIOS_CON_HERMANOS (dni_socio VARCHAR(9),
hermanos INTEGER(2));

CREATE TABLE SOCIOS_HERMANOS(dni_socio VARCHAR(9),
hermanos INTEGER(2), tiene VARCHAR(2));


-- a.-
-- Crea  el  trigger INSERTAR_SOCI  asociado  a  la  tabla  SOCIOS  que  se  active  después  de
-- insertar  un  socio.  Tiene  que  insertar  una  fila  en  la  tabla  SOCIOS_CON_HERMANOS 
-- o  en SOCIOS_SIN_HERMANOS dependiendo de si el socio tiene
-- hermanos o no; y además insertar también una fila en la tabla SOCIOS_HERMANOS.   
DELIMITER |  
create trigger INSERTAR_SOCI after insert on socios
for each row
begin
if (NEW.num_hermanos<=0) then
insert into SOCIOS_SIN_HERMANOS values(NEW.dni);
insert into SOCIOS_HERMANOS values(NEW.dni,NEW.num_hermanos,"No");
else 
insert into SOCIOS_CON_HERMANOS values(NEW.dni,NEW.num_hermanos);
insert into SOCIOS_HERMANOS values(NEW.dni,NEW.num_hermanos,"Si");
end if ;
END ;
|
DELIMITER ; 
drop trigger INSERTAR_SOCI;
insert into socios values("45789632D","Julio","Pérez",43,1,"369898987");
insert into socios values("99789632D","María","Rúiz",39,0,"889898987");

select * from socios;
select * from socios_hermanos;
select * from socios_sin_hermanos;
select * from socios_con_hermanos;
select * from socios_sin_hermanos;
-- b.-
-- Crea  el  trigger BORRAR_SOCIO asociado  a  la  tabla  SOCIOS  que  se  active  después  d
-- e borrar  un  socio.  Tiene  que  borrar  una  fila  de  la  tabla  SOCIOS_CON_HERMANOS  o  de 
-- SOCIOS_SIN_HERMANOS dependiendo de si el socio a borrar tiene hermanos o no;  y borrar 
-- también la fila correspondiente en la tabla SOCIOS_HEMANOS.
DELIMITER |  
create trigger BORRAR_SOCIO after delete on socios
for each row
begin
if (NEW.num_hermanos<=0) then
delete from SOCIOS_SIN_HERMANOS where dni_socio = OLD.dni;
delete from SOCIOS_HERMANOS where dni_socio = OLD.dni;
else 
delete from SOCIOS_CON_HERMANOS where dni_socio = OLD.dni;
delete from SOCIOS_HERMANOS where dni_socio = OLD.dni;
end if ;
END ;
|
DELIMITER ; 
drop trigger BORRAR_SOCIO;
delete from socios where dni = "45789632D";
-- c.-
-- Crea el trigger MODIFICAR_SOCIO  asociado a la tabla SOCIOS que se active después d
-- e modificar   los   datos   de   un   socio.   Tiene   que   actualizar 
--  los   datos   de   la   tabla   o   tablas SOCIOS_SIN_HERMANOS    o 
-- SOCIOS_CON_HERMANOS    dependiendo    de    los    datos modificados; 
-- y  actualizar los datos de la tabla SOCIOS_HERMANOS. 
DELIMITER |  
create trigger MODIFICAR_SOCIO 
after update on socios
for each row
begin
    if (NEW.num_hermanos != OLD.num_hermanos &&  NEW.num_hermanos<=0) then -- si cambia a no tener hermanos
            UPDATE SOCIOS_HERMANOS set num_hermanos="No";
            delete from SOCIOS_HERMANOS where dni_socio = OLD.dni;
            insert into socios_sin_hermanos(dni) values(OLD.dni);
            
            
    else if(NEW.num_hermanos != OLD.num_hermanos &&  NEW.num_hermanos>0) then -- si cambia a tener hermanos 
            UPDATE SOCIOS_HERMANOS set num_hermanos="Sí";
            delete from socios_sin_hermanos where dni_socio = OLD.dni;
            insert into socios_con_hermanos(dni, num_hermanos,tiene) VALUES(NEW.dni,NEW.num_hermanos,NEW.tiene) ;
            
            
    if(NEW.dni != OLD.dni) then-- si se cambio el dni
        if (NEW.num_hermanos<=0) then
             UPDATE  SOCIOS_SIN_HERMANOS set dni_socio=NEW.dni where dni = OLD.dni;
        else 
             UPDATE  SOCIOS_HERMANOS set dni_socio=NEW.dni where dni = OLD.dni; 
        END IF;
        
    if( NEW.num_hermanos != OLD.num_hermanos) then             
                UPDATE  SOCIOS_HERMANOS set hermanos=NEW.num_hermanos where dni = OLD.dni;
    

    END IF;
    END IF;
    END IF;
    END IF;
END ;
|
DELIMITER ; 
