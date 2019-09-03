create or replace
package GestionarMatricula as
type t_cursor is ref cursor;
procedure mostrarMatricula(cursorMateria out t_cursor);
procedure insertarMatricula(id_matri number, id_est number, id_mat number,
fecha_inicio_matri date,fecha_fin_matri date, estado_matri varchar2, not_final_matri number, ejecuto out number);
procedure actualizarMatricula(id_matri number, id_est number, id_mat number,
fecha_inicio_matri date,fecha_fin_matri date, estado_matri varchar2, not_final_matri number, ejecuto out number);
procedure eliminarMatricula(id_matri number, ejecuto out number);
end GestionarMatricula;

create or replace
package body GestionarMatricula as

procedure mostrarMatricula(cursorMateria out t_cursor)
is
begin
 open cursorMateria for select matri_id, est_id, mat_id,
matri_fecha_inicio, matri_fecha_fin, matri_estado, matri_not_final from matricula;
end mostrarMatricula;


procedure insertarMatricula(id_matri number, id_est number, id_mat number,
fecha_inicio_matri date,fecha_fin_matri date, estado_matri varchar2, not_final_matri number, ejecuto out number)
is
begin
 insert into matricula(matri_id, est_id, mat_id, matri_fecha_inicio, matri_fecha_fin, matri_estado, matri_not_final)
 values(id_matri, id_est, id_mat, fecha_inicio_matri, fecha_fin_matri, estado_matri, not_final_matri);

 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos: '||SQLERRM);
end insertarMatricula;


procedure actualizarMatricula(id_matri number, id_est number, id_mat number,
fecha_inicio_matri date,fecha_fin_matri date, estado_matri varchar2, not_final_matri number, ejecuto out number)
is
begin
 update matricula set est_id = id_est, mat_id = id_mat, matri_fecha_inicio=fecha_inicio_matri, matri_fecha_fin=fecha_fin_matri,
 matri_estado=estado_matri, matri_not_final=not_final_matri where matri_id = id_matri;
 if sql%rowcount > 0 then
 ejecuto := 1;
  else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos: '||SQLERRM);
end actualizarMatricula;

procedure eliminarMatricula(id_matri number, ejecuto out number)
is
begin
 Delete from matricula where matri_id = id_matri;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datos: '||SQLERRM);
end;
end GestionarMatricula;