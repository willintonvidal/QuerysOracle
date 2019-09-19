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
type tc_infoEstProfe is ref cursor;
type tc_infoEst1Profe is ref cursor;


procedure mostrarMate_a_matri(id_est NUMBER,cursor_materias out tc_materia);
procedure mostrarProfesor_por_materia(nombre_materia varchar2,cursor_profesores out tc_profesor);
procedure mostrarNombre_centro_educativo(cursor_nombre_centro out tc_centroEdu);
procedure mostrarNombreGrado (cursor_nombre_grado out tc_grado);
procedure mostrarMaterias_estudiate(id_est NUMBER,cursor_mateEstudiate out tc_mateEstudiate);
procedure mostrarTemas_de_materia(nombre_materia varchar2,cursor_temasMateria out tc_temasMateria);
procedure mostrarMaterial_de_estudio(nombre_materia varchar2,cursor_materialEstudio out tc_materialEstudio);
procedure mostrarActividades_del_tema(id_tema NUMBER,cursor_actividades out tc_actividades);
procedure mostrarMaterial_e_tema(id_tema NUMBER,cursor_materialEstTema out tc_materialEstTema);
procedure mostrarIdMateria(nombre_materia varchar2,cursor_IdMateria out tc_materiaId);
procedure mostrarNotaMateria_est(id_profesor NUMBER,cursor_nota_mat out tc_infoEstProfe);
procedure mostrarNotaTema_est(id_profesor NUMBER,cursor_not_tem out tc_infoEst1Profe);

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
   select t.TEM_NOMBRE,t.TEM_ID
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


procedure mostrarActividades_del_tema(id_tema NUMBER,cursor_actividades out tc_actividades)
is
begin
 open cursor_actividades for 
	select a.ACT_EVA_NOMBRE, a.ACT_EVA_ID
	from ACTIVIDAD_EVALUATIVA a
	where a.TEM_ID=(select TEM_ID from TEMAS where TEM_ID=id_tema );
end mostrarActividades_del_tema;

procedure mostrarMaterial_e_tema(id_tema number,cursor_materialEstTema out tc_materialEstTema)
is 
begin
open cursor_materialEstTema for
    select t.tem_id, t.TEM_NOMBRE, t.TEM_DESCRIPCION, t.TEM_MATERIAL_ARCHIVO, t.TEM_MATERIAL_VIDEO
	from temas t
	where t.TEM_ID=id_tema;

end mostrarMaterial_e_tema;

procedure mostrarIdMateria(nombre_materia varchar2,cursor_IdMateria out tc_materiaId)
is BEGIN
OPEN cursor_IdMateria for 
	select MAT_ID
	from MATERIA
	where MAT_NOMBRE=nombre_materia;
end mostrarIdMateria;

procedure mostrarNotaMateria_est(id_profesor NUMBER,cursor_nota_mat out tc_infoEstProfe)
is BEGIN
OPEN cursor_nota_mat for 
select u.USU_TIPO_DOCUMENTO, u.USU_ID, u.USU_NOMBRES, u.USU_APELLIDOS, mat.MAT_NOMBRE, mt.MATRI_NOT_FINAL, mt.MATRI_FECHA_INICIO, mt.MATRI_FECHA_FIN, a.ACU_NOMBRE_COMPLETO
from usuario u inner join estudiante e on (u.usu_id=e.EST_ID) inner join acudiente a on (e.ACU_NUMERO_IDENTIFICACION=a.ACU_NUMERO_IDENTIFICACION)inner join matricula mt on (mt.EST_ID=e.EST_ID) inner join materia mat on (mat.MAT_ID=mt.MAT_ID) inner join profesor p on (p.PROF_ID=mat.PROF_ID)
where p.PROF_ID=id_profesor;

end mostrarNotaMateria_est;

procedure mostrarNotaTema_est(id_profesor NUMBER,cursor_not_tem out tc_infoEst1Profe)
is BEGIN
OPEN cursor_not_tem for 
select u.USU_TIPO_DOCUMENTO, u.USU_ID, u.USU_NOMBRES, u.USU_APELLIDOS, mat.MAT_NOMBRE, mt.MATRI_NOT_FINAL, mt.MATRI_FECHA_INICIO, mt.MATRI_FECHA_FIN, te.tem_nombre, tes.REL_TEM_NOTA,  a.ACU_NOMBRE_COMPLETO
from usuario u inner join estudiante e on (u.usu_id=e.EST_ID) inner join acudiente a on (e.ACU_NUMERO_IDENTIFICACION=a.ACU_NUMERO_IDENTIFICACION)inner join matricula mt on (mt.EST_ID=e.EST_ID) inner join materia mat on (mat.MAT_ID=mt.MAT_ID) inner join profesor p on (p.PROF_ID=mat.PROF_ID) inner join temas te on (mat.MAT_ID=te.MAT_ID) inner join TEMA_ESTUDIANTE tes on (te.TEM_ID= tes.TEM_ID)
where p.PROF_ID=id_profesor;

end mostrarNotaTema_est;

end GestionarRolEstudiante;