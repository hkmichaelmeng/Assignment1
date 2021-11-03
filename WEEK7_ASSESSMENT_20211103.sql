CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Anson', 'Tang', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Amy', 'Chan', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Bob', 'Li', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'David', 'Lam', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Pika', 'Chu', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Bell', 'Chan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Hugo', 'Lam', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'John', 'Cheung', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

# Problem 1: Write an SQL query to fetch “LAST_NAME” from Worker table.
select LAST_NAME FROM Worker;

# Problem 2: Write an SQL query to fetch unique values of DEPARTMENT from Worker table with ascending Department name order.
SELECT DISTINCT DEPARTMENT FROM Worker;

# Problem 3: Write an SQL query to print only the FIRST_NAME, SALARY details from the Worker table with ascending FIRST_NAME order and descending SALARY order.
SELECT FIRST_NAME, SALARY FROM Worker
order by First_NAME, SALARY DESC;

# Problem 4: Write an SQL query to fetch no. of workers for each department in the ascending order of number of worker.
# Make sure to name the correct column stated in expected output.
SELECT DEPARTMENT, COUNT(*) AS NO_WORKERS
FROM Worker
group by DEPARTMENT
order by NO_WORKERS;

# Problem 5: Write an SQL query to fetch the WORKER_TITLE, FIRST_NAME, SALARY with descending SALARY and ascending FIRST NAME as second sorting order.
SELECT t.WORKER_TITLE, w.FIRST_NAME, w.SALARY
from Title as t, Worker as w
where t.WORKER_REF_ID = w.WORKER_ID
ORDER BY w.SALARY desc, w.FIRST_NAME;

# Problem 6: Write an SQL query to fetch the list of employees with the same salary with ascending WORKER_ID.
select FIRST_NAME, LAST_NAME, SALARY from Worker as w
where SALARY IN (select SALARY from Worker group by SALARY having count(*)>=2)
order by WORKER_ID;

# Problem 7: Write an SQL query to fetch the departments that have exactly 4 people in it. Make sure to name the correct column stated in expected output.
SELECT DEPARTMENT, count(*) as No_Of_Workers FROM Worker
group by DEPARTMENT
having No_Of_Workers = 4;



