SQL> CREATE TABLE Employee (
  2      Eid INT PRIMARY KEY,
  3      Name VARCHAR(50) NOT NULL,
  4      Salary FLOAT CHECK (Salary > 0),
  5      Age INT CHECK (Age > 0),
  6      City VARCHAR(50) DEFAULT 'Mumbai',
  7      Designation VARCHAR(50)
  8  );

Table created.

SQL> INSERT ALL
  2      INTO Employee (Eid, Name, Salary, Age, City, Designation) VALUES (101, 'John', 50000, 30, 'Mumbai', 'Manager')
  3      INTO Employee (Eid, Name, Salary, Age, City, Designation) VALUES (102, 'Alice', 60000, 35, 'Delhi', 'Senior Analyst')
  4      INTO Employee (Eid, Name, Salary, Age, City, Designation) VALUES (103, 'Bob', 45000, 28, 'Mumbai', 'Junior Analyst')
  5      INTO Employee (Eid, Name, Salary, Age, City, Designation) VALUES (104, 'Charlie', 70000, 40, 'Mumbai', 'Sr Executive')
  6      INTO Employee (Eid, Name, Salary, Age, City, Designation) VALUES (105, 'David', 55000, 32, 'Pune', 'Junior Analyst')
  7  SELECT * FROM dual;

5 rows created.

SQL> SELECT * FROM Employee;

       EID NAME                                                   SALARY        AGE CITY                                               DESIGNATION
---------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- --------------------------------------------------
       101 John                                                    50000         30 Mumbai                                             Manager
       102 Alice                                                   60000         35 Delhi                                              Senior Analyst
       103 Bob                                                     45000         28 Mumbai                                             Junior Analyst
       104 Charlie                                                 70000         40 Mumbai                                             Sr Executive
       105 David


SQL> SELECT Name
  2  FROM Employee
  3  WHERE Salary = (SELECT MAX(Salary) FROM Employee);

NAME
--------------------------------------------------
Charlie

SQL> SELECT *
  2  FROM Employee
  3  WHERE City = 'Mumbai'
  4  ORDER BY Salary DESC;

       EID NAME                                                   SALARY        AGE CITY                                               DESIGNATION
---------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- --------------------------------------------------
       104 Charlie                                                 70000         40 Mumbai                                             Sr Executive
       101 John                                                    50000         30 Mumbai                                             Manager
       103 Bob                                                     45000         28 Mumbai                                             Junior Analyst

SQL> SELECT Designation, COUNT(*) AS Num_Employees
  2  FROM Employee
  3  GROUP BY Designation;

DESIGNATION                                        NUM_EMPLOYEES
-------------------------------------------------- -------------
Manager                                                        1
Senior Analyst                                                 1
Junior Analyst                                                 2
Sr Executive                                                   1

SQL> UPDATE Employee
  2  SET Salary = Salary * 1.10
  3  WHERE Designation = 'Sr Executive';

1 row updated.

SQL> SELECT * FROM Employee;

       EID NAME                                                   SALARY        AGE CITY                                               DESIGNATION
---------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- --------------------------------------------------
       101 John                                                    50000         30 Mumbai                                             Manager
       102 Alice                                                   60000         35 Delhi                                              Senior Analyst
       103 Bob                                                     45000         28 Mumbai                                             Junior Analyst
       104 Charlie                                                 77000         40 Mumbai                                             Sr Executive
       105 David                                                   55000         32 Pune                                               Junior Analyst

SQL> SELECT e1.*
  2  FROM Employee e1
  3  JOIN Employee e2 ON e1.Designation = e2.Designation
  4  WHERE e2.Name = 'Alice';

       EID NAME                                                   SALARY        AGE CITY                                               DESIGNATION
---------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- --------------------------------------------------
       102 Alice                                                   60000         35 Delhi                                              Senior Analyst