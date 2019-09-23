--EN LA TABLA TEMA_ESTUDIANTE EL TYPO DE VARIABE NUMBER NO TIENE TAMA?O
/*GESTION TEMA ESTUDIANTE*/
CREATE OR REPLACE PACKAGE gestionar_tema_estudiante
AS
type t_cursor
IS
  ref
  CURSOR;
    PROCEDURE get_all_temas_estudiante(
        cursorTemaEstudiante OUT t_cursor);
    PROCEDURE insertar_tema_estudiante(
        estudiante_id       NUMBER,
        tema_id       NUMBER,
        materia_id       NUMBER,
        rel_tema_nota NUMBER,
        ejecuto OUT NUMBER);
    PROCEDURE actualizar_tema_estudiante(
        rel_tema_est_id  NUMBER,
        estudiante_id       NUMBER,
        tema_id       NUMBER,
        materia_id       NUMBER,
        rel_tema_nota NUMBER,
        ejecuto OUT NUMBER);
    PROCEDURE eliminar_tema_estudiante(
        rel_tema_est_id NUMBER,
        ejecuto OUT NUMBER);
        
    PROCEDURE promedio_tema_for_estudiante(
        estudiante_id NUMBER,
        tema_id NUMBER,
        materia_id NUMBER,
        promedio OUT NUMBER);
        
  END gestionar_tema_estudiante;
  

  
CREATE OR REPLACE PACKAGE BODY gestionar_tema_estudiante
AS

------------Seleccionar promedo de los temas de los estudiantes
------------
PROCEDURE promedio_tema_for_estudiante(
        estudiante_id NUMBER,
        tema_id NUMBER,
        materia_id NUMBER,
        promedio OUT NUMBER)
IS
  COUNT_TEMAS_MATERIA NUMBER;
  COUNT_TEMAS_ESTUDIANTE_CAL NUMBER;
  
  
  BEGIN
          select count(*) into COUNT_TEMAS_MATERIA from temas where mat_id = materia_id;
          select count(*) into COUNT_TEMAS_ESTUDIANTE_CAL from (select distinct tem_id from tema_estudiante where mat_id = materia_id and EST_ID = estudiante_id);
          
         IF COUNT_TEMAS_MATERIA = COUNT_TEMAS_ESTUDIANTE_CAL THEN
          select avg(rel_tem_nota) into promedio from tema_estudiante where mat_id = materia_id and EST_ID = estudiante_id;
          update matricula set MATRI_NOT_FINAL = promedio where MAT_ID = materia_id;
          ELSE
          promedio := 0;
          END IF; 
     
     EXCEPTION
  WHEN NO_DATA_FOUND THEN
    promedio := 0;
  END promedio_tema_for_estudiante;

----------------------------------------------------------------

  PROCEDURE get_all_temas_estudiante(
      cursorTemaEstudiante OUT t_cursor)
  IS
  BEGIN
    OPEN cursorTemaEstudiante FOR SELECT * FROM TEMA_ESTUDIANTE;
  END get_all_temas_estudiante;
--------------------
  PROCEDURE insertar_tema_estudiante(
        estudiante_id       NUMBER,
        tema_id       NUMBER,
        materia_id       NUMBER,
        rel_tema_nota NUMBER,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO TEMA_ESTUDIANTE
      (
        REL_TEMA_ID,
        EST_ID,
        TEM_ID,
        MAT_ID,
        REL_TEM_NOTA
      )
      VALUES
      (
        Tema_estudiante_id_Seq.NEXTVAL ,
        estudiante_id       ,
        tema_id       ,
        materia_id       ,
        rel_tema_nota 
      );
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al insertar los  datos en la tabla tema estudiante: ' || sqlerrm);
END insertar_tema_estudiante;


PROCEDURE actualizar_tema_estudiante
  (
    rel_tema_est_id  NUMBER,
        estudiante_id       NUMBER,
        tema_id       NUMBER,
        materia_id       NUMBER,
        rel_tema_nota NUMBER,
        ejecuto OUT NUMBER
  )
IS
BEGIN
  UPDATE TEMA_ESTUDIANTE
  SET REL_TEMA_ID   = rel_tema_est_id,
    EST_ID          = estudiante_id,
    TEM_ID          = tema_id,
    MAT_ID          = materia_id,
    REL_TEM_NOTA    = rel_tema_nota
  WHERE REL_TEMA_ID = rel_tema_est_id;
  IF SQL%rowcount   > 0 THEN
    ejecuto        := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al actualizar datos de la tabla tema estudiante: ' || sqlerrm);
END actualizar_tema_estudiante;

PROCEDURE eliminar_tema_estudiante(
    rel_tema_est_id NUMBER,
    ejecuto OUT NUMBER)
IS
BEGIN
  DELETE FROM TEMA_ESTUDIANTE WHERE REL_TEMA_ID = rel_tema_est_id;
  IF SQL%rowcount > 0 THEN
    ejecuto      := 1;
  ELSE
    ejecuto := 0;
  END IF;
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  raise_application_error(-20100, 'Error al eliminar datos de la tabla tema estudiante: ' || sqlerrm);
END eliminar_tema_estudiante;

END gestionar_tema_estudiante;
