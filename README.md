<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1>Sales & Marketing Analysis</h1>

<p>This repository contains SQL scripts for performing a comprehensive analysis of sales and marketing data. The primary objective is to gain insights into customer behavior, spending patterns, and the effectiveness of various marketing channels.</p>

<h2>Table of Contents</h2>
<ul>
    <li><a href="#overview">Overview</a></li>
    <li><a href="#data-schema">Data Schema</a></li>
    <li><a href="#analysis-questions">Analysis Questions</a></li>
    <li><a href="#queries-and-insights">Queries and Insights</a>
        <ul>
            <li><a href="#total-spending-by-country">Total Spending by Country</a></li>
            <li><a href="#average-spending-by-age-group">Average Spending by Age Group</a></li>
            <li><a href="#customer-distribution-by-gender">Customer Distribution by Gender</a></li>
            <li><a href="#clicks-by-marketing-channel">Clicks by Marketing Channel</a></li>
            <li><a href="#conversions-by-customer-journey-stage">Conversions by Customer Journey Stage</a></li>
        </ul>
</ul>

<h2 id="overview">Overview</h2>
<p>The SQL scripts in this repository are designed to analyze customer data from a sales and marketing perspective. The analysis helps in identifying key markets, understanding spending behavior across different demographics, and evaluating the performance of various marketing channels.</p>

<h2 id="data-schema">Data Schema</h2>
<p>The analysis is based on the following table schema:</p>

<pre>
<code>
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
</code>
</pre>

<h2 id="analysis-questions">Analysis Questions</h2>
<p>The SQL scripts address several key business questions:</p>
<ol>
    <li><strong>Total Spending by Country:</strong> What is the total spending by customers in each country?</li>
    <li><strong>Average Spending by Age Group:</strong> What is the average spending by customers in each age group?</li>
    <li><strong>Customer Distribution by Gender:</strong> What is the gender distribution of our customer base?</li>
    <li><strong>Clicks by Marketing Channel:</strong> Which marketing channels generate the most clicks?</li>
    <li><strong>Conversions by Customer Journey Stage:</strong> How do conversions vary across different stages of the customer journey?</li>
</ol>

<h2 id="queries-and-insights">Queries and Insights</h2>

<h3 id="total-spending-by-country">Total Spending by Country</h3>
<p><strong>Primary Question:</strong> What is the total spending by customers in each country?</p>
<p><strong>Insight:</strong> Understanding which countries generate the most revenue helps in identifying key markets and regions where marketing and sales efforts should be concentrated to maximize ROI.</p>

<pre>
<code>
SELECT Country, SUM(Spent) AS TotalSpent
FROM customer_data
GROUP BY Country
ORDER BY TotalSpent DESC;
</code>
</pre>

<h3 id="average-spending-by-age-group">Average Spending by Age Group</h3>
<p><strong>Primary Question:</strong> What is the average spending by customers in each age group?</p>
<p><strong>Insight:</strong> Knowing which age groups spend the most helps in tailoring marketing strategies and product offerings to better meet the needs and preferences of the most profitable demographics.</p>

<pre>
<code>
SELECT AgeGroup, ROUND(AVG(Spent), 2) AS AvgSpent
FROM customer_data
GROUP BY AgeGroup
ORDER BY AvgSpent DESC;
</code>
</pre>

<h3 id="customer-distribution-by-gender">Customer Distribution by Gender</h3>
<p><strong>Primary Question:</strong> What is the gender distribution of our customer base?</p>
<p><strong>Insight:</strong> Understanding the gender distribution of customers allows for more targeted marketing campaigns and helps in addressing any gender-specific preferences or needs.</p>

<pre>
<code>
SELECT Gender, COUNT(*) AS TotalCustomers
FROM customer_data
GROUP BY Gender
ORDER BY TotalCustomers DESC;
</code>
</pre>

<h3 id="clicks-by-marketing-channel">Clicks by Marketing Channel</h3>
<p><strong>Primary Question:</strong> Which marketing channels generate the most clicks?</p>
<p><strong>Insight:</strong> Identifying the most effective marketing channels helps in optimizing marketing spend and efforts by focusing on channels that generate the most engagement and potential leads.</p>

<pre>
<code>
SELECT MarketingChannel, SUM(Clicks) AS TotalClicks
FROM customer_data
GROUP BY MarketingChannel
ORDER BY TotalClicks DESC;
</code>
</pre>

<h3 id="conversions-by-customer-journey-stage">Conversions by Customer Journey Stage</h3>
<p><strong>Primary Question:</strong> How do conversions vary across different stages of the customer journey?</p>
<p><strong>Insight:</strong> Analyzing conversions by customer journey stage helps in understanding where potential customers drop off and where efforts should be focused to improve conversion rates.</p>

<pre>
<code>
SELECT CustomerJourneyStage, SUM(Conversions) AS TotalConversions
FROM customer_data
GROUP BY CustomerJourneyStage
ORDER BY TotalConversions DESC;
</code>
</pre>

</body>
</html>
