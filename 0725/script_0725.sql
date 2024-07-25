/*1987년에 입사한 사원 정보를 출력하시요*/
SELECT empno, ename, hiredate
FROM emp
/*WHERE hiredate BETWEEN '1987-01-01' AND '1987-12-31'*/
/*WHERE hiredate LIKE '1987%'*/
WHERE YEAR(hiredate) = 1987;

START TRANSACTION;

SELECT * FROM emp
WHERE empno = 7782;

UPDATE emp
SET deptno = 10
WHERE empno = 7782;

SAVEPOINT a;

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7999, 'TOM', 'SALESMAN', 7782, CURDATE(), 2000, 2000, 10);

ROLLBACK TO a;

CREATE TABLE emp20
AS
SELECT empno, ename, sal
FROM emp
WHERE deptno = 20;

SELECT * FROM emp20;

DROP TABLE emp20;

ALTER TABLE emp20
ADD age TINYINT AFTER ename;

ALTER TABLE emp20
DROP COLUMN sal;

ALTER TABLE emp20
MODIFY ename VARCHAR(20);

CREATE TABLE Jusorok
(bunho SMALLINT,
gender CHAR(6) DEFAULT 'male');

INSERT INTO Jusorok VALUE(1, 'FEMALE');
INSERT INTO Jusorok VALUE(2, DEFAULT);

CREATE TABLE Student(
	hakbun 	CHAR(4),
    name	VARCHAR(20) NOT NULL,
    kor		TINYINT	NOT NULL CHECK(kor BETWEEN 0 AND 100),
    eng		TINYINT NOT NULL,
    math	TINYINT NOT NULL DEFAULT 0,
    edp		TINYINT,
    total	SMALLINT,
    avg		SMALLINT,
    grade	CHAR(1),
    deptno TINYINT,
    CONSTRAINT student_hakbun_pk PRIMARY KEY(hakbun),
    CONSTRAINT student_name_uk UNIQUE(name),
    CONSTRAINT studnet_grade_ck CHECK(grade IN('A', 'B', 'C', 'D', 'F')),
    CONSTRAINT student_dptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
) DEFAULT CHARSET utf8;

ALTER TABLE Student
MODIFY edp TINYINT NOT NULL; /*NOT NULL은 column level 제약 조건이기 때문에 반드시 MODIFY로 해야한다*/

ALTER TABLE Student
ADD CONSTRAINT student_total_ck CHECK(total BETWEEN 0 AND 400); /*table level 제약조건은 ADD CONSTRAINT*/

ALTER TABLE Student
MODIFY eng TINYINT; /*NOT NULL은 column level 제약 조건이기 때문에 반드시 MODIFY로 해야한다*/

ALTER TABLE Student
DROP CONSTRAINT student_name_uk;











