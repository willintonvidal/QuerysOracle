select * from  CENTRO_EDUCATIVO;

DECLARE 
    V NUMBER;
BEGIN
    eliminar(2,V);
    DBMS_OUTPUT.put_line(v);
END;

DECLARE 
    NIT NUMBER;
    NOMBRE VARCHAR2(40);
    CIUDAD VARCHAR2(40);
    TELEFONO NUMBER;
    DIRECCION VARCHAR2;
BEGIN
    eliminar(2,V);
    DBMS_OUTPUT.put_line(v);
END;




create or replace PROCEDURE eliminar (CEN_EDU_NIT NUMBER,EJECUTO OUT NUMBER)
    IS 
      NIT NUMBER;
    BEGIN
      NIT :=CEN_EDU_NIT;
        DELETE FROM CENTRO_EDUCATIVO WHERE CEN_EDU_NIT = NIT;
        
          IF SQL%rowcount > 0 THEN
            EJECUTO := 1;
                ELSE
                    EJECUTO := 0;
                END IF;

        COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20100, 'Error al eliminar datos de la institución institución: ' || sqlerrm);

        END eliminar;





