/* 
* Q 1-1
* (1) 논리 설계 
* (2) 데이터 모델링
*
* Q 1-2
* (1) E-R 모델
* (2) E-R 모델
* (3) Entity
*
* Q 1-3
* (1) E-R Diagram(Entity-Relation Diagram)
* (2) 관계
*
* Q 1-4
* (1) 카디널리티(Cardinality)
* (2) 옵셔널리티(Optionality)
*
* Q 1-5
* (1) 스키마 
* (2) 테이블
*
* Q 1-6
* (1) Table
* (2) Index
* (2) Sequence
*/

--실습과제 1일차 8페이지--
SELECT EMPNO EMPLOYEE_NO, ENAME EMPLOYEE_NAME, JOB , MGR MANAGER, HIREDATE, SAL SALARY, COMM COMMISION, DEPTNO DEPARTMENT_NO
FROM BANK.EMP
ORDER BY DEPTNO DESC, ENAME;

--실습과제 1일차 9페이지--
--1번
SELECT *
FROM BANK.EMP
WHERE COMM IS NULL 
AND SAL > NULL;
-- 결론 : NULL값은 비교할수없으므로 대상 없음

--2번
SELECT *
FROM BANK.EMP
WHERE COMM IS NULL 
AND MGR IS NULL;

--실습과제 1일차 10페이지--
--1번
SELECT *
FROM BANK.EMP
WHERE ENAME LIKE '%S';  

--2번
SELECT *
FROM BANK.EMP
WHERE JOB = 'SALESMAN'
AND DEPTNO = '30';

--3번
SELECT *
FROM BANK.EMP
WHERE SAL >2000
AND DEPTNO IN('30','20');

--4번
SELECT *
FROM BANK.EMP
WHERE SAL >2000
AND DEPTNO IN('20')
UNION
SELECT *
FROM BANK.EMP
WHERE SAL >2000
AND DEPTNO IN('30');

--5번
SELECT *
FROM BANK.EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN('MANAGER','CLERK')
AND SUBSTR(ENAME,2,1) !='L';

--실습과제 1일차 11페이지--
--1번
SELECT EMPNO, ENAME, SUBSTR(EMPNO, 1, 2) || '****' AS "EMPNO 마스킹 처리", 
       SUBSTR(ENAME, 1, 1) || '*****' AS "ENAME 마스킹 처리"
FROM BANK.EMP
WHERE LENGTH(ENAME) >= 6;

--2번
SELECT EMPNO, ENAME, JOB, SAL, 
       ROUND(SAL/20, 0) AS "DAY_PER_SAL", 
       ROUND(SAL/20/8, 0) AS "HOUR_PER_SAL"
FROM BANK.EMP
WHERE JOB IN ('SALESMAN', 'CLERK')
ORDER BY SAL;

--실습과제 1일차 12페이지--
--3번
SELECT EMPNO, ENAME, TO_char(HIREDATE,'YYYY-MM-DD') AS HIREDATE,
       TO_char(next_day(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS 정직원되는날,
       CASE WHEN COMM IS NULL THEN 'N/A'
	        ELSE TO_CHAR(COMM)
	        END AS COMM
FROM BANK.EMP;

--4번
SELECT EMPNO, ENAME,
       CASE
           WHEN MGR IS NULL THEN '0000'
           WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
           WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
           WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
           WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
           ELSE '9999'
       END AS CHG_MGR
FROM BANK.EMP;