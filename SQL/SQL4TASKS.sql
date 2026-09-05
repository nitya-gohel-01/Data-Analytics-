USE collegeDB;

CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  course VARCHAR(20),
  marks INT
);

INSERT INTO students VALUES
(1, 'Nitya', 'BCA', 75),
(2, 'Kirtan', 'MCA', 90),
(3, 'Dhruvika', 'BCA', 65),
(4, 'Riya', 'BBA', 80),
(5, 'Bhumika', 'MCA', 88);

-- Course wise Avg Marks 

SELECT course , AVG(marks) 
FROM students
GROUP BY course;

-- Coursw wise avg marks which is greater than 70

SELECT course , AVG(marks) 
FROM students
GROUP BY course
HAVING AVG(marks) > 70;

-- Top 3 students by marks

SELECT TOP 3 name, marks
FROM students
ORDER BY marks DESC;

-- IN , BETWEEN AND
-- Students in BCA or MCA with marks between 70 and 90

SELECT * FROM students
WHERE course IN ('BCA', 'MCA')
AND marks BETWEEN 70 AND 90;

-- Summary of Student Marks

SELECT 
  COUNT(*) AS total_students,
  SUM(marks) AS total_marks,
  AVG(marks) AS average_marks,
  MAX(marks) AS highest_marks,
  MIN(marks) AS lowest_marks
FROM students;

-- Practical Tasks 

--1 

SELECT course , COUNT(*) AS Total_Student
FROM students
GROUP BY course;

--2

SELECT course , MIN(marks) AS Lowest_Marks , MAX(marks) AS Highest_Marks
FROM students
GROUP BY course;

--3

SELECT course , SUM(marks) AS Total_Marks
FROM students
GROUP BY course;

--4

SELECT course , AVG(marks) AS Average_Marks
FROM students
GROUP BY course;

--5

SELECT course , AVG(marks) AS Average_Marks
FROM students
GROUP BY course
HAVING AVG(marks) >80;

--6

SELECT TOP 2 * FROM students
ORDER BY marks DESC;

--7

SELECT * FROM students
WHERE marks BETWEEN 60 AND 90; 

--8

SELECT * FROM students
WHERE course IN ('BCA','MCA');

--9

SELECT  course , COUNT(DISTINCT course) AS COURSE_NO FROM students
GROUP BY course;

--10

SELECT name from students
WHERE name like 'N%';