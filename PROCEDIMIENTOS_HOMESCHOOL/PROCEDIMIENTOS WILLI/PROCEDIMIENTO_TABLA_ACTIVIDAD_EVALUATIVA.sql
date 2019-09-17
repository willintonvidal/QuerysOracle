--hay un campo llamado ACT_EVA_ no se para que sera
/*ACTIVIDAD EVALUATIVA*/
CREATE OR REPLACE PACKAGE gestionar_actividad_evaluativa
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE get_all_actividad_evaluativa(
        cursorActividadEvaluativa OUT t_cursor);
    PROCEDURE insertar_actividad_evaluativa(
        actividad_eva_id       NUMBER,
        tema_id                NUMBER,
        materia_id             NUMBER,
        actividad_eva_nombre   VARCHAR2,
        actividad_fecha_inicio DATE,
        actividad_eva_fin      DATE,
        actividad_eva_         VARCHAR2,
        actividad_eva_foto     VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE actualizar_actividad_evaluati(
        actividad_eva_id       NUMBER,
        tema_id                NUMBER,
        materia_id             NUMBER,
        actividad_eva_nombre   VARCHAR2,
        actividad_fecha_inicio DATE,
        actividad_eva_fin      DATE,
        actividad_eva_         VARCHAR2,
        actividad_eva_foto     VARCHAR2,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_actividad_evaluativa(
        actividad_eva_id NUMBER,
        ejecuto OUT NUMBER);
  END gestionar_actividad_evaluativa;
  ----------------------------------------
CREATE OR REPLACE PACKAGE BODY gestionar_actividad_evaluativa
AS
  PROCEDURE get_all_actividad_evaluativa(
      cursorActividadEvaluativa OUT t_cursor)
  IS
  BEGIN
    OPEN cursorActividadEvaluativa FOR SELECT * FROM ACTIVIDAD_EVALUATIVA;
  END get_all_actividad_evaluativa;
--------------------
  PROCEDURE insertar_actividad_evaluativa(
      actividad_eva_id       NUMBER,
      tema_id                NUMBER,
      materia_id             NUMBER,
      actividad_eva_nombre   VARCHAR2,
      actividad_fecha_inicio DATE,
      actividad_eva_fin      DATE,
      actividad_eva_         VARCHAR2,
      actividad_eva_foto     VARCHAR2,
      ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO ACTIVIDAD_EVALUATIVA
      (
        ACT_EVA_ID,
        TEM_ID,
        MAT_ID,
        ACT_EVA_NOMBRE,
        ACT_EVA_FECHA_INICIO,
        ACT_EVA_FECHA_FIN,
        ACT_EVA_OBSERVACION,
        ACT_EVA_FOTO
      )
      VALUES
      (
        actividad_eva_id ,
        tema_id ,
        materia_id ,
        actividad_eva_nombre ,
        actividad_fecha_inicio ,
        actividad_eva_fin ,
        actividad_eva_ ,
        actividad_eva_foto
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos en la tabla tema actividad evaluativa: ' || sqlerrm);
END insertar_actividad_evaluativa;
--------------------------------------------
PROCEDURE actualizar_actividad_evaluati
  (
    actividad_eva_id       NUMBER,
    tema_id                NUMBER,
    materia_id             NUMBER,
    actividad_eva_nombre   VARCHAR2,
    actividad_fecha_inicio DATE,
    actividad_eva_fin      DATE,
    actividad_eva_         VARCHAR2,
    actividad_eva_foto     VARCHAR2,
    ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE ACTIVIDAD_EVALUATIVA
  SET ACT_EVA_ID         = actividad_eva_id,
    TEM_ID               = tema_id,
    MAT_ID               = materia_id,
    ACT_EVA_NOMBRE       = actividad_eva_nombre,
    ACT_EVA_FECHA_INICIO = actividad_fecha_inicio,
    ACT_EVA_FECHA_FIN    = actividad_eva_fin,
    ACT_EVA_OBSERVACION             = actividad_eva_,
    ACT_EVA_FOTO         = actividad_eva_foto
  WHERE ACT_EVA_ID       = actividad_eva_id;
  IF SQL%rowcount        > 0 THEN
    ejecuto             := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos de la tabla tema actividad evaluativa: ' || sqlerrm);
END actualizar_actividad_evaluati;
----------------------------------------------------
PROCEDURE eliminar_actividad_evaluativa(
    actividad_eva_id NUMBER,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM ACTIVIDAD_EVALUATIVA WHERE ACT_EVA_ID = actividad_eva_id;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de la tabla actividad evaluativa: ' || sqlerrm);
END eliminar_actividad_evaluativa;
END gestionar_actividad_evaluativa;
