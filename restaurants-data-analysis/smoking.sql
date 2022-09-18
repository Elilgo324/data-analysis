--Smoking Areas

SELECT *
FROM consumers

SELECT *
FROM ratings

SELECT *
FROM restaurants 


--7

--general avg

SELECT AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings


--rating avg per smokers and non smokers

SELECT  c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  consumers AS c       ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'Yes'
GROUP BY  c.Smoker

SELECT  c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  consumers AS c       ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'No'
GROUP BY  c.Smoker

--num of smokers and non smokers

SELECT COUNT(Smoker) AS "num smokers"
FROM consumers
WHERE Smoker = 'Yes'

SELECT COUNT(Smoker) AS "num not smokers"
FROM consumers
WHERE Smoker = 'No'


--avg per smoking allowed

SELECT  re.Smoking_Allowed, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
WHERE re.Smoking_Allowed = 'Yes'
GROUP BY  re.Smoking_Allowed

SELECT  re.Smoking_Allowed, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
WHERE re.Smoking_Allowed = 'No'
GROUP BY  re.Smoking_Allowed

SELECT  re.Smoking_Allowed, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
WHERE re.Smoking_Allowed = 'Smoking Section'
GROUP BY  re.Smoking_Allowed

--avg per smokers and smoking allowed


SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'Yes' AND re.Smoking_Allowed = 'Yes'
GROUP BY  re.Smoking_Allowed, c.Smoker

SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'Yes' AND re.Smoking_Allowed = 'No'
GROUP BY  re.Smoking_Allowed, c.Smoker

SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'Yes' AND re.Smoking_Allowed = 'Smoking Section' 
GROUP BY  re.Smoking_Allowed, c.Smoker

---avg per  non smokers and smoking allowed

SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'No' AND re.Smoking_Allowed = 'Yes'
GROUP BY  re.Smoking_Allowed, c.Smoker

SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'No' AND re.Smoking_Allowed = 'No'
GROUP BY  re.Smoking_Allowed, c.Smoker


SELECT  re.Smoking_Allowed, c.Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN  restaurants AS re       ON rt.Restaurant_ID = re.Restaurant_ID
JOIN consumers AS c           ON rt.Consumer_ID = c.Consumer_ID
WHERE c.Smoker = 'No' AND re.Smoking_Allowed = 'Smoking Section'
GROUP BY  re.Smoking_Allowed, c.Smoker


SELECT Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN consumers AS c         ON rt.Consumer_ID = c.Consumer_ID
WHERE Smoker = 'Yes'
GROUP BY Smoker


SELECT Smoker, AVG(CAST(Overall_Rating AS float)) AS "avg_rating"
FROM ratings AS rt
JOIN consumers AS c         ON rt.Consumer_ID = c.Consumer_ID
WHERE Smoker = 'No'
GROUP BY Smoker

--count smoking allowd

SELECT  Smoking_Allowed, COUNT(Smoking_Allowed) AS "num_sm_allowed"
FROM restaurants
GROUP BY Smoking_Allowed
