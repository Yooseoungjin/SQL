--SELECT EMPNO AS 직원번호 , job AS 직무,ename AS 성명, deptno AS 소속부점,sal+comm AS 받은돈
--FROM EMP
--
--ORDER BY sal+comm desc;

SELECT round(dbms_random.value()*100,0) 난수 FROM dual;

SELECT * FROM dept ;

SELECT * FROM EMP ;

SELECT * FROM emp WHERE sal<(SELECT max(sal) FROM emp);


SELECT empno,ename,sal,deptno,job FROM emp WHERE job ='CLERK'
UNION
SELECT empno,ename,sal,deptno,job FROM emp WHERE job ='SALESMAN';

SELECT * FROM V$SQLFN_METADATA;

SELECT empno,ename,sal,deptno,job FROM emp WHERE ENAME LIKE '%S%';

SELECT * FROM NLS_DATABASE_PARAMETERS
WHERE PARAMETER = 'NLS_CHARACTERSET';


CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;

SELECT * FROM BONUS;

