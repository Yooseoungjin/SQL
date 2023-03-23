--셀렉, 수정, 컬럼추가, 컬럼드랍, 테이블 드랍--------------------------------
SELECT * FROM emp;

ALTER TABLE GRADE MODIFY grade NUMBER(1);

ALTER TABLE emp ADD SALNO NUMBER(1);

ALTER TABLE SAL DROP COLUMN empno;

DROP TABLE SAL

--emp테이블 생성----------------------------------------------------------------

CREATE TABLE emp (
	empno	number(10,0)		NOT NULL,
	deptno	VARCHAR(255)		NOT NULL,
	name	varchar(10)		NULL,
	hiredate	date		NULL,
	job	VARCHAR(255)		NULL
);
ALTER TABLE emp ADD CONSTRAINT PK_COPYOFEMP PRIMARY KEY (empno);

ALTER TABLE EMP
ADD CONSTRAINT fk_SALNO foreign KEY(SALNO) references SAL(SALNO);

--dept테이블 생성---------------------------------------------------------------
CREATE TABLE dept (
	deptno	number(4,0)		NOT NULL,
	dname	varchar(10)		NULL
);
ALTER TABLE dept ADD CONSTRAINT PK_dept PRIMARY KEY (deptno);

CREATE TABLE grade (
	empno	number(10,0)		NOT NULL,
	grade	varchar(10)		NULL,	
	memo	varchar(1000)		NULL
);

ALTER TABLE grade
ADD CONSTRAINT fk_empno foreign KEY(empno) references emp(empno);
--ALTER TABLE [FK를 생성시킬 테이블명]
--ADD CONSTRAINT [FK명] foreign KEY(FK가 될 컬럼명) references [PK가 위치하는 테이블] ([PK컬럼명]);

--grade테이블생성----------------------------------------------------------------
CREATE TABLE SAL (
	SALNO NUMBER(1),
	sal	number(15) NOT NULL
);

ALTER TABLE SAL ADD CONSTRAINT PK_SAL PRIMARY KEY (SALNO);

--이거 왜 안될까요....------
ALTER TABLE SAL
ADD CONSTRAINT fk_empno foreign KEY(empno) references EMP(empno);
