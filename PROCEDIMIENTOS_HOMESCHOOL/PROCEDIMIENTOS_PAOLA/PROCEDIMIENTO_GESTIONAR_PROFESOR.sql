create or replace
package GestionarProfesor as
type t_cursorProfesor is ref cursor;
type t_curProfesorAsignadoPorCur is ref cursor;

procedure mostrarProfesor(cursorProfesor out t_cursorProfesor);
procedure mostrarCursosAsignados(profesor_id NUMBER,cursorCurAsignados out t_curProfesorAsignadoPorCur);

procedure insertarProfesor(id_prof number, titulo_prof varchar2, experiencia_laboral_prof varchar2,
ejecuto out number);
procedure actualizarProfesor(id_prof number, titulo_prof varchar2, experiencia_laboral_prof varchar2,
ejecuto out number);
procedure eliminarProfesor(id_prof number, ejecuto out number);
end GestionarProfesor;


create or replace
package body GestionarProfesor as
procedure mostrarProfesor(cursorProfesor out t_cursorProfesor)
is
begin
 open cursorProfesor for select prof_id, prof_titulo, prof_experiencia_laboral
from profesor;
end mostrarProfesor;

--NUEVO CURSOR QUE DEVUELVE LOS GRADOS AL CUAL ESTA ASIGNADO UN PROFESOR
procedure mostrarCursosAsignados(profesor_id NUMBER,cursorCurAsignados out t_curProfesorAsignadoPorCur)
is
begin
 open cursorCurAsignados for SELECT G.GRA_ID,G.GRA_NOMBRE FROM PROFESOR P 
 INNER JOIN MATERIA M ON(P.PROF_ID = M.PROF_ID) INNER JOIN GRADO G ON(M.GRA_ID = G.GRA_ID) WHERE P.PROF_ID = profesor_id;
end mostrarCursosAsignados;


procedure insertarProfesor(id_prof number, titulo_prof varchar2, experiencia_laboral_prof varchar2,
ejecuto out number)
is
begin
 insert into profesor(prof_id, prof_titulo, prof_experiencia_laboral)
 values(id_prof, titulo_prof, experiencia_laboral_prof);

 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al insertar datos en la tabla profesor: '||SQLERRM);
end insertarProfesor;


procedure actualizarProfesor(id_prof number, titulo_prof varchar2, experiencia_laboral_prof varchar2,
ejecuto out number)
is
begin
 update profesor set prof_titulo = titulo_prof, prof_experiencia_laboral = experiencia_laboral_prof
  where prof_id = id_prof;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar datos de la tabla profesor: '||SQLERRM);
end actualizarProfesor;


procedure eliminarProfesor(id_prof number, ejecuto out number)
is
begin
 Delete from profesor where prof_id = id_prof;
 if sql%rowcount > 0 then
 ejecuto := 1;
 else
 ejecuto := 0;
 end if;
 commit;
 Exception
 when others then
 RAISE_APPLICATION_ERROR(-20100, 'Error al Eliminar datosde la tabla profesor : '||SQLERRM);
end;

end GestionarProfesor;