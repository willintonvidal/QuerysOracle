/*ACTIVIDAD EVALUATIVA*/
create or replace
    package Gestionar_ActividadEvaluativa as
        type t_cursor is ref cursor;
        procedure getAllActividadEvaluativas(cursorActividadEvaluativa out t_cursor);
        procedure  insertar(ACT_EVA_ID NUMBER,TEM_ID NUMBER,MAT_ID NUMBER,ACT_EVA_NOMBRE VARCHAR2,ACT_EVA_FECHA_INICIO DATE,ACT_EVA_FIN DATE,ACT_EVA_ VARCHAR2,ACT_EVA_FOTO VARCHAR2,EJECUTO OUT NUMBER);
        procedure  actualizarActividadEvaluativa(ACT_EVA_ID NUMBER,TEM_ID NUMBER,MAT_ID NUMBER,ACT_EVA_NOMBRE VARCHAR2,ACT_EVA_FECHA_INICIO DATE,ACT_EVA_FIN DATE,ACT_EVA_ VARCHAR2,ACT_EVA_FOTO VARCHAR2,EJECUTO OUT NUMBER);
        procedure eliminarActividadEvaluativa(ACT_EVA_ID NUMBER, EJECUTO OUT NUMBER);
end Gestionar_ActividadEvaluativa;

CREATE OR REPLACE PACKAGE BODY Gestionar_ActividadEvaluativa AS

    PROCEDURE getAllActividadEvaluativas(cursorActividadEvaluativa OUT t_cursor) IS
    BEGIN
        OPEN cursorActividadEvaluativa FOR SELECT * FROM ACTIVIDAD_EVALUATIVA;
    END getAllActividadEvaluativas;
    
    --------------------
    
    PROCEDURE insertar(ACT_EVA_ID NUMBER,TEM_ID NUMBER,MAT_ID NUMBER,ACT_EVA_NOMBRE VARCHAR2,ACT_EVA_FECHA_INICIO DATE,ACT_EVA_FECHA_FIN DATE,ACT_EVA_ VARCHAR2,ACT_EVA_FOTO VARCHAR2,EJECUTO OUT NUMBER)
    IS BEGIN
        INSERT INTO ACTIVIDAD_EVALUATIVA (ACT_EVA_ID ,TEM_ID ,MAT_ID ,ACT_EVA_NOMBRE ,ACT_EVA_FECHA_INICIO ,ACT_EVA_FECHA_FIN ,ACT_EVA_ ,ACT_EVA_FOTO)
        VALUES (ACT_EVA_ID ,TEM_ID ,MAT_ID ,ACT_EVA_NOMBRE ,ACT_EVA_FECHA_INICIO ,ACT_EVA_FECHA_FIN ,ACT_EVA_ ,ACT_EVA_FOTO);
        
          IF SQL%rowcount > 0 THEN
            EJECUTO := 1;
                ELSE
                    EJECUTO := 0;
                END IF;

        COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20100, 'Error al insertar los  datos en la tabla tema actividad evaluativa: ' || sqlerrm);

        END insertar;
        
        
        
    PROCEDURE actualizarActividadEvaluativa(ACT_EVA_ID NUMBER,TEM_ID NUMBER,MAT_ID NUMBER,ACT_EVA_NOMBRE VARCHAR2,ACT_EVA_FECHA_INICIO DATE,ACT_EVA_FECHA_FIN DATE,ACT_EVA_ VARCHAR2,ACT_EVA_FOTO VARCHAR2,EJECUTO OUT NUMBER)
    IS 
        ACT_EVA_ID_ NUMBER;
        TEM_ID_ NUMBER;
        MAT_ID_ NUMBER;
        ACT_EVA_NOMBRE_ VARCHAR2;
        ACT_EVA_FECHA_INICIO_ DATE;
        ACT_EVA_FECHA_FIN_ DATE;
        ACT_EVA__ VARCHAR2;
        ACT_EVA_FOTO_ VARCHAR2;
        
    BEGIN
        
        ACT_EVA_ID_ := ACT_EVA_ID ;
        TEM_ID_ := TEM_ID;
        MAT_ID_ := MAT_ID;
        ACT_EVA_NOMBRE_ := ACT_EVA_NOMBRE;
        ACT_EVA_FECHA_INICIO_ := ACT_EVA_FECHA_INICIO;
        ACT_EVA_FECHA_FIN_ := ACT_EVA_FECHA_FIN;
        ACT_EVA__ := ACT_EVA_;
        ACT_EVA_FOTO_ := ACT_EVA_FOTO;
    
        UPDATE ACTIVIDAD_EVALUATIVA
        SET
        ACT_EVA_ID = ACT_EVA_ID_,
        TEM_ID  =  TEM_ID_,
        MAT_ID = MAT_ID,
        ACT_EVA_NOMBRE = ACT_EVA_NOMBRE,
        ACT_EVA_FECHA_INICIO = ACT_EVA_FECHA_INICIO,
        ACT_EVA_FECHA_FIN = ACT_EVA_FECHA_FIN,
        ACT_EVA_ = ACT_EVA__,
        ACT_EVA_FOTO = ACT_EVA_FOTO
        WHERE
            ACT_EVA_ID = ACT_EVA_ID_;
        
          IF SQL%rowcount > 0 THEN
            EJECUTO := 1;
                ELSE
                    EJECUTO := 0;
                END IF;

        COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20100, 'Error al actualizar datos de la tabla tema actividad evaluativa: ' || sqlerrm);

        END actualizarActividadEvaluativa;
        
        
     PROCEDURE eliminarActividadEvaluativa (ACT_EVA_ID NUMBER,EJECUTO OUT NUMBER)
    IS 
      ID_ NUMBER;
    BEGIN
        ID_ := ACT_EVA_ID;
        DELETE FROM ACTIVIDAD_EVALUATIVA 
        WHERE 
            ACT_EVA_ID = ID_;
        
          IF SQL%rowcount > 0 THEN
            EJECUTO := 1;
                ELSE
                    EJECUTO := 0;
                END IF;

        COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20100, 'Error al eliminar datos de la tabla actividad evaluativa: ' || sqlerrm);

        END eliminarActividadEvaluativa;
        
        

END Gestionar_ActividadEvaluativa;

