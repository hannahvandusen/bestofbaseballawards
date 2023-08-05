--Heaviest Hitters
SELECT ROUND(AVG(people.weight), 1), teams.name, batting.yearid
FROM people
INNER JOIN batting
	ON people.playerid = batting.playerid
INNER JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY 
	AVG(people.weight)
  DESC;

-- Shortest Sluggers
SELECT ROUND(AVG(people.height), 1), teams.name, batting.yearid
FROM people
INNER JOIN batting
	ON people.playerid = batting.playerid
INNER JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY 
	AVG(people.height)
  ASC;

-- Biggest Spenders
SELECT SUM(salaries.salary), teams.name, salaries.yearid
FROM salaries
INNER JOIN teams
	ON salaries.teamid = teams.teamid
GROUP BY teams.name, salaries.yearid
ORDER BY SUM(salaries.salary)
	DESC; 

-- Most Bang for Their Buck in 2010
SELECT 
	ROUND(SUM(salary)/teams.w),
	teams.w,
	teams.name,
	salaries.yearid 
FROM salaries
LEFT JOIN teams 
	ON teams.teamid = salaries.teamid 
	AND teams.yearid = salaries.yearid
WHERE teams.yearid = 2010
GROUP BY 
	teams.name, 
	salaries.yearid, 
	teams.w
ORDER BY 
	SUM(salary)/teams.w 
	ASC;

-- Priciest Starter
SELECT salaries.salary/pitching.gs as cost_per_game, pitching.gs, people.namegiven, salaries.yearid
FROM salaries
INNER JOIN pitching
	ON pitching.playerid = salaries.playerid
  AND pitching.teamid = salaries.teamid 
  AND pitching.yearid = salaries.yearid
INNER JOIN people
	ON people.playerid = salaries.playerid
  WHERE pitching.gs >= 10
ORDER BY 
	ROUND(salaries.salary/pitching.gs)
    DESC; 

