create or replace package GestionarRolEstudiante as

type tc_materia is ref cursor;
type tc_profesor is ref cursor;
type tc_centroEdu is ref cursor;
type tc_grado is ref cursor;
type tc_mateEstudiate is ref cursor;
type tc_temasMateria is ref cursor;
type tc_materialEstudio is ref cursor;
type tc_actividades is ref cursor;
type tc_materialEstTema is ref cursor;
type tc_materiaId is ref cursor;

procedure mostrarMate_a_matri(id_est NUMBER,cursor_materias out tc_materia);
procedure mostrarProfesor_por_materia(nombre_materia varchar2,cursor_profesores out tc_profesor);
procedure mostrarNombre_centro_educativo(cursor_nombre_centro out tc_centroEdu);
procedure mostrarNombreGrado (cursor_nombre_grado out tc_grado);
procedure mostrarMaterias_estudiate(id_est NUMBER,cursor_mateEstudiate out tc_mateEstudiate);
procedure mostrarTemas_de_materia(nombre_materia varchar2,cursor_temasMateria out tc_temasMateria);
procedure mostrarMaterial_de_estudio(nombre_materia varchar2,cursor_materialEstudio out tc_materialEstudio);
procedure mostrarActividades_del_tema(nombre_tema varchar2,cursor_actividades out tc_actividades);
procedure mostrarMaterial_e_tema(nombre_tema varchar2,cursor_materialEstTema out tc_materialEstTema);
procedure mostrarIdMateria(nombre_materia varchar2,cursor_IdMateria out tc_materiaId);

end GestionarRolEstudiante;

create or replace package body GestionarRolEstudiante as

procedure mostrarMate_a_matri(id_est NUMBER, cursor_materias out tc_materia)
is
begin
 open cursor_materias for 
   
   	select mate.mat_nombre, mate.mat_id
	from (select m.mat_id
	from materia m inner join grado gra on (m.GRA_ID=gra.GRA_ID) 
	where gra.gra_id=
	(select gra_id from grado g natural join estudiante e  where e.est_id=id_est)
	minus 
	select mat_id
	from matricula
	where est_id=id_est) sub  inner join materia mate on (mate.MAT_ID=sub.mat_id); 

end mostrarMate_a_matri;

procedure mostrarProfesor_por_materia(nombre_materia varchar2,cursor_profesores out tc_profesor)
is
begin
 open cursor_profesores for 
		select u.usu_nombres
		from profesor p inner join usuario u on (p.prof_id= u.usu_id) inner join materia m on (m.prof_id=p.prof_id)
		where m.MAT_NOMBRE=nombre_materia;

end mostrarProfesor_por_materia;


procedure mostrarNombre_centro_educativo(cursor_nombre_centro out tc_centroEdu)
is
begin
 open cursor_nombre_centro for 
	 select CEN_EDU_NOMBRE
	 from centro_educativo;

end mostrarNombre_centro_educativo;

procedure mostrarNombreGrado (cursor_nombre_grado out tc_grado)
is
begin
 open cursor_nombre_grado for 
   select GRA_NOMBRE
   from grado;
end mostrarNombreGrado;


procedure mostrarMaterias_estudiate(id_est NUMBER,cursor_mateEstudiate out tc_mateEstudiate)
is
begin
 open cursor_mateEstudiate for 
   select mt.mat_nombre, m.mat_id
   from estudiante e inner join matricula m on (e.est_id=m.est_id) inner join materia mt on (m.mat_id=mt.mat_id)
   where e.est_id= id_est
   order by mt.mat_nombre asc;

end mostrarMaterias_estudiate;


procedure mostrarTemas_de_materia(nombre_materia varchar2,cursor_temasMateria out tc_temasMateria)
is
begin
 open cursor_temasMateria for 
   select t.TEM_NOMBRE
   from temas t
   where t.MAT_ID=(select mat_id from materia where mat_nombre=nombre_materia);

end mostrarTemas_de_materia;


procedure mostrarMaterial_de_estudio(nombre_materia varchar2,cursor_materialEstudio out tc_materialEstudio)
is
begin
 open cursor_materialEstudio for 
	select t.TEM_NOMBRE, t.TEM_DESCRIPCION, t.TEM_MATERIAL_ARCHIVO, t.TEM_MATERIAL_VIDEO
	from temas t
	where t.MAT_ID=(select mat_id from materia where mat_nombre=nombre_materia);
end mostrarMaterial_de_estudio;


procedure mostrarActividades_del_tema(nombre_tema varchar2,cursor_actividades out tc_actividades)
is
begin
 open cursor_actividades for 
	select a.ACT_EVA_NOMBRE
	from ACTIVIDAD_EVALUATIVA a
	where a.TEM_ID=(select TEM_ID from TEMAS where TEM_NOMBRE=nombre_tema );
end mostrarActividades_del_tema;

procedure mostrarMaterial_e_tema(nombre_tema varchar2,cursor_materialEstTema out tc_materialEstTema)
is 
begin
open cursor_materialEstTema for
    select t.TEM_NOMBRE, t.TEM_DESCRIPCION, t.TEM_MATERIAL_ARCHIVO, t.TEM_MATERIAL_VIDEO
	from temas t
	where t.TEM_NOMBRE=nombre_tema;

end mostrarMaterial_e_tema;

procedure mostrarIdMateria(nombre_materia varchar2,cursor_IdMateria out tc_materiaId)
is BEGIN
OPEN cursor_IdMateria for 
	select MAT_ID
	from MATERIA
	where MAT_NOMBRE=nombre_materia;
end mostrarIdMateria;

end GestionarRolEstudiante;




