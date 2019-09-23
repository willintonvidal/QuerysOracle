Insert into CENTRO_EDUCATIVO (CEN_EDU_NIT,CEN_EDU_NOMBRE,CEN_EDU_CIUDAD,CEN_EDU_TELEFONO,CEN_EDU_DIRECCION) values ('1065','Timbio','Timbio','328564545','Calle 20 #12 c 78');
/*Insert into CENTRO_EDUCATIVO (CEN_EDU_NIT,CEN_EDU_NOMBRE,CEN_EDU_CIUDAD,CEN_EDU_TELEFONO,CEN_EDU_DIRECCION) values ('1066','Cristo Rey','Popayan','312','Calle 20');
Insert into CENTRO_EDUCATIVO (CEN_EDU_NIT,CEN_EDU_NOMBRE,CEN_EDU_CIUDAD,CEN_EDU_TELEFONO,CEN_EDU_DIRECCION) values ('1068','Industrial del norte','Popay�n','328454566','calle 10#34c67');
Insert into CENTRO_EDUCATIVO (CEN_EDU_NIT,CEN_EDU_NOMBRE,CEN_EDU_CIUDAD,CEN_EDU_TELEFONO,CEN_EDU_DIRECCION) values ('1067','Hermanas de Dios','Popay�n','314','calle 34#34c67');
*/

Insert into GRADO (GRA_ID,GRA_NOMBRE) values ('2','Segundo');

Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061777','1065','Cedula','Felipe','Cartago','Profesor','123456','Activo','felipe@gmail.com','24242',null);
/*
Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061774','1065','Tarjeta de identidad','Carmela','Perez','Estudiante','12345','Activo','carmela@gmail.com','312565678',null);
Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061775','1065','Tarjeta de identidad','Carlos','Lopez','Estudiante','12345','Activo','carlos@gmail.com','21325255',null);
Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061776','1065','Tarjeta de identidad','Andres','Mu�oz','Estudiante ','12345','Activo','andres@gmail.com','24353646',null);
Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061778','1065','Cedula','Juan','Perez','Profesor','123456','Activo','juan@gmail.com','24242424',null);
Insert into USUARIO (USU_ID,CEN_EDU_NIT,USU_TIPO_DOCUMENTO,USU_NOMBRES,USU_APELLIDOS,USU_TIPO_USUARIO,USU_CONTRASENIA,USU_ESTADO,USU_EMAIL,USU_TELEFONO,USU_FOTO) values ('1061779','1065','Cedula','Soraya','Vidal','Profesor','123456','Activo','soraya@gmail.com','3124565456',null);
*/

Insert into PROFESOR (PROF_ID,PROF_TITULO, PROF_EXPERIENCIA_LABORAL) values ('1061777','Matemático Puro', '2 años');
/*Insert into HOMESCHOOL.PROFESOR (PROF_ID,PROF_TITULO, PROF_EXPERIENCIA_LABORAL ) values ('1061778','Ingeniero civil', '1 año');
Insert into HOMESCHOOL.PROFESOR (PROF_ID,PROF_TITULO, PROF_EXPERIENCIA_LABORAL) values ('1061779','Licenciada en matemáticas', '2 años');*/

/*
Insert into HOMESCHOOL.ACUDIENTE (ACU_TIPO_IDENTIFICACION,ACU_NUMERO_IDENTIFICACION,ACU_NOMBRE_COMPLETO,ACU_EMAIL,ACU_TELEFONO) values ('Cedula','987','Paola Ruiz','paola@gmail.com','21345677788');
Insert into HOMESCHOOL.ACUDIENTE (ACU_TIPO_IDENTIFICACION,ACU_NUMERO_IDENTIFICACION,ACU_NOMBRE_COMPLETO,ACU_EMAIL,ACU_TELEFONO) values ('Cedula','988','Loren perez ','loren@gmail.com','121344');
Insert into HOMESCHOOL.ACUDIENTE (ACU_TIPO_IDENTIFICACION,ACU_NUMERO_IDENTIFICACION,ACU_NOMBRE_COMPLETO,ACU_EMAIL,ACU_TELEFONO) values ('Cedula','989','Carmelo Martinez','carmelo@gmail.com','231414');
Insert into HOMESCHOOL.ACUDIENTE (ACU_TIPO_IDENTIFICACION,ACU_NUMERO_IDENTIFICACION,ACU_NOMBRE_COMPLETO,ACU_EMAIL,ACU_TELEFONO) values ('Tarjeta de identidad','990','Calos Perez','carlos@gmail.com','1314');
*/
/*
Insert into HOMESCHOOL.ESTUDIANTE (EST_ID,ACU_NUMERO_IDENTIFICACION,GRA_ID) values ('1061774','987','2');
Insert into HOMESCHOOL.ESTUDIANTE (EST_ID,ACU_NUMERO_IDENTIFICACION,GRA_ID) values ('1061775','987','2');
Insert into HOMESCHOOL.ESTUDIANTE (EST_ID,ACU_NUMERO_IDENTIFICACION,GRA_ID) values ('1061776','988','2');

*/

insert into MATERIA (MAT_ID,MAT_NOMBRE,GRA_ID,PROF_ID) values ('1403','Matematicas','2','1061777');
insert into MATERIA (MAT_ID,MAT_NOMBRE,GRA_ID,PROF_ID) values ('1404','Español','2','1061777');
insert into MATERIA (MAT_ID,MAT_NOMBRE,GRA_ID,PROF_ID) values ('1405','Ingles','2','1061777');

