/*GESTION DE ACUDIENTES*/
CREATE OR REPLACE PACKAGE gestionar_acudiente
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE get_all_acudientes(
        cursorAcudiente OUT t_cursor);
    PROCEDURE insertar_acudiente(
        acudiente_tipo_ident VARCHAR2,
        acu_numero_ident     NUMBER,
        acu_nombre_completo  VARCHAR2,
        ecudiente_email      VARCHAR2,
        acudiente_telefono   VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE actualizar_acudiente(
        acudiente_tipo_ident VARCHAR2,
        acu_numero_ident     NUMBER,
        acu_nombre_completo  VARCHAR2,
        ecudiente_email      VARCHAR2,
        acudiente_telefono   VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_acudiente(
        acu_numero_ident NUMBER,
        ejecuto OUT NUMBER);
  END gestionar_acudiente;
  
  
  
CREATE OR REPLACE PACKAGE BODY gestionar_acudiente
AS
  PROCEDURE get_all_acudientes(
      cursorAcudiente OUT t_cursor)
  IS
  BEGIN
    OPEN cursorAcudiente FOR SELECT * FROM ACUDIENTE;
  END get_all_acudientes;
  PROCEDURE insertar_acudiente(
      acudiente_tipo_ident VARCHAR2,
      acu_numero_ident     NUMBER,
      acu_nombre_completo  VARCHAR2,
      ecudiente_email      VARCHAR2,
      acudiente_telefono   VARCHAR2,
      ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO ACUDIENTE
      (
        ACU_TIPO_IDENTIFICACION,
        ACU_NUMERO_IDENTIFICACION,
        ACU_NOMBRE_COMPLETO,
        ACU_EMAIL,
        ACU_TELEFONO
        
        
      )
      VALUES
      (
        acudiente_tipo_ident ,
        acu_numero_ident ,
        acu_nombre_completo ,
        ecudiente_email ,
        acudiente_telefono
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos del acudiente: ' || sqlerrm);
END insertar_acudiente;
PROCEDURE actualizar_acudiente
  (
    acudiente_tipo_ident VARCHAR2,
    acu_numero_ident     NUMBER,
    acu_nombre_completo  VARCHAR2,
    ecudiente_email      VARCHAR2,
    acudiente_telefono   VARCHAR2,
    ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE ACUDIENTE
  SET ACU_TIPO_IDENTIFICACION     = acudiente_tipo_ident,
    ACU_NUMERO_IDENTIFICACION     = acu_numero_ident,
    ACU_NOMBRE_COMPLETO           = acu_nombre_completo,
    ACU_EMAIL                     = acu_email,
    ACU_TELEFONO                  = acudiente_telefono
  WHERE ACU_NUMERO_IDENTIFICACION = acu_numero_ident;
  IF SQL%rowcount                 > 0 THEN
    ejecuto                      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos del acudiente: ' || sqlerrm);
END actualizar_acudiente;
PROCEDURE eliminar_acudiente(
    acu_numero_ident NUMBER,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM ACUDIENTE WHERE ACU_NUMERO_IDENTIFICACION = acu_numero_ident;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de acudiente: ' || sqlerrm);
END eliminar_acudiente;
END gestionar_acudiente;