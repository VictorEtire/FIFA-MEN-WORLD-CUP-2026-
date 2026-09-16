The DATASET for this queries covers the MEN AND WOMEN WORLD CUP TOURNAMENT FROM WC-1930 to WC-2026
excluding the WOMEN WORLD CUP TOURNAMENT-2022. 

SHOWING EVERYTHING FROM TOURNAMENT RECORDS 
SELECT *
FROM tournaments;


SHOWING RECORDS OF ALL WINNERS, HOST AND YEAR OF TOURNAMENT 
SELECT year, host_country, winner 
FROM tournaments;


SHOWING RECORDS OF THE FIRST EVER WORLD CUP TOURNAMENT
SELECT * 
FROM tournaments
ORDER By year ASC
LIMIT 1;


SHOWING RECORDS OF THE MOST RECENT WORLD CUP TOURNAMENT
SELECT *
FROM tournaments
ORDER By year DESC
LIMIT 1;


SHOWING RECORDS WHERE THE HOST COUNTRY WON THE TOURNAMENT 
SELECT *
FROM tournaments 
WHERE host_won;


SHOWING RECORDS WHERE THE NON-HOST COUNTRY WON THE TOURNAMENT
SELECT *
FROM tournaments 
WHERE host_won = 0;


SHOWING RECORDS WHERE THE HOST COUNTRY WON THE TOURNAMENT GROUPED BY THE NUMBER OF TIMES WON HOSTED
SELECT host_country, COUNT(*) AS times_hosted
FROM tournaments
GROUP BY host_country
ORDER BY times_hosted DESC;


SHOWING RECORDS OF THE HOST_COUNTRY AND THE TIMES HOSTED    
SELECT 
	host_country,
    COUNT(*) AS times_hosted 
    FROM tournaments
    GROUP BY host_country
    HAVING COUNT(*) > 1
    ORDER BY times_hosted DESC;
    

SHOWING RECORDS OF THE WINNER OF TOURNAMENT AND THE NUMBER OF TITLES
SELECT winner, COUNT(*) AS titles
FROM tournaments
GROUP BY winner
ORDER BY titles DESC;


CATEGORIZING THE HOST_COUNTRY USING CASE CONDITION TO SHOW WHERE THE HOST AND NON-HOST 
WON THE TOURNAMENT
SELECT year, 
host_country, 
winner, count_teams,
CASE
	WHEN host_won = 1 THEN 'YES'
    ELSE 'No'
    END AS host_winner
    From tournaments
    ORDER BY year;
    

CATEGORIZING THE TOURNAMENT_TYPE USING A CASE CONDITION
SELECT 
	CASE
		WHEN tournament_name LIKE '%Men' 's%' THEN 'Men'
        WHEN tournament_name LIKE '%Women''s%'THEN 'Women'
        ELSE 'Other'
        END AS tournament_type,
        COUNT(*) AS tournaments
        FROM tournaments
        GROUP BY tournament_type;
  
  
RECORD SHOWING THE TOURNAMENT WITH THE HIGHEST NUMBER OF TEAMS        
SELECT *
FROM tournaments
WHERE count_teams = (
	SELECT MAX(count_teams)
    FROM tournaments);


RECORD SHOWING THE PROGRESSION OF THE NUMBER OF TEAMS PER YEAR
SELECT year, 
tournament_name, 
count_teams,

LAG(count_teams) OVER (
	ORDER BY year
    ) AS previous_team_count,
    
    count_teams -
    LAG(count_teams) OVER (
		ORDER BY year
	)  AS team_change
    FROM tournaments;


RANKING THE TITLE WINNERS OF TOURNAMENT
SELECT
	winner,
    COUNT(*) AS titles,
    RANK() OVER (
		ORDER BY COUNT(*) DESC
        ) AS title_rank
	FROM tournaments
    GROUP BY winner;


RECORD SHOWING THE NUMBER OF DAYS OF EVERY TOURNAMENT 
SELECT year, tournament_name, 
DATEDIFF( 
	STR_TO_DATE (end_date, '%d/%m/%Y'),
    STR_TO_DATE (start_date, '%d/%m/%Y')
    ) AS tournament_days

FROM tournaments;


RECORD SHOWING THE TOURNAMENT WITH THE TOP TEN TOURNAMENT DAYS 
SELECT year, tournament_name,
DATEDIFF(
STR_TO_DATE(end_date, '%d/%m/%Y'),
STR_TO_DATE(start_date, '%d/%m/%Y')
) AS tournament_days

FROM tournaments
ORDER BY tournament_days DESC
LIMIT 10;


SHOWING ALL RECORDS OF THE VENUES OF THE MEN WORLD CUP 2026
SELECT *
FROM venues;


SHOWING RECORDS OF THE STADIUM, COUNTRY, CAPACITY OF THE MEN WORLD CUP 2026
SELECT `stadium name`, country, capacity
FROM venues
ORDER BY capacity DESC;


U.S. HOST CITIES AND VENUES OF THE 2026 FIFA WORLD CUP
SELECT *
FROM venues
WHERE country ='USA';


FIFA MEN WORLD 2026: RECORD OF THE NUMBER OF VENUES PER HOST COUNTRY 
SELECT country, COUNT(*) as venue_count
FROM venues
GROUP BY country;


RECORD SHOWING THE TOTAL NUMBER OF VENEUS OF FIFA MEN WORLD 2026
SELECT Count(*) AS Total_venues
FROM venues;


