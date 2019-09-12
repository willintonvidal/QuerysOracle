CREATE OR REPLACE PACKAGE gestionar_centro_educativo
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE mostrar_centro_educativo(
        cursorInstitucion OUT t_cursor);
    PROCEDURE insertar_centro_educativo(
        nit_centro_educativo       VARCHAR2,
        nombre_centro_educativo    VARCHAR2,
        ciudad_centro_educativo    VARCHAR2,
        telefono_centro_educativo  VARCHAR2,
        direccion_centro_educativo VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE actualizar_centro_educativo(
        nit_centro_educativo       VARCHAR2,
        nombre_centro_educativo    VARCHAR2,
        ciudad_centro_educativo    VARCHAR2,
        telefono_centro_educativo  VARCHAR2,
        direccion_centro_educativo VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_centro_educativo(
        nit_centro_educativo VARCHAR2,
        ejecuto OUT NUMBER);
  END gestionar_centro_educativo;
  
  
CREATE OR REPLACE PACKAGE BODY gestionar_centro_educativo
AS
  PROCEDURE mostrar_centro_educativo(
      cursorInstitucion OUT t_cursor)
  IS
  BEGIN
    OPEN cursorInstitucion FOR SELECT * FROM CENTRO_EDUCATIVO;
  END mostrar_centro_educativo;
--------------------
  PROCEDURE insertar_centro_educativo(
      nit_centro_educativo       VARCHAR2,
      nombre_centro_educativo    VARCHAR2,
      ciudad_centro_educativo    VARCHAR2,
      telefono_centro_educativo  VARCHAR2,
      direccion_centro_educativo VARCHAR2,
      ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO CENTRO_EDUCATIVO
      (
        CEN_EDU_NIT,
        CEN_EDU_NOMBRE,
        CEN_EDU_CIUDAD,
        CEN_EDU_TELEFONO,
        CEN_EDU_DIRECCION
      )
      VALUES
      (
        nit_centro_educativo,
        nombre_centro_educativo,
        ciudad_centro_educativo,
        telefono_centro_educativo,
        direccion_centro_educativo
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos de la  institución: ' || sqlerrm);
END insertar_centro_educativo;
PROCEDURE actualizar_centro_educativo
  (
    nit_centro_educativo       VARCHAR2,
    nombre_centro_educativo    VARCHAR2,
    ciudad_centro_educativo    VARCHAR2,
    telefono_centro_educativo  VARCHAR2,
    direccion_centro_educativo VARCHAR2,
    ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE CENTRO_EDUCATIVO
  SET CEN_EDU_NIT     = nit_centro_educativo,
    CEN_EDU_NOMBRE    = nombre_centro_educativo,
    CEN_EDU_CIUDAD    = ciudad_centro_educativo,
    CEN_EDU_TELEFONO  = telefono_centro_educativo,
    CEN_EDU_DIRECCION = direccion_centro_educativo
  WHERE CEN_EDU_NIT   = nit_centro_educativo;
  IF SQL%rowcount     > 0 THEN
    ejecuto          := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos de la institución  institución: ' || sqlerrm);
END actualizar_centro_educativo;
PROCEDURE eliminar_centro_educativo(
    nit_centro_educativo VARCHAR2,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM CENTRO_EDUCATIVO WHERE CEN_EDU_NIT = nit_centro_educativo;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de la institución institución: ' || sqlerrm);
END eliminar_centro_educativo;
END gestionar_centro_educativo;
