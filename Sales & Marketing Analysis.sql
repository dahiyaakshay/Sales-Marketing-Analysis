CREATE TABLE customer_data (
    CustomerID SERIAL PRIMARY KEY,
    Country VARCHAR(50),
    AgeGroup VARCHAR(10),
    Gender VARCHAR(10),
    MarketingChannel VARCHAR(50),
    CustomerJourneyStage VARCHAR(50),
    Spent NUMERIC(10, 2),
    Clicks INT,
    Conversions INT,
    Date TIMESTAMP
);

-- Primary Question: What is the total spending by customers in each country?
-- Secondary Question: Which countries are generating the highest revenue?
-- Need: Understanding which countries generate the most revenue helps in identifying key markets and regions where marketing and sales efforts should be concentrated to maximize ROI.
SELECT Country, SUM(Spent) AS TotalSpent
FROM customer_data
GROUP BY Country
ORDER BY TotalSpent DESC;

-- Primary Question: What is the average spending by customers in each age group?
-- Secondary Question: Which age groups spend the most on our products/services?
-- Need: Knowing which age groups spend the most helps in tailoring marketing strategies and product offerings to better meet the needs and preferences of the most profitable demographics.
SELECT AgeGroup, ROUND(AVG(Spent), 2) AS AvgSpent
FROM customer_data
GROUP BY AgeGroup
ORDER BY AvgSpent DESC;

-- Primary Question: What is the distribution of customers by gender?
-- Secondary Question: What is the gender distribution of our customer base?
-- Need: Understanding the gender distribution of customers allows for more targeted marketing campaigns and helps in addressing any gender-specific preferences or needs.
SELECT Gender, COUNT(*) AS TotalCustomers
FROM customer_data
GROUP BY Gender
ORDER BY TotalCustomers DESC;

-- Primary Question: Which marketing channels generate the most clicks?
-- Secondary Question: Which marketing channels are driving the most traffic to our site?
-- Need: Identifying the most effective marketing channels helps in optimizing marketing spend and efforts by focusing on channels that generate the most engagement and potential leads.
SELECT MarketingChannel, SUM(Clicks) AS TotalClicks
FROM customer_data
GROUP BY MarketingChannel
ORDER BY TotalClicks DESC;

-- Primary Question: What is the conversion rate for each marketing channel?
-- Secondary Question: Which marketing channels have the highest conversion rates?
-- Need: Understanding which channels have the highest conversion rates helps in determining the most effective ways to convert leads into customers, thereby improving overall marketing effectiveness.
SELECT MarketingChannel, 
       AVG(CASE WHEN Clicks > 0 THEN Conversions::FLOAT / Clicks ELSE NULL END) AS ConversionRate
FROM customer_data
GROUP BY MarketingChannel
ORDER BY ConversionRate DESC;

-- Primary Question: What is the total number of conversions by country and age group?
-- Secondary Question: Which demographics are converting the most?
-- Need: Knowing which countries and age groups have the highest conversion rates helps in tailoring marketing and sales strategies to specific demographics that are more likely to convert.
SELECT Country, AgeGroup, SUM(Conversions) AS TotalConversions
FROM customer_data
GROUP BY Country, AgeGroup
ORDER BY TotalConversions DESC;

-- Primary Question: How does total spending change over time?
-- Secondary Question: Are there any trends or seasonality in customer spending?
-- Need: Analyzing spending trends over time helps in forecasting future revenue, planning marketing campaigns, and preparing for seasonal demand fluctuations.
SELECT Date::DATE AS Date, SUM(Spent) AS TotalSpent
FROM customer_data
GROUP BY Date::DATE
ORDER BY Date::DATE;

-- Primary Question: What is the total spending by customers at each stage of the customer journey?
-- Secondary Question: Which stages of the customer journey generate the most revenue?
-- Need: Understanding revenue generation at different stages of the customer journey helps in identifying where customers are most likely to spend and in optimizing strategies to move customers through the journey effectively.
SELECT CustomerJourneyStage, SUM(Spent) AS TotalSpent
FROM customer_data
GROUP BY CustomerJourneyStage
ORDER BY TotalSpent DESC;

-- Primary Question: What is the average number of conversions at each stage of the customer journey?
-- Secondary Question: Which stages of the customer journey have the highest conversion rates?
-- Need: Knowing the conversion rates at each stage of the customer journey helps in identifying bottlenecks and opportunities to improve the customer experience and increase conversions.
SELECT CustomerJourneyStage, 
       ROUND(AVG(Conversions), 2) AS AvgConversions
FROM customer_data
GROUP BY CustomerJourneyStage
ORDER BY AvgConversions DESC;