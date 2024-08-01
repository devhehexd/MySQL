SELECT user();

CREATE USER 'jimin'@'%' IDENTIFIED BY '1234';

DROP USER 'jimin'@'localhost';

DESC mysql.user;

SELECT * FROM mysql.user;

GRANT SELECT ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES; /*권한 세이브, 반드시 해줘야함*/

/*권한은 디테일하고 축소적이어야 한다*/


GRANT ALL PRIVILEGES ON mycompany.Patient TO 'jimin'@'%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON mycompany.sp_select_all_patient TO 'jimin'@'%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES;


SHOW GRANTS FOR 'jimin'@'%';



REVOKE ALL PRIVILEGES ON mycompany.* FROM 'jimin'@'%';
FLUSH PRIVILEGES;

REVOKE ALL PRIVILEGES ON mycompany.sp_select_all_patient FROM 'jimin'@'%';
FLUSH PRIVILEGES;


SHOW GRANTS FOR 'jimin'@'%'; /*GRANT한 히스토리까지 다 보여주기 때문에 REVOKE한 후에도 남아 있는 것들은 히스토리들*/


CREATE USER 'test'@'%' IDENTIFIED BY '1234';

CREATE TABLE employee (
	empno VARCHAR(4) PRIMARY KEY,
    ename VARCHAR(20),
    dname VARCHAR(20),
    grade SMALLINT,
    setbonus INT,
    familybonus INT,
    overtime INT,
    total INT,
    salary INT);
    
GRANT ALL PRIVILEGES ON mycompany.employee TO 'test'@'%';
FLUSH PRIVILEGES;

GRANT EXECUTE ON mycompany.* TO 'test'@'%';
FLUSH PRIVILEGES;

delimiter //
CREATE PROCEDURE sp_insert_employee
(
	IN v_empno	VARCHAR(4),
    IN v_ename	VARCHAR(20),
    IN v_dname 	VARCHAR(20),
    IN v_grade	SMALLINT,
    IN v_setbonus	INT,
    IN v_familybonus INT,
    IN v_overtime INT,
    IN v_total INT,
    IN v_salary INT
    
)
BEGIN
	INSERT INTO employee
    VALUES (v_empno, v_ename, v_dname, v_grade, v_setbonus, v_familybonus, v_overtime, v_total, v_salary);
    COMMIT;
END
//
delimiter ;


DELIMITER $$
CREATE PROCEDURE sp_select_all_employees()
BEGIN
    SELECT *
    FROM employee
    ORDER BY empno;
END $$
DELIMITER ;

DELETE FROM employee;


