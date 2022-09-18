--Alcohol Servings

--How does the alcohol service, provided by the restaurant, affect its rating?

SELECT RES.[Alcohol_Service],
		   COUNT (*) as 'num_of_resturants', 
			AVG( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
			AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat',
			AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat',
					(AVG ( CAST ( RAT.[Overall_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))))
					/3 AS 'Avg_Total_Rat'
FROM [restaurants] AS RES
INNER JOIN [ratings] AS RAT
ON RES.[Restaurant_ID] = RAT.[Restaurant_ID]
GROUP BY RES.[Alcohol_Service]			
ORDER BY COUNT (*) DESC

--Based on the customer's drink-level, do you see any difference in the trend of ratings?

SELECT CON.[Drink_Level],
	   COUNT (*) as 'num_of_consumers', 
		AVG ( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
		AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat', 
		AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat',
					(AVG ( CAST ( RAT.[Overall_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))))
					/3 AS 'Avg_Total_Rat'
FROM [ratings] AS RAT
INNER JOIN [consumers] AS CON
ON RAT.[Consumer_ID] = CON.[Consumer_ID]
GROUP BY CON.[Drink_Level]
ORDER BY COUNT (*) DESC

-- The effect of alcohol service on rating divided by consumer's drink level
SELECT CON.[Drink_Level], RES.[Alcohol_Service],
		   COUNT (*) as 'num_of_consumers', 
			AVG ( CAST ( RAT.[Overall_Rating] as decimal (8,3))) AS 'Avg_Overall_Rat',
			AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) AS 'Avg_Ser_Rat', 
			AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))) AS 'Avg_Food_Rat',
					(AVG ( CAST ( RAT.[Overall_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Service_Rating] as decimal (8,3))) +
					AVG( CAST ( RAT.[Food_Rating] as decimal (8,3))))
					/3 AS 'Avg_Total_Rat'
FROM [ratings] AS RAT
INNER JOIN [consumers] AS CON
ON RAT.[Consumer_ID] = CON.[Consumer_ID]
INNER JOIN [restaurants] AS RES
ON  RES.[Restaurant_ID] = RAT.[Restaurant_ID]
GROUP BY CON.[Drink_Level], RES.[Alcohol_Service]
ORDER BY  RES.[Alcohol_Service]
	