/*
insert into MATRICULA (MATRI_ID,EST_ID,MAT_ID,MATRI_FECHA_INICIO, MATRI_FECHA_FIN,MATRI_ESTADO,MATRI_NOT_FINAL) values (Matri_id_Seq.NEXTVAL,'1061774','1404',SYSDATE,'12-03-2019', 'Activa','3,5');
insert into MATRICULA (MATRI_ID,EST_ID,MAT_ID,MATRI_FECHA_INICIO, MATRI_FECHA_FIN,MATRI_ESTADO,MATRI_NOT_FINAL) values (Matri_id_Seq.NEXTVAL,'1061775','1403',SYSDATE,'12-03-2019', 'Activa','2,5');
insert into MATRICULA (MATRI_ID,EST_ID,MAT_ID,MATRI_FECHA_INICIO, MATRI_FECHA_FIN,MATRI_ESTADO,MATRI_NOT_FINAL) values (Matri_id_Seq.NEXTVAL,'1061776','1403',SYSDATE,'12-03-2019', 'Activa','5,0');
*/

Insert into TEMAS (TEM_ID,MAT_ID,TEM_NOMBRE,TEM_DESCRIPCION,TEM_FOTO,TEM_MATERIAL_ARCHIVO,TEM_MATERIAL_VIDEO) values ('11334','1403','Lectura y escritura de números','Aprenderemos a sumar conjuntos',null,null,null);
Insert into TEMAS (TEM_ID,MAT_ID,TEM_NOMBRE,TEM_DESCRIPCION,TEM_FOTO,TEM_MATERIAL_ARCHIVO,TEM_MATERIAL_VIDEO) values ('11337','1403','Diferenciación','Aprenderemos  a sumar fraccionarios',null,null,null);
Insert into TEMAS (TEM_ID,MAT_ID,TEM_NOMBRE,TEM_DESCRIPCION,TEM_FOTO,TEM_MATERIAL_ARCHIVO,TEM_MATERIAL_VIDEO) values ('11338','1403','Operaciones básicas','Aprenderemos a restar fraccionarios',null,null,null);
Insert into TEMAS (TEM_ID,MAT_ID,TEM_NOMBRE,TEM_DESCRIPCION,TEM_FOTO,TEM_MATERIAL_ARCHIVO,TEM_MATERIAL_VIDEO) values ('11340','1403','Descomposición','Aprenderemos a descomponer números',null,null,null);

/*

Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1009','1061774','11334','1403','5');
Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1010','1061775','11334','1403','5');
Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1011','1061775','11334','1403','5');
Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1012','1061776','11334','1403','5');
Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1013','1061776','11335','1404','4');
Insert into HOMESCHOOL.TEMA_ESTUDIANTE (REL_TEMA_ID,EST_ID,TEM_ID,MAT_ID,REL_TEM_NOTA) values ('1014','1061776','11338','1403','4');
*/

Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54561','11337','1403','Diferenciar números',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Diferencias números',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54553','11340','1403','Descomposición de numeros sencilla',to_date('12/02/19','DD/MM/RR'),to_date('12/03/19','DD/MM/RR'),'Descomposición de numeros de dos cifras ',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54554','11340','1403','Descomposición de números básica',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Descomposición de numeros de dos cifras ',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54555','11340','1403','Descomposición de nmúeros intermedia',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Descomposición de numeros de dos cifras ',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54556','11334','1403','Lectura y escritura de números sencilla',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Lectura y escritura de números',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54557','11334','1403','Lectura y escritura de números intermedia',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Lectura y escritura de números',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54558','11334','1403','Lectura y escritura de números difícil ',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Lectura y escritura de números',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54559','11337','1403','Diferenciar objetos sencilla',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Diferencias objetos ',null);
Insert into ACTIVIDAD_EVALUATIVA (ACT_EVA_ID,TEM_ID,MAT_ID,ACT_EVA_NOMBRE,ACT_EVA_FECHA_INICIO,ACT_EVA_FECHA_FIN,ACT_EVA_OBSERVACION,ACT_EVA_FOTO) values ('54560','11337','1403','Diferenciar objetos intermedia',to_date('12/02/19','DD/MM/RR'),to_date('12/02/19','DD/MM/RR'),'Diferencias objetos ',null);
/*
Insert into HOMESCHOOL.ACTIVIDAD_ESTUDIANTE (REL_ACT_ID,EST_ID,ACT_EVA_ID,TEM_ID,MAT_ID,REL_ACT_NOTA) values ('99941','1061774','54545','11334','1403','5');
Insert into HOMESCHOOL.ACTIVIDAD_ESTUDIANTE (REL_ACT_ID,EST_ID,ACT_EVA_ID,TEM_ID,MAT_ID,REL_ACT_NOTA) values ('99942','1061776','54548','11339','1404','5');
Insert into HOMESCHOOL.ACTIVIDAD_ESTUDIANTE (REL_ACT_ID,EST_ID,ACT_EVA_ID,TEM_ID,MAT_ID,REL_ACT_NOTA) values ('99943','1061775','54549','11339','1404','5');
*/



