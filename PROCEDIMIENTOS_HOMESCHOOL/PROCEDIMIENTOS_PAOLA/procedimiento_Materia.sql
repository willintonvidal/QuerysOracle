create or replace
package GestionarMateria as
type t_cursor is ref cursor;
procedure mostrarMateria(cursorMateria out t_cursor);
procedure insertarMateria(id_mat number, nombre_mat varchar2, id_gra number,
id_prof number, ejecuto out number);
procedure actualizarMateria(id_mat number, nombre_mat varchar2, id_gra number,
id_prof number, ejecuto out number);
procedure eliminarMateria(id_mat number, ejecuto out number);
end GestionarMateria;

create or replace
package body GestionarMateria as
procedure mostrarMateria(cursorMateria out t_cursor)
is
begin
 open cursorMateria for select mat_id, mat_nombre, gra_id,
 prof_id from materia;
end mostrarMateria;


procedure insertarMateria(id_mat number, nombre_mat varchar2, id_gra number,
id_prof number, ejecuto out number)
is
begin
 insert into materia(mat_id, mat_nombre, gra_id, prof_id)
 values(id_mat, nombre_mat, id_gra, id_prof);

 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos en la tabla materia: '||SQLERRM);
end insertarMateria;

procedure actualizarMateria(id_mat number, nombre_mat varchar2, id_gra number,
id_prof number, ejecuto out number)
is
begin
 update materia set mat_nombre = nombre_mat, gra_id = id_gra,
 prof_id = id_prof where mat_id = id_mat;
 if sql%rowcount > 0 then
 ejecuto := 1;
  else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos en la tabla materia: '||SQLERRM);
end actualizarMateria;

procedure eliminarMateria(id_mat number, ejecuto out number)
is
begin
 Delete from materia where mat_id = id_mat;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datos en la tabla materia: '||SQLERRM);
end;
end GestionarMateria;



