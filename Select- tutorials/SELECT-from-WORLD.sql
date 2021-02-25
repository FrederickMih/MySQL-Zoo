
Used this link (https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial) to access questions for the following answers:
 
-- 1. Introduction
SELECT name, continent, population FROM world

-- 2. Large Countries
SELECT name FROM world WHERE population >= 200000000

-- 3. Per capita GDP
select name, gdp/population 
from world
where population > 200000000

-- 4. South America In millions
select name, population/1000000
from world
where continent = 'South America'

-- 5. France, Germany, Italy
select name, population
from world
where name = 'France' or name = 'Germany' or name = 'Italy'

-- 6. United
select name from world where name LIKE '%United%'

-- 7. Two ways to be big
SELECT name, population, area FROM world WHERE
area > 3000000 OR population > 250000000
-- 8. One or the other (but not both)
select name, population, area
from world
where area > 3000000 xor population > 250000000

-- 9. Rounding
select name, Round(population/1000000,2), Round(GDP/1000000000, 2)
from world
where continent = 'South America'

-- 10. Trillion dollar economies
select name, Round(GDP/population,-3)
from world
where GDP > 1000000000000

-- 11. Name and capital have the same length
SELECT name,     capital
  FROM world
 WHERE length(name) = length(capital)

-- 12. Matching name and capital
SELECT name, capital 
from world
where LEFT(name, 1) = LEFT(capital, 1) and name <> capital

-- 13 All the vowels
SELECT name
   FROM world
where name LIKE '%a%' and name like '%e%' and name like '%i%' and name like '%o%' and name like '%u%' and name not like '% %'
