/*GESTION DE ESTUDIANTES*/
CREATE OR REPLACE PACKAGE gestionar_estudiante
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE get_all_estudiantes(
        cursorEstudiante OUT t_cursor);
    PROCEDURE insertar_estudiante(
        estudiante_id    NUMBER,
        acu_numero_ident NUMBER,
        grado_id         NUMBER,
        ejecuto OUT NUMBER);
        
    PROCEDURE actualizar_estudiante(
        estudiante_id    NUMBER,
        acu_numero_ident NUMBER,
        grado_id         NUMBER,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_estudiante(
        estudiante_id NUMBER,
        ejecuto OUT NUMBER);
  END gestionar_estudiante;
  
  
CREATE OR REPLACE PACKAGE BODY gestionar_estudiante
AS
  PROCEDURE get_all_estudiantes(
      cursorEstudiante OUT t_cursor)
  IS
  BEGIN
    OPEN cursorEstudiante FOR SELECT * FROM ESTUDIANTE;
  END get_all_estudiantes;
--------------------
  PROCEDURE insertar_estudiante(
      estudiante_id    NUMBER,
        acu_numero_ident NUMBER,
        grado_id         NUMBER,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO ESTUDIANTE
      (
        EST_ID,
        ACU_NUMERO_IDENTIFICACION,
        GRA_ID
      )
      VALUES
      (
        estudiante_id    ,
        acu_numero_ident ,
        grado_id         
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos en la tabla institucion: ' || sqlerrm);
END insertar_estudiante;
----------------------------------
PROCEDURE actualizar_estudiante
  (
   estudiante_id    NUMBER,
        acu_numero_ident NUMBER,
        grado_id         NUMBER,
        ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE ESTUDIANTE
  SET 
    EST_ID                  = estudiante_id,
    ACU_NUMERO_IDENTIFICACION = acu_numero_ident,
    GRA_ID                    = grado_id
  WHERE EST_ID                = estudiante_id;
  IF SQL%rowcount             > 0 THEN
    ejecuto                  := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos de la tabla estudiante: ' || sqlerrm);
END actualizar_estudiante;
-------------------------------
PROCEDURE eliminar_estudiante(
    estudiante_id NUMBER,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM ESTUDIANTE WHERE EST_ID = estudiante_id;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de la tabla estudiante: ' || sqlerrm);
END eliminar_estudiante;
END gestionar_estudiante;



