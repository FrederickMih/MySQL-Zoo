Used this link (https://sqlzoo.net/wiki/SELECT_basics) to access questions for the following answers:

-- 1. 
SELECT population FROM world WHERE name = 'Germany'

-- 2. show name and populations of sweden, norway and denmark
SELECT name, population FROM world IN ('Sweden', 'Norway', 'Denmark')

-- 3. show name and area between 200000 and 250000
SELECT name, area From world BETWEEN 200000 AND 250000