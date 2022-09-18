--Parking options
-- 4. How does the parking option, offered by each restaurant, affect its rating?

SELECT RES.[Parking],
	   COUNT (*) AS 'Num_of_resturants',
		AVG( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
		AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat',
		AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat'
FROM [restaurants] AS RES
INNER JOIN [ratings] AS RAT
ON RES.[Restaurant_ID] = RAT.[Restaurant_ID]
GROUP BY Parking	
ORDER BY COUNT (*) DESC

-- 5. Do you see any difference in the trend of ratings between car owners, and non car owners?

SELECT  CON.[Transportation_Method],
		COUNT (*) AS 'Num_of_consumers', 
		AVG( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
		AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat', 
		AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat'
FROM [ratings] AS RAT
INNER JOIN [consumers] AS CON
ON RAT.[Consumer_ID] = CON.[Consumer_ID]
GROUP BY CON.[Transportation_Method]
ORDER BY COUNT (*) DESC

---The effect of parking on rating among car owners 

SELECT RES.[Parking],
	   COUNT (*) AS 'Num_of_resturants', 
		AVG( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
		AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat',
		AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat'
FROM [restaurants] AS RES
INNER JOIN [ratings] AS RAT
ON RES.[Restaurant_ID] = RAT.[Restaurant_ID]
INNER JOIN [consumers] AS CON
ON RAT.[Consumer_ID] = CON.[Consumer_ID]
WHERE  CON.[Transportation_Method] = 'CAR'
GROUP BY Parking, CON.[Transportation_Method]
ORDER BY COUNT (*) DESC


