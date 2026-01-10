CREATE TABLE Batting (
    -- Defined columns and data types here
    Matches_name TEXT,
    Player_Name TEXT,
    Runs INT,
	Balls INT,
	Fours INT,
	Sixes INT,
	SR TEXT
    
);
Truncate table Batting;
SELECT * FROM Batting where Player_Name ='Lokesh Bam';

CREATE TABLE Bowling (
    -- Defined columns and data types here
    matches_name TEXT,
    Player_Name TEXT,
    Overs TEXT,
	Maidens INT,
	Runs_conceded INT,
	Wickets INT,
	Economy TEXT,
	Wides INT,
	No_balls INT
    
);
Truncate table bowling;

CREATE TABLE player_profiles (
    Team_name TEXT,
    Players_Name TEXT,
    Players_Type TEXT

);
Truncate TABLE player_profiles;



CREATE TABLE extra_bat (
    Player_name TEXT,
    Total_batted int,
    DNP int

);

SELECT * FROM extra_bat LIMIT 20;


Truncate table extra_bat;


-- imported datas from batting bowling and profile,extrabat, import was done in terminal shell
-- used code for import for bat : (In terminal this was the code.)
-- psql -U postgres -d Project 
-- Project=# \copy Batting(Matches_name, Player_Name, Runs, Balls, Fours, Sixes, SR) 
-- FROM '/Users/nischal/Desktop/NPL/Mainstream data/Batting.csv' DELIMITER ',' CSV HEADER;
SELECT Batting.player_name,player_profiles.Team_name,player_profiles.Players_type,Batting.Matches_name, Batting.Runs, Batting.Balls, Batting.Fours, Batting.Sixes, Batting.SR
	FROM Batting 
INNER JOIN player_profiles ON Batting.Player_name = player_profiles.Players_name
WHERE player_profiles.Team_name = 'Biratnagar Kings';

--batting stats for biratnagar









--Stats extraction :
SELECT * FROM Batting;

SELECT * FROM Batting where Player_Name ='Aqib Ilyas'; --For batting check


SELECT * FROM player_profiles; --Profile Check




SELECT DISTINCT player_profiles.players_name, player_profiles.players_type,
	
Batting.Matches_name, Batting.Runs, Batting.Balls, Batting.Fours, Batting.Sixes, Batting.SR,
	
	Bowling.Overs, Bowling.Maidens, Bowling.Runs_conceded, Bowling.Wickets, Bowling.Economy,Bowling.Wides,Bowling.No_balls
FROM Batting
Inner JOIN player_profiles ON Batting.Player_name = player_profiles.Players_name
Left JOIN Bowling ON Bowling.player_name = Batting.player_name AND Batting.Matches_name = Bowling.Matches_name
WHERE player_profiles.Team_name = 'Biratnagar Kings' ORDER BY Batting.Player_name, Batting.Matches_name; -- main table extraction



SELECT Player_name, Matches_name, COUNT(*)
FROM Batting
GROUP BY Player_name, Matches_name
HAVING COUNT(*) > 1; ---check redundancy

DELETE FROM Batting
WHERE ctid NOT IN (
  SELECT MIN(ctid)
  FROM Batting
  GROUP BY Player_name, Matches_name --delete redundancy
);


SELECT DISTINCT 
    Batting.player_name, Batting.Matches_name, 
    Batting.Runs, Batting.Balls, Batting.Fours, Batting.Sixes, Batting.SR,
    Bowling.Overs, Bowling.Maidens, Bowling.Runs_conceded, 
    Bowling.Wickets, Bowling.Economy, Bowling.Wides, Bowling.No_balls
FROM Batting 
LEFT JOIN Bowling 
    ON Batting.Player_Name = Bowling.Player_Name 
   AND Batting.Matches_name = Bowling.Matches_name
WHERE Batting.Player_name = 'Basir Ahamad';



SELECT * FROM BOWLING WHERE Bowling.Player_name = 'Lokesh Bam'; --See bowling


SELECT 
    b.Player_name,
    b.Matches_name,
    b.Runs, b.Balls, b.Fours, b.Sixes, b.SR,
    bw.Overs, bw.Maidens, bw.Runs_conceded, bw.Wickets, bw.Economy, bw.Wides, bw.No_balls
FROM Batting b
LEFT JOIN Bowling bw 
    ON b.Player_name = bw.Player_name AND b.Matches_name = bw.Matches_name
WHERE b.Player_name = 'Aqib Ilyas'; -- Corrected bat bowl balance



--all stats for biratnagar





--trials

SELECT
    player_profiles.players_name, 
    player_profiles.players_type,
	--extra_bat.Total_batted,
    Batting.Matches_name, 
    Batting.Runs, 
    Batting.Balls, 
    Batting.Fours, 
    Batting.Sixes, 
    Batting.SR,
    Bowling.Overs, 
    Bowling.Maidens, 
    Bowling.Runs_conceded, 
    Bowling.Wickets, 
    Bowling.Economy, 
    Bowling.Wides, 
    Bowling.No_balls
FROM Batting
INNER JOIN player_profiles 
    ON Batting.Player_name = player_profiles.Players_name
	--INNER JOIN extra_bat ON
	--Batting.Player_name = extra_bat.Player_name
LEFT JOIN Bowling 
    ON Bowling.player_name = Batting.player_name 
   AND Batting.Matches_name = Bowling.Matches_name
WHERE player_profiles.Team_name = 'Biratnagar Kings'
ORDER BY Batting.Player_name, Batting.Matches_name;




WITH cleaned_extra_bat AS (
  SELECT Player_name, MAX(Total_batted) AS Total_batted
  FROM extra_bat
  GROUP BY Player_name
),
cleaned_batting AS (
  SELECT DISTINCT ON (Player_name, Matches_name) *
  FROM Batting
  ORDER BY Player_name, Matches_name
)



	
WITH unique_extra_bat AS (
  SELECT DISTINCT ON (Player_name) * FROM extra_bat
)

SELECT
    player_profiles.players_name, 
    player_profiles.players_type,
	unique_extra_bat.Total_batted,
    Batting.Matches_name, 
    Batting.Runs, 
    Batting.Balls, 
    Batting.Fours, 
    Batting.Sixes, 
    Batting.SR,
    Bowling.Overs, 
    Bowling.Maidens, 
    Bowling.Runs_conceded, 
    Bowling.Wickets, 
    Bowling.Economy, 
    Bowling.Wides, 
    Bowling.No_balls
FROM Batting
INNER JOIN player_profiles 
    ON Batting.Player_name = player_profiles.Players_name
INNER JOIN unique_extra_bat 
    ON Batting.Player_name = unique_extra_bat.Player_name
LEFT JOIN Bowling 
    ON Bowling.player_name = Batting.player_name 
   AND Batting.Matches_name = Bowling.Matches_name
WHERE player_profiles.Team_name = 'Sudurpaschim Royals'
ORDER BY Batting.Player_name, Batting.Matches_name;



--""""""""""""