RECORD SHOWING THE TOTAL NUMBER OF VENEUS OF FIFA MEN WORLD 2026 BY COUNTRY
SELECT Country, Count(*) AS Number_of_Venues
FROM venues
GROUP BY Country
ORDER BY Number_of_Venues DESC;


RECORD SHOWING THE TOTAL NUMBER OF VENEUS OF FIFA MEN WORLD 2026 GREATER THAN 50,000
SELECT `Stadium Name`, country, capacity
FROM venues
WHERE capacity > 50000;


RECORD SHOWING THE SUM TOTAL CAPACITY OF VENUES BY COUNTRY IN THE FIFA MEN WORLD 2026 
SELECT Country, SUM(Capacity) 
AS Total_Capacity
FROM venues
GROUP BY Country
ORDER BY Total_Capacity;


RECORD SHOWING THE VENUE COUNT BY COUNTRY DURING FIFA MEN WORLD 2026 
SELECT Country, COUNT(*) AS Venue_Count
FROM venues
GROUP BY Country
HAVING COUNT(*) > 1;


RECORD SHOWING THE ELEVATION METERS OF THE VENUES DURING FIFA MEN WORLD 2026 
SELECT `Stadium Name`, City, Country, `Elevation Meters`
From venues
ORDER BY `Elevation Meters` DESC
LIMIT 10;


TOP 10 VENUES OF THE FIFA MEN WORLD CUP 2026
SELECT `Stadium Name`, City, Country, Capacity
FROM venues
ORDER BY Capacity DESC
LIMIT 10;


RECORD SHOWING VENUES OF THE FIFA MEN WORLD CUP 2026 GREATER THAN THE AVERAGE CAPACITY
SELECT `Stadium Name`, City, Country, Capacity
FROM venues
WHERE Capacity > (
	SELECT AVG(Capacity)
    FROM venues
)
ORDER BY Capacity DESC;


RECORD SHOWING THE TOTAL PERCENTAGE CAPACITY -VENUES OF THE FIFA MEN WORLD CUP 2026 
SELECT 
	`Stadium Name`, Country, Capacity,
    ROUND(
		Capacity * 100.0/ SUM(Capacity) OVER(),2)
        AS Percentage_of_Total_Capacity
FROM venues
ORDER BY Percentage_of_Total_Capacity DESC;


RECORD SHOWING THE PERCENTAGE CAPACITY SHARE PER HOST COUNTRY OF THE FIFA MEN WORLD CUP 2026 
SELECT Country, SUM(Capacity) AS Total_Capacity,
ROUND(SUM(Capacity) * 100.0 /SUM(SUM(Capacity))OVER (),
2) AS Capacity_Share_Percentage 
FROM venues
GROUP BY Country
ORDER BY Capacity_Share_Percentage DESC;


RECORD SHOWING THE GROUP OF THE VENUES OF THE FIFA MEN WORLD CUP 2026 BY CAPACITY
SELECT `Stadium Name`,
 Country, 
 Capacity,
`Elevation Meters`,

CASE
	WHEN Capacity >= 70000 THEN 'High Capacity'
    WHEN Capacity >= 40000 THEN 'Medium Capacity'
    ELSE 'Low Capacity'
    END AS Capacity_Level
    
FROM Venues;


RECORD SHOWING THE GROUP OF THE VENUES OF THE FIFA MEN WORLD CUP 2026 BY ELEVATION LEVEL
SELECT `Stadium Name`,
 Country, 
 Capacity,
`Elevation Meters`,

    CASE 
		WHEN `Elevation Meters` >= 1500 THEN 'High Elevation'
        WHEN `Elevation Meters` >= 500 THEN 'Medium Elevation'
        ELSE 'Low Elevation'
        END AS Elevation_level
        
FROM Venues;


RECORDS SHOWING ALL PLAYER-IN-POSSESSION-DISTRIBUTION OF THE FIFA MEN WORLD CUP 2026
SELECT * 
FROM player_in_possession_distributions;


RECORD SHOWING PLAYERS WHO SCORED IN THE FIFA MEN WORLD CUP 2026 
SELECT player_name, team, goals 
FROM player_in_possession_distributions
WHERE goals > 0;


RECORD SHOWING PLAYERS WITH MORE THAN 80 ATTEMPTED PASSES IN THE FIFA MEN WORLD CUP 2026 
SELECT player_name, team, passes_attempted
FROM player_in_possession_distributions
WHERE passes_attempted > 80
ORDER BY passes_attempted DESC;


10 PLAYERS WITH THE MOST PLAYERS COMPLETED PASSES IN THE FIFA MEN WORLD CUP 2026 
SELECT player_name, team, passes_completed
FROM player_in_possesion_distributions
ORDER BY passes_completed DESC
LIMIT 10;


TOTAL PASSES COMPLETED BY EACH TEAM IN THE FIFA MEN WORLD CUP 2026
SELECT team, SUM(passes_completed) AS total_passes_completed
FROM player_in_possession_distributions
GROUP BY team
ORDER BY total_passees_completed DESC;

TOTAL GOALS BY EACH TEAM IN THE FIFA MEN WORLD CUP 2026
SELECT team, SUM(goals) AS total_goals
FROM player_in_possession_distributions
GROUP BY team
ORDER BY total_goals DESC;

