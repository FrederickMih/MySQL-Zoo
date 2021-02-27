Used this link (https://sqlzoo.net/wiki/Using_Null) to access questions for the following answers:

-- 1.
select name from teacher where dept IS NULL

-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3.
select teacher.name, dept.name from teacher LEFT Join dept on (teacher.dept = dept.id)

-- 4. 
select teacher.name, dept.name from teacher Right join dept on (teacher.dept = dept.id)

-- 5.
select name, COALESCE(mobile, '07986 444 2266') from teacher 

-- 6. 
SELECT teacher.name, COALESCE(dept.name, 'None') from teacher LEFT JOIN dept ON (teacher.dept = dept.id)

-- 7.

select count(teacher.name), count(mobile) from teacher

-- 8.

select dept.name, count(teacher.id) from teacher Right JOIN dept ON ( teacher.dept = dept.id) Group by dept.name

-- 9. 
select teacher.name, 
CASE 
    WHEN (teacher.dept = 1 OR teacher.dept = 2)
       THEN 'Sci'
       ELSE 'Art'
       END
from teacher

-- 10. 

select teacher.name, 
CASE WHEN teacher.dept = 1 or teacher.dept = 2
THEN 'Sci'
WHEN teacher.dept = 3
THEN 'Art'
ELSE 'None'
END
from teacher
