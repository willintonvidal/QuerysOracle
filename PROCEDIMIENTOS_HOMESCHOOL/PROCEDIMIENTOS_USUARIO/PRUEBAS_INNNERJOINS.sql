SELECT G.GRA_ID,G.GRA_NOMBRE FROM PROFESOR P INNER JOIN MATERIA M ON(P.PROF_ID = M.PROF_ID) INNER JOIN GRADO G ON(M.GRA_ID = G.GRA_ID) WHERE P.PROF_ID = 1061777;


--select count(*) TOTAL_EMPLE, j.JOB_TITLE 
--from employees e inner join JOBS j on(j.JOB_ID = e.JOB_ID) GROUP BY j.JOB_TITLE;
--3. Sacar el trabajo con mas empleados = 30
--select max(TOTAL_EMPLE)MAX_EMPLEADO FROM (select count(*) TOTAL_EMPLE, j.JOB_TITLE from 
--employees e inner join JOBS j on(j.JOB_ID = e.JOB_ID) GROUP BY j.JOB_TITLE) JOBS_TOTAL;