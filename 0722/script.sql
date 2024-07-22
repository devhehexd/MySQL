/*
Author: 성기범
Date: 2024-07-22
Objective: Basic SELECT
Environment: Microsoft Windows 10, MySQL Workbench 8.0.38, MySQL 8.0.63
*/

SELECT CONCAT(ename, '의 봉급은 ', sal, '입니다.') AS "봉급"
FROM emp;

SELECT 'aaa'
FROM dept;

SELECT /*ALL*/ DISTINCT job /*중복 제거*/
FROM emp;

SELECT DISTINCT deptno
FROM emp;

SELECT *
FROM emp
WHERE ename = 'SmITh'; /*Windows는 대소문자를 구별하지 않음*/

SELECT *
FROM emp
WHERE ename = UPPER('smith'); /*대문자로 변환*/ 

/*1980년 입사한 직원*/
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= '1980-01-01' AND hiredate <= '1980-12-31';

SELECT now(), version();

/*1987년에 입사한 사원의 이름과 봉급과 입사날짜를 출력하시오*/
SELECT ename, sal, hiredate
FROM emp
/*WHERE hiredate >= '1987-01-01' AND hiredate <= '1987-12-31';*/
WHERE hiredate BETWEEN '1987-01-01' AND '1987-12-31';

/*우리 회사 직원 중에서 직무가 회사원이거나 분석가인 사원의 사원이름, 사원의 직무를 출력하시오*/
SELECT ename, job
FROM emp
WHERE job IN('CLERK', 'ANALYST'); /*job = 'CLERK' or job = 'ANALYST'*/

SELECT ename
FROM emp
WHERE ename LIKE '%I%';

/*우리 회사 직원 중 보너스를 받는 사람은?*/
SELECT empno, ename, comm, deptno
FROM emp
WHERE comm IS NOT NULL;

/*입사일 기준 내림차순*/
SELECT empno, ename, hiredate, sal
FROM emp
ORDER BY hiredate DESC, sal ASC;

/*우리 회사의 직원 중 20번 부서 또는 30번 부서의 연봉 내림차순으로 정렬하시오*/
SELECT deptno, (sal + IFNULL(comm, 0)) * 12 AS Annual
FROM emp
WHERE deptno IN(20, 30)
ORDER BY Annual DESC;