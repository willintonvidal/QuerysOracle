/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     22/08/2019 2:14:25 p. m.                     */
/*==============================================================*/


alter table ACTIVIDAD_ESTUDIANTE
   drop constraint FK_ACTIVIDA_ACTIVIDAD_ACTIVIDA;

alter table ACTIVIDAD_ESTUDIANTE
   drop constraint FK_ACTIVIDA_ACTIVIDAD_ESTUDIAN;

alter table ACTIVIDAD_EVALUATIVA
   drop constraint FK_ACTIVIDA_TIENEN_TEMAS;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_ES_UN_USUARIO;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_RELATIONS_GRADO;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_RELATIONS_ACUDIENT;

alter table LOG_USUARIO
   drop constraint FK_LOG_USUA_GUARDA_USUARIO;

alter table MATERIA
   drop constraint FK_MATERIA_DICTA_PROFESOR;

alter table MATERIA
   drop constraint FK_MATERIA_RELATIONS_GRADO;

alter table MATRICULA
   drop constraint FK_MATRICUL_MATRICULA_MATERIA;

alter table MATRICULA
   drop constraint FK_MATRICUL_MATRICULA_ESTUDIAN;

alter table PROFESOR
   drop constraint FK_PROFESOR_ES_UN2_USUARIO;

alter table TEMAS
   drop constraint FK_TEMAS_RELATIONS_MATERIA;

alter table TEMA_ESTUDIANTE
   drop constraint FK_TEMA_EST_TEMA_ESTU_TEMAS;

alter table TEMA_ESTUDIANTE
   drop constraint FK_TEMA_EST_TEMA_ESTU_ESTUDIAN;

alter table USUARIO
   drop constraint FK_USUARIO_RELATIONS_CENTRO_E;

drop index ACTIVIDAD_ESTUDIANTE_FK;

drop index ACTIVIDAD_ESTUDIANTE2_FK;

drop table ACTIVIDAD_ESTUDIANTE cascade constraints;

drop index TIENEN_FK;

drop table ACTIVIDAD_EVALUATIVA cascade constraints;

drop table ACUDIENTE cascade constraints;

drop table CENTRO_EDUCATIVO cascade constraints;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_9_FK;

drop table ESTUDIANTE cascade constraints;

drop table GRADO cascade constraints;

drop index GUARDA_FK;

drop table LOG_USUARIO cascade constraints;

drop index RELATIONSHIP_8_FK;

drop index DICTA_FK;

drop table MATERIA cascade constraints;

drop index MATRICULA_FK;

drop index MATRICULA2_FK;

drop table MATRICULA cascade constraints;

drop table PROFESOR cascade constraints;

drop index RELATIONSHIP_7_FK;

drop table TEMAS cascade constraints;

drop index TEMA_ESTUDIANTE_FK;

drop index TEMA_ESTUDIANTE2_FK;

drop table TEMA_ESTUDIANTE cascade constraints;

drop index RELATIONSHIP_10_FK;

drop table USUARIO cascade constraints;

/*==============================================================*/
/* Table: ACTIVIDAD_ESTUDIANTE                                  */
/*==============================================================*/
create table ACTIVIDAD_ESTUDIANTE 
(
   REL_ACT_ID           NUMBER(10)           not null,
   EST_ID               NUMBER(15)           not null,
   ACT_EVA_ID           NUMBER(15)           not null,
   TEM_ID               NUMBER(30)           not null,
   MAT_ID               NUMBER(30)           not null,
   REL_ACT_NOTA         NUMBER               not null,
   constraint PK_ACTIVIDAD_ESTUDIANTE primary key (REL_ACT_ID)
);

/*==============================================================*/
/* Index: ACTIVIDAD_ESTUDIANTE2_FK                              */
/*==============================================================*/
create index ACTIVIDAD_ESTUDIANTE2_FK on ACTIVIDAD_ESTUDIANTE (
   EST_ID ASC
);

/*==============================================================*/
/* Index: ACTIVIDAD_ESTUDIANTE_FK                               */
/*==============================================================*/
create index ACTIVIDAD_ESTUDIANTE_FK on ACTIVIDAD_ESTUDIANTE (
   ACT_EVA_ID ASC,
   TEM_ID ASC,
   MAT_ID ASC
);

/*==============================================================*/
/* Table: ACTIVIDAD_EVALUATIVA                                  */
/*==============================================================*/
create table ACTIVIDAD_EVALUATIVA 
(
   ACT_EVA_ID           NUMBER(15)           not null,
   TEM_ID               NUMBER(30)           not null,
   MAT_ID               NUMBER(30)           not null,
   ACT_EVA_NOMBRE       VARCHAR2(50)         not null,
   ACT_EVA_FECHA_INICIO DATE                 not null,
   ACT_EVA_FECHA_FIN    DATE                 not null,
   ACT_EVA_OBSERVACION  VARCHAR2(200),
   ACT_EVA_FOTO         VARCHAR2(100),
   constraint PK_ACTIVIDAD_EVALUATIVA primary key (ACT_EVA_ID, TEM_ID, MAT_ID)
);

