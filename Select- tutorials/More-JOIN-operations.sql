Used this link (https://sqlzoo.net/wiki/More_JOIN_operations) to access questions for the following answers:

-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962

--  2.
 Select yr from movie where title = 'Citizen Kane'

--  3.
 select id, title, yr from movie where title like 'Star Trek%' order by yr

--  4.
 select id from actor where name = 'Glenn Close'
 
--  5.
 select id from movie where title = 'Casablanca'

--  6.
 select name from actor join casting on (actor.id = actorid) where movieid=11768

--  7.
 select name from actor join casting on (actor.id = actorid) 
    where movieid = (select id from movie where title = 'Alien')

--  8.
 select title from movie join casting on (movie.id = movieid) 
    where actorid = (select id from actor where name = 'Harrison Ford')

-- 9.
select title from movie join casting on (movie.id = movieid) 
    where ord != 1 AND actorid = (select id from actor where name = 'Harrison Ford')

-- 10.
SELECT title, name FROM (actor JOIN casting ON  id = actorid) 
    JOIN movie ON movie.id = movieid WHERE ord = 1 AND yr = 1962 GROUP BY title; 

-- 11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12.
SELECT title, name 
  FROM movie Join casting on (movieid = movie.id and ord=1)
             join actor on (actorid = actor.id)
where movie.id IN ( 
   Select movieid from casting where actorid IN ( select id from actor where name = 'Julie Andrews'))

-- 13.
SELECT name FROM (actor JOIN casting ON actorid = actor.id) JOIN movie ON movieid = movie.id 
    WHERE ord = 1 AND actor.id = actorid GROUP BY name HAVING count(*) >= 15;

-- 14.
SELECT title, COUNT(actorid) FROM (movie JOIN casting ON movieid = movie.id) JOIN actor ON actor.id = actorid WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title;

-- 15.
SELECT name FROM (actor JOIN casting ON actorid = actor.id) JOIN movie ON movieid = movie.id WHERE movieid IN (SELECT movieid FROM  (actor JOIN casting ON actorid = actor.id) JOIN movie ON movieid = movie.id WHERE name = 'Art Garfunkel') AND name != 'Art Garfunkel';
