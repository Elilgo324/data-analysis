
----Prices
----How does the restaurant price affect its rating?


SELECT *
FROM restaurants AS RE
INNER JOIN ratings AS RA 
ON RA.Restaurant_ID= RE.Restaurant_ID

SELECT*
FROM restaurants
SELECT 
COUNT(Price) AS 'LOW'
FROM restaurants 
WHERE Price = 'Low'

SELECT 
COUNT(Price) AS 'MD'
FROM restaurants 
WHERE Price = 'Medium'

SELECT 
COUNT(Price) AS 'HG'
FROM restaurants 
WHERE Price = 'High'



	SELECT RE.Price,
	   AVG(CAST(RA.overall_rating AS DECIMAL)) AS 'avg_overall_rating',
	   AVG(CAST(RA.food_rating AS DECIMAL)) AS 'avg_food_rating',
	   AVG(CAST(RA.service_rating AS DECIMAL)) AS 'avg_service_rating'
	 
	 FROM restaurants AS RE
	INNER JOIN ratings AS RA 
	ON RA.Restaurant_ID= RE.Restaurant_ID
	GROUP BY Price




	SELECT price
	FROM restaurants
	ORDER BY Price


--Which type of restaurant (by price), is preferred by customers with a high budget?
 
SELECT *
FROM consumers
WHERE Budget='High'

SELECT Budget 
--COUNT(Budget) 
FROM consumers

SELECT 
COUNT(Budget) AS 'LOWBudget'
FROM consumers
WHERE Budget = 'Low'


SELECT 
COUNT(Budget) AS 'MEDBudget'
FROM consumers
WHERE Budget = 'Medium'

SELECT 
COUNT(Budget) AS 'HIGHBudget'
FROM consumers
WHERE Budget = 'High'

 
SELECT [Budget],[Price],
AVG(CAST(Overall_Rating AS float)) AS avg_rating
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='High'
GROUP BY [Price], [Budget]



SELECT [Budget],[Price],
AVG(CAST(Overall_Rating AS float)) AS avg_rating
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='Medium'
GROUP BY [Price], [Budget] 

SELECT [Budget],[Price],
AVG(CAST(Overall_Rating AS float)) AS avg_rating
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='Low'
GROUP BY [Price], [Budget]






SELECT CO.[Consumer_ID],[Budget],RA.[Restaurant_ID],[Price]
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget IN ('High','Medium', 'Low')
ORDER BY  Budget



SELECT [Price],
COUNT(*) AS 'count_price_High_Budget'
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='High'
GROUP BY Price
ORDER BY  [Price]


SELECT [Price],
COUNT(*) AS 'count_price_Medium_Budget'
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='Medium'
GROUP BY Price
ORDER BY  [Price]

SELECT [Price],
COUNT(*) AS 'count_price_Low_Budget'
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='Low'
GROUP BY Price
ORDER BY  [Price]



SELECT [Price],
COUNT(*) AS count_price
FROM consumers AS CO
INNER JOIN ratings AS RA 
ON CO.[Consumer_ID]=RA.Consumer_ID
INNER JOIN restaurants AS RE 
ON RE.Restaurant_ID=RA.Restaurant_ID
WHERE Budget='High'
GROUP BY Price
HAVING COUNT(*) > 10
ORDER BY  [Price]





