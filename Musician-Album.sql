SQL> CREATE TABLE Musician (
  2      mno INT PRIMARY KEY,
  3      mname VARCHAR(100),
  4      city VARCHAR(100),
  5      phno VARCHAR(15)
  6  );

Table created.

SQL> CREATE TABLE Album (
  2      title VARCHAR(100),
  3      copy_right_date DATE,
  4      format VARCHAR(10),
  5      mno INT,
  6      PRIMARY KEY (title),
  7      FOREIGN KEY (mno) REFERENCES Musician(mno)
  8  );

Table created.

SQL> INSERT ALL
  2      INTO Musician (mno, mname, city, phno) VALUES (101, 'A R Rehman', 'Chennai', '1234567890')
  3      INTO Musician (mno, mname, city, phno) VALUES (102, 'Lata Mangeshkar', 'Mumbai', '0987654321')
  4      INTO Musician (mno, mname, city, phno) VALUES (103, 'Kumar Sanu', 'Kolkata', '1122334455')
  5  SELECT * FROM dual;

3 rows created.

SQL> INSERT ALL
  2      INTO Album (title, copy_right_date, format, mno) VALUES ('Roja', TO_DATE('1992-08-15', 'YYYY-MM-DD'), 'Audio', 101)
  3      INTO Album (title, copy_right_date, format, mno) VALUES ('Bombay', TO_DATE('1995-03-10', 'YYYY-MM-DD'), 'Audio', 101)
  4      INTO Album (title, copy_right_date, format, mno) VALUES ('Dil Se', TO_DATE('1998-06-21', 'YYYY-MM-DD'), 'Audio', 101)
  5      INTO Album (title, copy_right_date, format, mno) VALUES ('Lagan', TO_DATE('2001-09-24', 'YYYY-MM-DD'), 'Audio', 102)
  6      INTO Album (title, copy_right_date, format, mno) VALUES ('Kuch Kuch Hota Hai', TO_DATE('1998-10-16', 'YYYY-MM-DD'), 'Audio', 103)
  7      INTO Album (title, copy_right_date, format, mno) VALUES ('Saajan', TO_DATE('1991-09-01', 'YYYY-MM-DD'), 'Audio', 103)
  8  SELECT * FROM dual;

6 rows created.

SQL> SELECT Album.* FROM Album INNER JOIN Musician ON Musician.mno = Album.mno WHERE Musician.mname = 'A R Rehman';

TITLE                                                                                                COPY_RIGH FORMAT            MNO
---------------------------------------------------------------------------------------------------- --------- ---------- ----------
Roja                                                                                                 15-AUG-92 Audio             101
Bombay                                                                                               10-MAR-95 Audio             101
Dil Se                                                                                               21-JUN-98 Audio             101

SELECT DISTINCT m.* FROM Musician m JOIN Album a ON m.mno = a.mno WHERE a.format = 'Audio';

       MNO MNAME                                                                                                CITY
                                                     PHNO
---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------
       101 A R Rehman                                1234567890                                                  Pune
                                                     
       102 Lata Mangeshkar                           0987654321                                                  Mumbai
                                                      
       103 Kumar Sanu                                1122334455                                                  Kolkata
                                                     


SELECT * FROM Musician WHERE city = 'Mumbai';

       MNO MNAME                                                                                                CITY
                                                     PHNO	
---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------
       102 Lata Mangeshkar                           0987654321                                                 Mumbai
                                                     

SQL> INSERT INTO Musician (mno, mname, city, phno) VALUES (104, 'Shreya Ghoshal', 'Pune', '2233445566');

1 row created.

SQL> INSERT INTO Musician (mno, mname, city, phno) VALUES (105, 'Arijit Singh', 'Pune', '3344556677');

1 row created.

SQL> INSERT INTO Musician (mno, mname, city, phno) VALUES (108, 'Gen', 'New York', '1234567890');

1 row created.

SQL> SELECT * FROM Musician WHERE mname LIKE '%e_';

       MNO MNAME                                                                                                CITY
                                                     PHNO
---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------
       108 Gen                                        1234567890                                                 New York

SQL> UPDATE Musician
  2  SET city = 'Pune'
  3  WHERE mno = 101 AND city = 'Chennai';

1 row updated.

SQL> SELECT * FROM Musician WHERE mno = 101;

       MNO MNAME                                                                                                CITY
                                                     PHNO
---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------
       101 A R Rehman                                1234567890                                                  Pune
                                                     

SQL> SELECT m.mname, COUNT(a.title) AS album_count FROM Musician m JOIN Album a ON m.mno = a.mno GROUP BY m.mname;

MNAME                                                                                                ALBUM_COUNT
---------------------------------------------------------------------------------------------------- -----------
A R Rehman                                                                                                     3
Lata Mangeshkar                                                                                                1
Kumar Sanu                                                                                                     2

SQL> SELECT m.mname FROM Musician m JOIN Album a ON m.mno = a.mno GROUP BY m.mname HAVING COUNT(a.title) > 2;

MNAME
----------------------------------------------------------------------------------------------------
A R Rehman
