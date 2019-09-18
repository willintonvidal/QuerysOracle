create or replace
package GestionarTema as
type t_cursor is ref cursor;
procedure mostrarTema(cursorTema out t_cursor);
procedure insertarTema(id_tem number, id_mat number, nombre_tem varchar2, descripcion_tem varchar2,
foto_tem varchar2, material_archivo_tem varchar2, material_video_tem varchar2, ejecuto out number);
procedure actualizarTema(id_tem number, id_mat number, nombre_tem varchar2, descripcion_tem varchar2,
foto_tem varchar2, material_archivo_tem varchar2, material_video_tem varchar2, ejecuto out number);
procedure eliminarTema(id_tem number, ejecuto out number);
end GestionarTema;

create or replace
package body GestionarTema as
procedure mostrarTema(cursorTema out t_cursor)
is
begin
 open cursorTema for select tem_id, mat_id, tem_nombre,
 tem_descripcion, tem_foto, tem_material_archivo, tem_material_video from temas;
end mostrarTema;

procedure insertarTema(id_tem number, id_mat number, nombre_tem varchar2, descripcion_tem varchar2,
foto_tem varchar2, material_archivo_tem varchar2, material_video_tem varchar2, ejecuto out number)
is
begin
 insert into temas (tem_id, mat_id, tem_nombre,tem_descripcion, tem_foto, tem_material_archivo, tem_material_video)
 values(id_tem, id_mat, nombre_tem,descripcion_tem, foto_tem, material_archivo_tem, material_video_tem );

 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos de la tabla temas: '||SQLERRM);
end insertarTema;

procedure actualizarTema(id_tem number, id_mat number, nombre_tem varchar2, descripcion_tem varchar2,
foto_tem varchar2, material_archivo_tem varchar2, material_video_tem varchar2, ejecuto out number)
is
begin
 update temas set mat_id = id_mat, tem_nombre = nombre_tem,
 tem_descripcion = descripcion_tem, tem_foto=foto_tem, tem_material_archivo=material_archivo_tem,  tem_material_video=material_video_tem where tem_id = id_tem;
 if sql%rowcount > 0 then
 ejecuto := 1;
  else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos de la tabla temas: '||SQLERRM);
end actualizarTema;


procedure eliminarTema(id_tem number, ejecuto out number)
is
begin
 Delete from temas where tem_id = id_tem;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datos de la tabla temas: '||SQLERRM);
end;
end GestionarTema;