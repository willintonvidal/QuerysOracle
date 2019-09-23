create or replace package GestionarGrado as
type t_cursor is ref cursor;
procedure mostrarGrado(cursorGrado out t_cursor);
procedure insertarGrado(id_gra number, nombre_gra varchar2,  ejecuto out number);
procedure actualizarGrado(id_gra number, nombre_gra varchar2,  ejecuto out number);
procedure eliminarGrado(id_gra number, ejecuto out number);
end GestionarGrado;

create or replace package body GestionarGrado as
procedure mostrarGrado(cursorGrado out t_cursor)
is
begin
 open cursorGrado for select gra_id, gra_nombre from grado;
end mostrarGrado;


procedure insertarGrado(id_gra number, nombre_gra varchar2,  ejecuto out number)
is
begin
 insert into grado(gra_id, gra_nombre)
 values(Grado_id_Seq.NEXTVAL, nombre_gra);

 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos en la tabla grado  DE LA TABLA GRADO: '||SQLERRM);
end insertarGrado;

procedure actualizarGrado(id_gra number, nombre_gra varchar2,  ejecuto out number)
is
begin
 update grado set gra_nombre = nombre_gra where gra_id = id_gra;
 if sql%rowcount > 0 then
 ejecuto := 1;
  else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos DE LA TABLA GRADO: '||SQLERRM);
end actualizarGrado;


procedure eliminarGrado(id_gra number, ejecuto out number)
is
begin
 Delete from grado where gra_id = id_gra;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datos DE LA TABLA GRADO: '||SQLERRM);
end;
end GestionarGrado;