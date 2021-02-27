Used this link (https://sqlzoo.net/wiki/Self_join) to access questions for the following answers:

-- 1.
select count(*) from stops

-- 2.

select id from stops where name = 'Craiglockhart'

-- 3.

SELECT DISTINCT id, stops.name FROM stops JOIN route ON stops.id = stop WHERE num = '4' AND company = 'LRT';

-- 4.

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num having count(*) = 2

-- 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop = 149

-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- 7.
SELECT Distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith'

-- 8.
SELECT Distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'

-- 9.

 SELECT Distinct stopb.name,  a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND b.company = 'LRT'

-- 10.

SELECT S.num, S.company, S.name, T.num, T.company 
FROM 
    (SELECT DISTINCT a.num, a.company, stopb.name 
     FROM route a JOIN route b ON (a.num = b.num and a.company = b.company) 
                  JOIN stops stopa ON stopa.id = a.stop 
                  JOIN stops stopb ON stopb.id = b.stop 
     WHERE stopa.name = 'Craiglockhart' AND stopb.name <> 'Craiglockhart'
)S

JOIN

    (SELECT x.num, x.company, stopy.name 
     FROM route x JOIN route y ON (x.num = y.num and x.company = y.company) 
                  JOIN stops stopx ON stopx.id = x.stop 
                  JOIN stops stopy ON stopy.id = y.stop 
     WHERE stopx.name = 'Lochend' AND stopy.name <> 'Lochend'
    )T

ON (S.name = T.name)
ORDER BY S.num, S.name, T.num
