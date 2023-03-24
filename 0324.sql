SELECT *
from(SELECT DEPTNO
,max(decode(job,'CLERK',SAL)) AS "clerk"
,max(decode(job,'SALESMAN',SAL)) AS "sales"
,max(decode(job,'PRESIDENT',SAL)) AS "presi"
,max(decode(job,'MANAGER',SAL)) AS "man"
,max(decode(job,'ANALYST',SAL)) AS "ana"
FROM EMP
GROUP BY DEPTNO 
ORDER BY DEPTNO)
UNPIVOT(SAL FOR JOB IN("clerk","sales","presi","man","ana"))
ORDER BY DEPTNO ,JOB

CREATE TABLE ....AS--..테이블이름
();

CREATE VIEW ....AS


SELECT *
 FROM vw_emp_details
 ;
 
/*inner_join 1:1 관계로 테이블간 연결을 통해 추가 정보를 제공하는 목적이 대부분*/
SELECT *
FROM vw_emp_details
;

/*JOIN...ON 구문 : 두개의 테이블의 컬럼을 연결*/
SELECT *
FROM EMP e JOIN dept D
ON e.DEPTNO = d.DEPTNO 
;

SELECT e.empno
	  ,e.ENAME 
	  ,e.JOB 
	  ,e.HIREDATE 
	  ,e.SAL 
	  ,d.DEPTNO 
	  ,d.DNAME
	  ,d.LOC 
FROM EMP e JOIN DEPT d 
on e.DEPTNO=d.DEPTNO 
ORDER BY d.DEPTNO ,e.EMPNO 

/*SAL 구간을 이용하여 해당 구간에 해당되는 직원을 연결(1:1 관계)*/
WITH EMP_SAL AS (SELECT e.empno
				  ,e.ENAME
				  ,S.GRADE 
				  ,e.JOB 
				  ,e.HIREDATE 
				  ,e.SAL 
				  ,S.LOSAL 
				  ,S.HISAL 
			FROM EMP e ,SALGRADE s 
			WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL )
	,EMP_DEPT AS (SELECT e.empno
				  ,e.ENAME 
				  ,e.JOB 
				  ,e.HIREDATE 
				  ,e.SAL 
				  ,d.DEPTNO 
				  ,d.DNAME
				  ,d.LOC 
			FROM EMP e JOIN DEPT d 
			on e.DEPTNO=d.DEPTNO 
			ORDER BY d.DEPTNO ,e.EMPNO )
	
SELECT *
FROM EMP_SAL,EMP_DEPT;

/*SELF-JOIN :하나의 테이블에 성질이 동일한 2개 이상의 컬럼의 관계를 이용하여
원하는 레코드의 관계를 산출하고 싶은 경우 사용
EMP 테이블 : EMPNO 사번과 MGR 상사 사번(동일한 사번)*/

ALTER TABLE EMP DROP COLUMN TEST1;

SELECT *
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO --EMP 테이블에 사번의 이름은 있으나

SELECT E1.EMPNO
	   E1.
FROM EMP E1 LEFT JOIN EMP E2
	ON E1.MGR = E2.EMPNO
;

SELECT 
FROM EMP E1
,DEPT D
,SALGRADE s 
,EMP E2
WHERE 

SELECT 
FROM EMP E1 RIGHT JOIN DEPT D
	ON E1.DEPTNO = D.DEPTNO 
	LEFT JOIN SALGRADE s 
	ON E1.SAL BETWEEN S.LOSAL AND S.HISAL 
	LEFT JOIN EMP E2
	ON E1.EGR = E2.EMPNO
;

/*서브 쿼리 (쿼리 문에사용되는 쿼리)
서브 쿼리 결과 :단일 값 출력, 다중행(하나의 컬럼에 행 배열)
			다중열(두 개이상의 컬럼별 행 배열)*/

SELECT DEPTNO,MAX(SAL)
FROM EMP
GROUP BY DEPTNO

SELECT *
 FROM EMP
  WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MIN(SAL)
FROM EMP
GROUP BY DEPTNO)

/*
CREATE TABLE :테이블 구조/형태를 신규로 생성
기존 동일한 테이블 이름이 있는 경우, 에러발생
DROP TABLE...을 통해 삭제후 재생성 필요
*/

DROP TABLE EMP_NEW 
;

CREATE TABLE EMP_NEW
(
	 EMPNO NUMBER(4)
	,ENAME VARCHAR2(10)
	,JOB VARCHAR2(9)
	,MGR NUMBER(4)
	,HIREDATE DATE
	,SAL NUMBER(7,2)
	,COMM NUMBER(7,2)
	,DEPTNO NUMBER(4)
	)
	
	
ALTER TABLE EMP_NEW ADD TEL VARCHAR2(20)

SELECT * FROM EMP_NEW_RENAMED

ALTER TABLE EMP_NEW MODIFY EMPNO NUMBER(5)

COMMIT

ALTER TABLE EMP_NEW DROP COLUMN TEL

--테이블명 변경
ALTER TABLE EMP_NEW RENAME TO EMP_NEW_RENAMED


/*시퀀스 생성
필요한 일련번호를 만들어 사용하거나 , 일련번호를 PK로 사용하는 경우에 사용*/

CREATE SEQUENCE SEQ_DEPT
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
MINVALUE 1
NOCYCLE
NOCACHE
;

SELECT * 
FROM DEPT_TEMP2 dt
;

INSERT INTO DEPT_TEMP2
VALUES (SEQ_DEPT.NEXTVAL,'DB','BUSAN');

