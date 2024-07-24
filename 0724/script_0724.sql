SELECT *FROM dept;

INSERT INTO dept
VALUES (50, 'DESIGN', 'Busan');

INSERT INTO dept(deptno, dname, loc)
VALUES (60, 'DEVELOPMENT', 'Daejeon');

/*명시적 NULL*/
INSERT INTO dept(deptno, dname,loc)
VALUES (70, NULL, 'Incheon');

/*암시적 NULL*/
INSERT INTO dept(deptno, loc)
VALUES (80, 'Seoul');

INSERT INTO dept(dname, loc)
VALUES ('Account', 'Yongin'); /*제약 조건 위반(primary key가 없기 때문에 오류 발생)*/

INSERT INTO emp(empno, deptno)
VALUES (9999, 90); /*제약 조건 위반*/

INSERT INTO emp(empno, ename, hiredate, deptno)
VALUES (9999, 'Jimin', NOW(), 80); /*NOW는 년월일시분초를 가지고 있기 때문에 hiredate와 맞지 않아 오류 발생*/

INSERT INTO emp(empno, ename, hiredate, deptno)
VALUES (9999, 'Jimin', CURDATE(), 80); 

CREATE TABLE emp_copy
AS
SELECT empno, ename, sal, hiredate
FROM emp
WHERE deptno = 10;

/*Table Copy*/
CREATE TABLE emp_copy1
AS
SELECT *
FROM emp
WHERE 0 = 1; /*이 조건을 만족하는 레코드는 없기 때문에 컬럼만 복사가 됨*/

SELECT * FROM emp_copy1;

INSERT INTO emp_copy1(empno, ename)
VALUES (1111, '한지민');

SELECT * FROM dept;

UPDATE dept
SET dname = 'FINANCE'
WHERE deptno = 70;

UPDATE dept
SET dname = 'HR', loc = 'Busan'
WHERE deptno = 70;

