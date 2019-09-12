/*Actividad Estudiante*/
CREATE OR REPLACE PACKAGE gestionar_actividad_estudiante
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE get_all_actividad_estudiant(
        cursorActividadEstudiante OUT t_cursor);
    PROCEDURE insertar_actividad_estudiante(
        rel_act_est_id     NUMBER,
        estudiante_id      NUMBER,
        actividad_eva_id   NUMBER,
        tema_id            NUMBER,
        materia_id         NUMBER,
        rel_actividad_nota NUMBER ,
        ejecuto OUT NUMBER);
    PROCEDURE actualizar_actividad_estudiant(
        rel_act_est_id     NUMBER,
        estudiante_id      NUMBER,
        actividad_eva_id   NUMBER,
        tema_id            NUMBER,
        materia_id         NUMBER,
        rel_actividad_nota NUMBER ,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_actividad_estudiante(
        rel_act_est_id NUMBER,
        ejecuto OUT NUMBER);
  END gestionar_actividad_estudiante;
  -------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY gestionar_actividad_estudiante
AS
  PROCEDURE get_all_actividad_estudiant(
      cursorActividadEstudiante OUT t_cursor)
  IS
  BEGIN
    OPEN cursorActividadEstudiante FOR SELECT * FROM ACTIVIDAD_ESTUDIANTE;
  END get_all_actividad_estudiant;
--------------------
  PROCEDURE insertar_actividad_estudiante(
      rel_act_est_id     NUMBER,
      estudiante_id      NUMBER,
      actividad_eva_id   NUMBER,
      tema_id            NUMBER,
      materia_id         NUMBER,
      rel_actividad_nota NUMBER ,
      ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO ACTIVIDAD_ESTUDIANTE
      (
        REL_ACT_ID ,
        EST_ID ,
        ACT_EVA_ID ,
        TEM_ID ,
        MAT_ID ,
        REL_ACT_NOTA
      )
      VALUES
      (
        rel_act_est_id ,
        estudiante_id ,
        actividad_eva_id ,
        tema_id ,
        materia_id ,
        rel_actividad_nota
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos en la tabla tema actividad estudiante: ' || sqlerrm);
END insertar_actividad_estudiante;
-------------------------------------------------------------
PROCEDURE actualizar_actividad_estudiant
  (
    rel_act_est_id     NUMBER,
    estudiante_id      NUMBER,
    actividad_eva_id   NUMBER,
    tema_id            NUMBER,
    materia_id         NUMBER,
    rel_actividad_nota NUMBER ,
    ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE ACTIVIDAD_ESTUDIANTE
  SET REL_ACT_ID   = rel_act_est_id,
    EST_ID         = estudiante_id,
    ACT_EVA_ID     = actividad_eva_id,
    TEM_ID         = tema_id,
    MAT_ID         = materia_id ,
    REL_ACT_NOTA   = rel_actividad_nota
  WHERE REL_ACT_ID = rel_act_est_id;
  IF SQL%rowcount  > 0 THEN
    ejecuto       := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos de la tabla tema actividad estudiante: ' || sqlerrm);
END actualizar_actividad_estudiant;
----------------------------------------------
PROCEDURE eliminar_actividad_estudiante(
    rel_act_est_id NUMBER,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM ACTIVIDAD_ESTUDIANTE WHERE REL_ACT_ID = rel_act_est_id;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de la tabla actividad estudiante: ' || sqlerrm);
END eliminar_actividad_estudiante;
END gestionar_actividad_estudiante;
