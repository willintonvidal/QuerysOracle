CREATE OR REPLACE PACKAGE restauracion_password
AS
  PROCEDURE password_usu(
      usuario_id NUMBER,
      pass_usu OUT VARCHAR2);
  PROCEDURE nombres_usu(
      usuario_id NUMBER,
      nom_usu OUT VARCHAR2);
  PROCEDURE email_usu(
      usuario_id NUMBER,
      email_usu OUT VARCHAR2);
  ---ESTO FUE LO QUE HICE NUEVO EN ESTE PROCEDIMIENTO
END restauracion_password;
/*Cuerpo del paquete */
----------------------------
-----------Mostrar datos pass------------------
CREATE OR REPLACE PACKAGE body restauracion_password
AS
  PROCEDURE password_usu(
      usuario_id NUMBER,
      pass_usu OUT VARCHAR2)
  IS
  BEGIN
    SELECT QB_ENCRIPCION.FB_DESCENCRIPTAR(USU_CONTRASENIA)
    INTO pass_usu
    FROM usuario
    WHERE USU_ID = usuario_id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    pass_usu := '0';
  END password_usu;
--------------------------------
-------NOMBRE--------------
--------------------------------
  PROCEDURE nombres_usu(
      usuario_id NUMBER,
      nom_usu OUT VARCHAR2)
  IS
  BEGIN
    SELECT USU_NOMBRES INTO nom_usu FROM usuario WHERE USU_ID = usuario_id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    nom_usu := '0';
  END nombres_usu;
--------------------------------
-------BUSCAR ROLE--------------
--------------------------------
--------------------------------
-------SELECCIONAR EL NOMBRE --------------
--------------------------------
  PROCEDURE email_usu(
      usuario_id NUMBER,
      email_usu OUT VARCHAR2)
  IS
  BEGIN
    SELECT USU_EMAIL INTO email_usu FROM usuario WHERE USU_ID = usuario_id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    email_usu := '0';
  END email_usu;
--------------------------------
-------SELECCIONAR EL NOMBRE --------------
--------------------------------
END restauracion_password;
