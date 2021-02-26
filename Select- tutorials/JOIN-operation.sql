Used this link (https://sqlzoo.net/wiki/The_JOIN_operation) to access questions for the following answers:

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2.
SELECT id,stadium,team1,team2
  FROM game

-- 3.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) 
   where teamid = 'GER'

-- 4.
select team1, team2, player from game join goal on (id=matchid) where player like 'Mario%' 

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal join eteam on (teamid = id)
 WHERE gtime<=10

-- 6.
select mdate, teamname from game join eteam on (team1 = eteam.id)
where coach = 'Fernando Santos'

-- 7.
select player from goal join game ON (matchid = id)
where stadium = 'National Stadium, Warsaw'

-- 8.
SELECT Distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

-- 9.
SELECT teamname, count(*)
  FROM eteam JOIN goal ON id=teamid
 Group BY teamname

-- 10.
select stadium, count(*) from game Join goal On (game.id = matchid) group by stadium

-- 11.
SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;

-- 12
SELECT matchid, mdate, COUNT(*) 
    FROM goal JOIN game ON id = matchid 
        WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER' GROUP BY matchid, mdate;

--13.

SELECT DISTINCT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON matchid = id
GROUP BY mdate,team1,team2
ORDER BY mdate,team1,team2;