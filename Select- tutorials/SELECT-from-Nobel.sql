Used this link (https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial) to access questions for the following answers:

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. 1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3. Albert Einstein
select yr, subject from nobel
where winner = 'Albert Einstein'

-- 4. Recent Peace Prizes
select winner from nobel
where yr >= 2000 and subject ='Peace'


-- 5. Literature in the 1980's
select yr, subject, winner 
from nobel 
where subject = 'Literature' and yr <= 1989 and yr >= 1980

-- 6. Only Presidents
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')

-- 7. John
select winner 
from nobel
where winner Like 'John%'

-- 8. Chemistry and Physics from different years
select *
from nobel
where subject = 'Physics' and yr=1980 or subject = 'Chemistry' and yr=1984

-- 9. Exclude Chemists and Medics
select * from nobel
where yr=1980 and subject <> 'Chemistry' and subject <> 'Medicine'

-- 10. Early Medicine, Late Literature
select * from nobel
where subject ='Medicine' and yr < 1910 or subject ='Literature' and yr >= 2004 

-- 11. Umlaut
select * from nobel
where winner = 'PETER GRÜNBERG'

-- 12. Apostrophe
select * from nobel
where winner = 'EUGENE O''NEILL';

-- 13. Knights of the realm
select winner, yr, subject from nobel 
where winner LIKE 'Sir%'

--14. Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
subject IN ('Physics','Chemistry'), subject,winner