CREATE OR REPLACE PACKAGE GestionarUsuario
AS  type t_cursorIniciosesion IS ref CURSOR;
    

    PROCEDURE inicioSesion(
        usuario_id NUMBER,
        usuario_contrasenia VARCHAR2,
        cursorInicioSesion OUT t_cursorIniciosesion);
        
  END GestionarUsuario;
  
  
  /*Cuerpo del paquete */
CREATE OR REPLACE PACKAGE body GestionarUsuario
AS
  
PROCEDURE inicioSesion(
     usuario_id NUMBER,
        usuario_contrasenia VARCHAR2,
        cursorInicioSesion OUT t_cursorIniciosesion)
  IS
  BEGIN
    OPEN cursorInicioSesion FOR SELECT USU_ID,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO FROM USUARIO;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    cursorInicioSesion := null;
  END inicioSesion;

  PROCEDURE insertarUsuario
  (
        id_usu NUMBER,
        edu_nit_cen VARCHAR2,
        tipo_documento_usu VARCHAR2,
        nombres_usu VARCHAR2,
        apellidos_usu VARCHAR2,
        tipo_usuario_usu VARCHAR2,
        contrasenia_usu VARCHAR2,
        estado_usu VARCHAR2,
        email_usu VARCHAR2,
        telefono_usu VARCHAR2,
        foto_usu VARCHAR2,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    INSERT
    INTO usuario
      (
        usu_id ,
        cen_edu_nit,
        usu_tipo_documento,
        usu_nombres,
        usu_apellidos,
        usu_tipo_usuario ,
        usu_contrasenia ,
        usu_estado ,
        usu_email ,
        usu_telefono,
        usu_foto 
        
      )
      VALUES
    (
        id_usu,
        edu_nit_cen,
        tipo_documento_usu,
        nombres_usu,
        apellidos_usu,
        tipo_usuario_usu,
        contrasenia_usu,
        estado_usu,
        email_usu,
        telefono_usu,
        foto_usu
       );
        
    IF sql%rowcount > 0 THEN
      ejecuto      := 1;
    ELSE
      ejecuto := 0;
    END IF;
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos en la tabla usuario: '||SQLERRM);
  END insertarUsuario;
  
  PROCEDURE actualizarUsuario
    (
        id_usu NUMBER,
        edu_nit_cen VARCHAR2,
        tipo_documento_usu VARCHAR2,
        nombres_usu VARCHAR2,
        apellidos_usu VARCHAR2,
        tipo_usuario_usu VARCHAR2,
        contrasenia_usu VARCHAR2,
        estado_usu VARCHAR2,
        email_usu VARCHAR2,
        telefono_usu VARCHAR2,
        foto_usu VARCHAR2,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    UPDATE usuario
    SET cen_edu_nit = edu_nit_cen,
      usu_tipo_documento = tipo_documento_usu,
      usu_nombres      = nombres_usu,
      usu_apellidos = apellidos_usu,
      usu_tipo_usuario= tipo_usuario_usu,
      usu_contrasenia= contrasenia_usu,
      usu_estado= estado_usu,
      usu_email =email_usu,
      usu_telefono= telefono_usu,
      usu_foto= foto_usu
    WHERE usu_id = id_usu;
    IF sql%rowcount > 0 THEN
      ejecuto  := 1;
    ELSE
      ejecuto := 0;
    END IF;
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos en la tabla usuario: '||SQLERRM);
  END actualizarUsuario;
  
  PROCEDURE eliminarUsuario(
      id_usu VARCHAR2,
      ejecuto OUT NUMBER)
  IS
  BEGIN
    DELETE FROM usuario WHERE usu_id = id_usu;
    IF sql%rowcount > 0 THEN
      ejecuto      := 1;
    ELSE
      ejecuto := 0;
    END IF;
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datos en la tabla usuario '||SQLERRM);
  END;
  
  PROCEDURE buscarPorEmail(
         email VARCHAR2,
        pass OUT VARCHAR2)
  IS
  BEGIN
    SELECT USU_CONTRASENIA INTO pass FROM USUARIO WHERE USU_EMAIL = email; 
  COMMIT;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    pass := '0';
  END buscarPorEmail;
  
  PROCEDURE existePorId(
      id_usu NUMBER,
      ejecuto OUT NUMBER)
  IS
  X NUMBER;
  BEGIN
    SELECT USU_ID INTO X FROM USUARIO WHERE USU_ID = id_usu; 
    IF X=0 THEN
      ejecuto := 0;
      ELSE
      ejecuto := 1;
      END IF;
      
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    ejecuto := 0;
  END;
  
END GestionarUsuario;


DECLARE
V varchar2(20);
BEGIN
  GESTIONARUSUARIO.BUSCARPOREMAIL('carmela@gmail.com',V);
  DBMS_OUTPUT.PUT_LINE(V);
END;