/*==============================================================*/
/* Index: TIENEN_FK                                             */
/*==============================================================*/
create index TIENEN_FK on ACTIVIDAD_EVALUATIVA (
   TEM_ID ASC,
   MAT_ID ASC
);

/*==============================================================*/
/* Table: ACUDIENTE                                             */
/*==============================================================*/
create table ACUDIENTE 
(
   ACU_TIPO_IDENTIFICACION VARCHAR2(30)               not null,
   ACU_NUMERO_IDENTIFICACION NUMBER(15)           not null,
   ACU_NOMBRE_COMPLETO        VARCHAR2(50)         not null,
   ACU_EMAIL            VARCHAR2(40)         not null,
   ACU_TELEFONO         VARCHAR2(20),
   constraint PK_ACUDIENTE primary key (ACU_NUMERO_IDENTIFICACION)
);

/*==============================================================*/
/* Table: CENTRO_EDUCATIVO                                      */
/*==============================================================*/
create table CENTRO_EDUCATIVO 
(
   CEN_EDU_NIT          VARCHAR2(30)           not null,
   CEN_EDU_NOMBRE       VARCHAR2(50)         not null,
   CEN_EDU_CIUDAD       VARCHAR2(30)         not null,
   CEN_EDU_TELEFONO     VARCHAR2(20)           not null,
   CEN_EDU_DIRECCION    VARCHAR2(50)         not null,
   constraint PK_CENTRO_EDUCATIVO primary key (CEN_EDU_NIT)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   EST_ID               NUMBER(15)           not null,
   ACU_NUMERO_IDENTIFICACION NUMBER(15)           not null,
   GRA_ID               NUMBER(20)           not null,
   constraint PK_ESTUDIANTE primary key (EST_ID)
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on ESTUDIANTE (
   ACU_NUMERO_IDENTIFICACION ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on ESTUDIANTE (
   GRA_ID ASC
);

/*==============================================================*/
/* Table: GRADO                                                 */
/*==============================================================*/
create table GRADO 
(
   GRA_ID               NUMBER(20)           not null,
   GRA_NOMBRE           VARCHAR2(30)         not null,
   constraint PK_GRADO primary key (GRA_ID)
);

/*==============================================================*/
/* Table: LOG_USUARIO                                           */
/*==============================================================*/
create table LOG_USUARIO 
(
   LOG_ID               NUMBER(10)           not null,
   LOG_TIPO_DOCUMENTO   VARCHAR2(10)         not null,
   LOG_NUMERO_DOCUMENTO NUMBER(15)           not null,
   LOG_FECHA_INICIO     DATE                 not null,
   LOG_FECHA_FIN        DATE                 not null,
   USU_ID               NUMBER(15)           not null,
   constraint PK_LOG_USUARIO primary key (LOG_ID)
);

/*==============================================================*/
/* Index: GUARDA_FK                                             */
/*==============================================================*/
create index GUARDA_FK on LOG_USUARIO (
   USU_ID ASC
);

/*==============================================================*/
/* Table: MATERIA                                               */
/*==============================================================*/
create table MATERIA 
(
   MAT_ID               NUMBER(30)           not null,
   MAT_NOMBRE           VARCHAR2(30)         not null,
   GRA_ID               NUMBER(20)           not null,
   PROF_ID              NUMBER(15)           not null,
   constraint PK_MATERIA primary key (MAT_ID)
);

/*==============================================================*/
/* Index: DICTA_FK                                              */
/*==============================================================*/
create index DICTA_FK on MATERIA (
   PROF_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on MATERIA (
   GRA_ID ASC
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA 
(
   MATRI_ID             NUMBER(10)           not null,
   EST_ID               NUMBER(15)           not null,
   MAT_ID               NUMBER(30)           not null,
   MATRI_FECHA_INICIO   DATE,
   MATRI_FECHA_FIN      DATE,
   MATRI_ESTADO         VARCHAR2(30),
   MATRI_NOT_FINAL      NUMBER,
   constraint PK_MATRICULA primary key (MATRI_ID)
);

/*==============================================================*/
/* Index: MATRICULA2_FK                                         */
/*==============================================================*/
create index MATRICULA2_FK on MATRICULA (
   EST_ID ASC
);

/*==============================================================*/
/* Index: MATRICULA_FK                                          */
/*==============================================================*/
create index MATRICULA_FK on MATRICULA (
   MAT_ID ASC
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR 
(
   PROF_ID              NUMBER(15)           not null,
   PROF_TITULO          VARCHAR2(50),
   PROF_EXPERIENCIA_LABORAL VARCHAR2(70),
   constraint PK_PROFESOR primary key (PROF_ID)
);

/*==============================================================*/
/* Table: TEMAS                                                 */
/*==============================================================*/
create table TEMAS 
(
   TEM_ID               NUMBER(30)           not null,
   MAT_ID               NUMBER(30)           not null,
   TEM_NOMBRE           VARCHAR2(100)         not null,
   TEM_DESCRIPCION      VARCHAR2(500),
   TEM_FOTO             VARCHAR2(50),
   TEM_MATERIAL_ARCHIVO VARCHAR2(100),
   TEM_MATERIAL_VIDEO   VARCHAR2(100),
   
   constraint PK_TEMAS primary key (TEM_ID, MAT_ID)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on TEMAS (
   MAT_ID ASC
);

/*==============================================================*/
/* Table: TEMA_ESTUDIANTE                                       */
/*==============================================================*/
create table TEMA_ESTUDIANTE 
(
   REL_TEMA_ID          NUMBER(10)           not null,
   EST_ID               NUMBER(15)           not null,
   TEM_ID               NUMBER(30)           not null,
   MAT_ID               NUMBER(30)           not null,
   REL_TEM_NOTA         NUMBER               not null,
   constraint PK_TEMA_ESTUDIANTE primary key (REL_TEMA_ID)
);

/*==============================================================*/
/* Index: TEMA_ESTUDIANTE2_FK                                   */
/*==============================================================*/
create index TEMA_ESTUDIANTE2_FK on TEMA_ESTUDIANTE (
   EST_ID ASC
);

/*==============================================================*/
/* Index: TEMA_ESTUDIANTE_FK                                    */
/*==============================================================*/
create index TEMA_ESTUDIANTE_FK on TEMA_ESTUDIANTE (
   TEM_ID ASC,
   MAT_ID ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   USU_ID               NUMBER(15)           not null,
   CEN_EDU_NIT          VARCHAR2(30)         not null,
   USU_TIPO_DOCUMENTO   VARCHAR2(30)         not null,
   USU_NOMBRES          VARCHAR2(30)         not null,
   USU_APELLIDOS        VARCHAR2(30)         not null,
   USU_TIPO_USUARIO     VARCHAR2(30)         not null,
   USU_CONTRASENIA      VARCHAR2(1000)         not null,
   USU_ESTADO           VARCHAR2(30),
   USU_EMAIL            VARCHAR2(40),
   USU_TELEFONO         VARCHAR2(20),
   USU_FOTO             VARCHAR2(60),
   constraint PK_USUARIO primary key (USU_ID)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on USUARIO (
   CEN_EDU_NIT ASC
);

alter table ACTIVIDAD_ESTUDIANTE
   add constraint FK_ACTIVIDA_ACTIVIDAD_ACTIVIDA foreign key (ACT_EVA_ID, TEM_ID, MAT_ID)
      references ACTIVIDAD_EVALUATIVA (ACT_EVA_ID, TEM_ID, MAT_ID);

alter table ACTIVIDAD_ESTUDIANTE
   add constraint FK_ACTIVIDA_ACTIVIDAD_ESTUDIAN foreign key (EST_ID)
      references ESTUDIANTE (EST_ID);

alter table ACTIVIDAD_EVALUATIVA
   add constraint FK_ACTIVIDA_TIENEN_TEMAS foreign key (TEM_ID, MAT_ID)
      references TEMAS (TEM_ID, MAT_ID);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_ES_UN_USUARIO foreign key (EST_ID)
      references USUARIO (USU_ID);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_RELATIONS_GRADO foreign key (GRA_ID)
      references GRADO (GRA_ID);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_RELATIONS_ACUDIENT foreign key (ACU_NUMERO_IDENTIFICACION)
      references ACUDIENTE (ACU_NUMERO_IDENTIFICACION);

alter table LOG_USUARIO
   add constraint FK_LOG_USUA_GUARDA_USUARIO foreign key (USU_ID)
      references USUARIO (USU_ID);

alter table MATERIA
   add constraint FK_MATERIA_DICTA_PROFESOR foreign key (PROF_ID)
      references PROFESOR (PROF_ID);

alter table MATERIA
   add constraint FK_MATERIA_RELATIONS_GRADO foreign key (GRA_ID)
      references GRADO (GRA_ID);

alter table MATRICULA
   add constraint FK_MATRICUL_MATRICULA_MATERIA foreign key (MAT_ID)
      references MATERIA (MAT_ID);

alter table MATRICULA
   add constraint FK_MATRICUL_MATRICULA_ESTUDIAN foreign key (EST_ID)
      references ESTUDIANTE (EST_ID);

alter table PROFESOR
   add constraint FK_PROFESOR_ES_UN2_USUARIO foreign key (PROF_ID)
      references USUARIO (USU_ID);

alter table TEMAS
   add constraint FK_TEMAS_RELATIONS_MATERIA foreign key (MAT_ID)
      references MATERIA (MAT_ID);

alter table TEMA_ESTUDIANTE
   add constraint FK_TEMA_EST_TEMA_ESTU_TEMAS foreign key (TEM_ID, MAT_ID)
      references TEMAS (TEM_ID, MAT_ID);

alter table TEMA_ESTUDIANTE
   add constraint FK_TEMA_EST_TEMA_ESTU_ESTUDIAN foreign key (EST_ID)
      references ESTUDIANTE (EST_ID);

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_CENTRO_E foreign key (CEN_EDU_NIT)
      references CENTRO_EDUCATIVO (CEN_EDU_NIT);

