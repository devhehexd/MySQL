SELECT AVG(sal), SUM(sal), MAX(sal), MIN(sal)
FROM emp
WHERE deptno = 20;

SELECT ename, LENGTH(ename)
FROM emp
WHERE deptno = 20;

/*COUNT를 제외한 함수는 NULL인 것은 계산 대상에 아예 포함하지 않는다. 따라서 앞의 것은 NULL을 제외한 인원들, 뒤의 것은 모든 인원들로 평균 계산이기 때문에 평균이 줄어듬*/
SELECT AVG(comm), AVG(IFNULL(comm, 0)), SUM(IFNULL(comm, 0)) / COUNT(*)
FROM emp;

SELECT COUNT(DISTINCT job)
FROM emp;

SELECT MIN(hiredate), MAX(hiredate)
FROM emp;

SELECT deptno, AVG(sal), MIN(sal), MAX(sal)
FROM emp
GROUP BY deptno;

SELECT job, SUM(sal)
FROM emp
GROUP BY job;

SELECT YEAR(hiredate), COUNT(*)
FROM emp
GROUP BY YEAR(hiredate)
ORDER BY YEAR(hiredate);

SELECT deptno, job, COUNT(*)
FROM emp
GROUP BY deptno, job
ORDER BY deptno ASC;

SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY deptno, job;

SELECT job, SUM(sal)
FROM emp
WHERE job NOT LIKE 'SA%'
GROUP BY job
HAVING SUM(sal) > 5000
ORDER BY SUM(sal) DESC;

SELECT job, SUM(sal)
FROM emp
GROUP BY job
WITH ROLLUP;


SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY deptno, job
WITH ROLLUP;

SELECT emp.ename, emp.sal, dept.deptno, dept.loc
FROM emp, dept;

SELECT emp.ename, emp.sal, dept.deptno, dept.loc
FROM emp CROSS JOIN dept;

SELECT emp.ename, emp.sal, dept.deptno, dept.loc, salgrade.grade
FROM emp CROSS JOIN dept CROSS JOIN salgrade;

/*비표준 조인*/
SELECT ename, dept.deptno, loc
FROM dept, emp
WHERE dept.deptno = emp.deptno AND ename = 'SMITH';

/*별칭 사용 가능*/
SELECT ename, d.deptno, loc
FROM dept d, emp e
WHERE d.deptno = e.deptno AND ename = 'SMITH';

SELECT ename, loc
/*FROM emp NATURAL JOIN dept*/
/*FROM emp INNER JOIN dept USING (deptno)*/
FROM emp JOIN dept ON (emp.deptno = dept.deptno)
WHERE ename = 'SMITH';

SELECT city.name, city.Population, country.name, country.IndepYear, countrylanguage.Language
FROM city JOIN country ON (city.countrycode = country.code)
		  JOIN countrylanguage ON (country.code = countrylanguage.countrycode)
WHERE city.name = 'SEOUL';

SELECT ename, sal, grade
FROM emp, salgrade
WHERE (sal BETWEEN losal AND hisal)
	  AND ename = 'SMITH';

SELECT emp.ename, emp.empno, dept.dname, dept.loc
FROM emp INNER JOIN dept ON(emp.deptno = dept.deptno);

SELECT emp.ename, emp.empno, dept.dname, dept.loc
FROM emp RIGHT OUTER JOIN dept ON(emp.deptno = dept.deptno);

CREATE TABLE emp1 /*테이블 복사를 할 경우 제약조건이 모두 없어진다*/
AS
SELECT * FROM emp;

INSERT INTO emp1(empno, ename, sal, job, deptno)
VALUES(8282, 'JACK', 3000, 'ANALYST', 50);

SELECT e.ename, e.job, e.sal, d.loc, d.dname
FROM emp1 e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno);

SELECT CONCAT(worker.ename, '의 관리자의 이름은 ' , manager.ename)
FROM emp worker JOIN emp manager /*table이 같기 때문에 반드시 별칭을 써야한다*/
ON worker.mgr = manager.empno;
/*WHERE employee.ename = 'SMITH';*/

SELECT job, deptno
FROM emp
WHERE sal >= 3000
UNION
SELECT job, deptno
FROM emp
WHERE deptno = 10;

/*사번 7566의 급여보다 많이 받는 사원의 이름*/
SELECT ename
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE empno = 7566);

/*SMITH는 어디서 근무할까?*/
SELECT loc
FROM dept
WHERE deptno = (SELECT deptno
				FROM emp
				WHERE ename = 'SMITH');
                
/*부서에서 최소 급여를 받는 사원*/
SELECT ename, sal, deptno
FROM emp
WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

