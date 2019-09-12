CREATE OR REPLACE PACKAGE packete_inicio_sesion
AS
type t_cursor
IS
  ref
  CURSOR;    
    
    PROCEDURE INICIO_SESION(
        usuario_id       NUMBER,
        usuario_contrasenia    VARCHAR2,
        cursorDatosInicioSesion OUT t_cursor);
        
    
        
        
        
  END packete_inicio_sesion;
  
  
  CREATE OR REPLACE PACKAGE BODY packete_inicio_sesion
AS
  PROCEDURE INICIO_SESION (
        usuario_id       NUMBER,
        usuario_contrasenia    VARCHAR2,
        cursorDatosInicioSesion OUT t_cursor)
  IS
     
  BEGIN
  
  OPEN cursorDatosInicioSesion for  SELECT USU_NOMBRES FROM USUARIO WHERE USU_ID = usuario_id AND USU_CONTRASENIA = usuario_contrasenia;
 
COMMIT;
END INICIO_SESION;

END packete_inicio_sesion;

  
  
  
  
  
  
  
  
  
  