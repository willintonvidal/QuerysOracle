CREATE OR REPLACE PACKAGE GestionarUsuario
AS type t_cursorUsuario IS ref CURSOR;
   type t_cursorIniciosesion IS ref CURSOR;
   type t_cursorUsuariosNo IS ref CURSOR;
   type t_cursor_datos_envio_contra IS ref CURSOR;
   type t_cursor_datos_pass IS ref CURSOR;
   
    PROCEDURE mostrarUsuario(
        cursorUsuario OUT t_cursorUsuario);
        
    PROCEDURE datospass(
         usuario_id NUMBER,
        cursorDatospass OUT t_cursor_datos_pass);

    PROCEDURE datos_envio_contrasenia(
            usuario_id NUMBER,
            cursorDatos_envio_ OUT t_cursor_datos_envio_contra);
            
    PROCEDURE usuariosNoValidados(
        cursorUsuarioNoValid OUT t_cursorUsuariosNo);
        
    PROCEDURE inicioSesion(
        usuario_id NUMBER,
        usuario_contrasenia VARCHAR2,
        cursorInicioSesion OUT t_cursorIniciosesion);
        
PROCEDURE validarUsuarios(
        usuario_id NUMBER,
        ejecuto OUT NUMBER);
        
        PROCEDURE buscarRole(
        usuario_id NUMBER,
        tipo_role OUT VARCHAR2);
        
    PROCEDURE insertarUsuario(
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
        ejecuto OUT NUMBER);
      
    PROCEDURE actualizarUsuario(
        id_usu NUMBER,
        tipo_documento_usu VARCHAR2,
        nombres_usu VARCHAR2,
        apellidos_usu VARCHAR2,
        tipo_usuario_usu VARCHAR2,
        estado_usu VARCHAR2,
        email_usu VARCHAR2,
        telefono_usu VARCHAR2,
        foto_usu VARCHAR2,
        ejecuto OUT NUMBER);
        
    PROCEDURE eliminarUsuario(
         id_usu VARCHAR2,
        ejecuto OUT NUMBER);
    
    PROCEDURE existePorId(
         id_usu NUMBER,
        ejecuto OUT NUMBER);
    PROCEDURE buscarPorEmail(
         email VARCHAR2,
        pass OUT VARCHAR2);
     ---ESTO FUE LO QUE HICE NUEVO EN ESTE PROCEDIMIENTO   
  END GestionarUsuario;
  
  
  /*Cuerpo del paquete */
CREATE OR REPLACE PACKAGE body GestionarUsuario
AS
  PROCEDURE mostrarUsuario(
      cursorUsuario OUT t_cursorUsuario)
  IS
  BEGIN
    OPEN cursorUsuario FOR SELECT * FROM usuario;
  END mostrarUsuario;

PROCEDURE usuariosNoValidados(
      cursorUsuarioNoValid OUT t_cursorUsuariosNo)
      
  IS
  BEGIN
    OPEN cursorUsuarioNoValid FOR SELECT * FROM USUARIO WHERE USU_ESTADO != 'VALIDADO';
  END usuariosNoValidados;
  
  ----------------------------
  -----------Mostrar datos pass------------------
  
  PROCEDURE datospass(
         usuario_id NUMBER,
        cursorDatospass OUT t_cursor_datos_pass)
  IS
  BEGIN
    OPEN  cursorDatospass FOR SELECT USU_NOMBRES,USU_EMAIL,QB_ENCRIPCION.FB_DESCENCRIPTAR(USU_CONTRASENIA) 
    FROM usuario WHERE USU_ID = usuario_id;
  END datospass;

  
  
  -------------------------------------------------------------------------------
  ----------------------------------------------------

PROCEDURE inicioSesion(
     usuario_id NUMBER,
        usuario_contrasenia VARCHAR2,
        cursorInicioSesion OUT t_cursorIniciosesion)
  IS
  contra_cifrada varchar(2000);
  BEGIN
    contra_cifrada := UTL_RAW.CAST_TO_VARCHAR2(UTL_RAW.CAST_TO_RAW( QB_ENCRIPCION.FB_ENCRIPTAR(usuario_contrasenia)));
    
    OPEN cursorInicioSesion FOR SELECT USU_ID,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO,USU_TIPO_DOCUMENTO
        FROM USUARIO WHERE USU_ID = usuario_id AND USU_CONTRASENIA = contra_cifrada;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    cursorInicioSesion := null;
  END inicioSesion;

----------------------------------------
----------envio contraseña--------------
----------------------------------------
PROCEDURE datos_envio_contrasenia(
            usuario_id NUMBER,
            cursorDatos_envio_ OUT t_cursor_datos_envio_contra)
  IS
  contra_cifrada varchar(2000);
  BEGIN
    --contra_cifrada := UTL_RAW.CAST_TO_VARCHAR2(UTL_RAW.CAST_TO_RAW( QB_ENCRIPCION.FB_ENCRIPTAR(usuario_contrasenia)));
    
    OPEN cursorDatos_envio_ FOR SELECT USU_ID,USU_NOMBRES,USU_APELLIDOS,USU_EMAIL,USU_CONTRASENIA
        FROM USUARIO WHERE USU_ID = usuario_id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    cursorDatos_envio_ := null;
  END datos_envio_contrasenia;
----------------------------------------
----------envio contraseña--------------
----------------------------------------
  
  PROCEDURE validarUsuarios(
        usuario_id NUMBER,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    UPDATE usuario
    SET USU_ESTADO = 'VALIDADO'
      
    WHERE USU_ID = usuario_id;
    IF sql%rowcount > 0 THEN
      ejecuto  := 1;
    ELSE
      ejecuto := 0;
    END IF;
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20100, 'Error al vaidar al usuario '||SQLERRM);
  END validarUsuarios;
  
  --------------------------------
  -------BUSCAR ROLE--------------
  --------------------------------
  PROCEDURE buscarRole(
        usuario_id NUMBER,
        tipo_role OUT VARCHAR2)
  IS
  BEGIN
      SELECT USU_TIPO_USUARIO INTO tipo_role FROM USUARIO WHERE USU_ID = usuario_id;
    COMMIT;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
    tipo_role := '0';
  END buscarRole;
  
  --------------------------------
  -------BUSCAR ROLE--------------
  --------------------------------

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
    contra_cifrada varchar2(2000);
  BEGIN
    contra_cifrada := UTL_RAW.CAST_TO_VARCHAR2(UTL_RAW.CAST_TO_RAW( QB_ENCRIPCION.FB_ENCRIPTAR(contrasenia_usu)));
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
        contra_cifrada,
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
        tipo_documento_usu VARCHAR2,
        nombres_usu VARCHAR2,
        apellidos_usu VARCHAR2,
        tipo_usuario_usu VARCHAR2,
        estado_usu VARCHAR2,
        email_usu VARCHAR2,
        telefono_usu VARCHAR2,
        foto_usu VARCHAR2,
        ejecuto OUT NUMBER)
  IS
  BEGIN
    UPDATE usuario
    SET 
      usu_tipo_documento = tipo_documento_usu,
      usu_nombres      = nombres_usu,
      usu_apellidos = apellidos_usu,
      usu_tipo_usuario= tipo_usuario_usu,
      usu_estado= estado_usu,
      usu_email = email_usu,
      usu_telefono = telefono_usu,
      usu_foto = foto_usu
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
    pass := 'NO_DATA_FOUND';
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

