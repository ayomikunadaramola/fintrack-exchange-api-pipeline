-- FinTrack Exchange Limited
-- SQL Business Analysis

-- Total number of currencies
SELECT COUNT(*) AS total_currencies
FROM exchange_rates; 

-- Number of distinct currencies
SELECT COUNT(DISTINCT currency_code) AS distinct_currencies
FROM exchange_rates;

-- Currency base
SELECT DISTINCT base_currency
FROM exchange_rates; 

-- Highest quoted exchange rate 
SELECT
    currency_code,
    exchange_rate
FROM exchange_rates
ORDER BY exchange_rate DESC
LIMIT 10; 

-- Lowest quoted exchange rate
SELECT
    currency_code,
    exchange_rate
FROM exchange_rates
ORDER BY exchange_rate ASC
LIMIT 10; 

-- Average Exchange Rate
SELECT
    ROUND(AVG(exchange_rate)::numeric, 4) AS average_exchange_rate
FROM exchange_rates; 

-- Currencies with rates greater than 100
SELECT
    currency_code,
    exchange_rate
FROM exchange_rates
WHERE exchange_rate > 100
ORDER BY exchange_rate DESC; 

-- Currencies with rates below 1
SELECT
    currency_code,
    exchange_rate
FROM exchange_rates
WHERE exchange_rate < 1
ORDER BY exchange_rate ASC; 

-- Currency codes beginning with "A"
SELECT
    currency_code,
    exchange_rate
FROM exchange_rates
WHERE currency_code LIKE 'A%'
ORDER BY currency_code;

-- Data retrieval timestamp
SELECT DISTINCT retrieved_at
FROM exchange_rates;