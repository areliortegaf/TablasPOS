CREATE TABLE USUARIOS (
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    NOMBRE VARCHAR2(33),
    CLAVE  VARCHAR2(10),
    TIPO NUMBER(1) );
    
    
CREATE TABLE ARTICULOS (
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    NOMBRE VARCHAR2(33),
    PRECIO  NUMBER(9,2),
    CLAVE VARCHAR2(15),
    DESCRIPCION VARCHAR2(40) );    
    
CREATE TABLE VENTAS (
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    TICKET NUMBER(12),
    ID_ART NUMBER(12),
    PRECIO_ART  NUMBER(9,2),
    FECHA DATE );    
    
    
CREATE TABLE INVENTARIO (
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    ID_ART NUMBER(12),
    CANTIDAD NUMBER(30) );    
    
-------------------------------------------------------------------------------------
SELECT * FROM USUARIOS

SELECT * FROM ARTICULOS

SELECT * FROM VENTAS

SELECT * FROM INVENTARIO
--------------------------------------------------------------------------------------
INSERT INTO USUARIOS (NOMBRE, CLAVE, TIPO) values ('ARELI ORTEGA', 'ASORTEGA' , 1)    
INSERT INTO USUARIOS (NOMBRE, CLAVE, TIPO) values ('JUAN PEREZ', 'JUPEREZ' , 0)
    
INSERT INTO ARTICULOS (NOMBRE, PRECIO, CLAVE, DESCRIPCION) values ('SABRITAS' , 10.50, 123456789, 'PAPAS SABRITAS SAL')
INSERT INTO ARTICULOS (NOMBRE, PRECIO, CLAVE, DESCRIPCION) values ('DORITOS' , 9.50, 123456788, 'NACHOS')

INSERT INTO VENTAS (TICKET, ID_ART, PRECIO_ART, FECHA) values (1 , 1, 10.50, SYSDATE)

INSERT INTO INVENTARIO (ID_ART, CANTIDAD) VALUES (1,50)
-----------------------------------------------------------------------------------------

                        
DROP TABLE ARTICULOS
    
DROP TABLE VENTAS
 
DROP TABLE INVENTARIO

----------------------------------------------------------------------------------------------------------------------------------
alter table INVENTARIO
  add constraint NUEVOARTICULO
  foreign key (ID_ART)
  references ARTICULOS (ID);


------------------------------------------------------------------------------------------------------------------------------------
UPDATE VENTAS v
   SET (ID_INV_VENTAS) = (SELECT v2.ID_INV_VENTAS
                         FROM VENTAS v2
                        WHERE a1.ID_INV_VENTAS = v2.ID_INV_VENTAS)