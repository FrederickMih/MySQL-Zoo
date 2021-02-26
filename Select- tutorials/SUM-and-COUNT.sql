Used this link (https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial) to access questions for the following answers:

SELECT SUM(population)
FROM world

-- 2.
select distinct continent from world

-- 3.
select sum(gdp) from world where continent = 'Africa'

-- 4.
select count(name) from world where area > 1000000

-- 5.
select SUM(population) from world where name = 'Estonia' OR name = 'Latvia' OR name = 'Lithuania';

-- 6.
select continent, count(name) from world Group by continent

-- 7.
select continent, count(name) from world where population > 10000000 group by continent

-- 8.
select continent from world x where (select sum(population) from world y where x.continent = y.continent) > 100000000 Group by continent