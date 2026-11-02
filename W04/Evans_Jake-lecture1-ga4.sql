-- ============================================================
-- IC/CP-W04 BigQuery SQL Lecture 1 — SQL Basics
-- Author: Jake Evans
-- Dataset: bigquery-public-data.ga4_obfuscated_sample_ecommerce
-- Schema reference: https://support.google.com/analytics/answer/7029846
-- ============================================================


-- ------------------------------------------------------------
-- 1) SELECT / FROM / LIMIT
-- Picks columns from a table and returns rows.
-- ------------------------------------------------------------
SELECT event_date, event_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
LIMIT 20;


-- ------------------------------------------------------------
-- 2) WHERE filters rows
-- Keeps only rows that match conditions.
-- ------------------------------------------------------------
SELECT event_date, event_name, user_pseudo_id
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
LIMIT 50;


-- ------------------------------------------------------------
-- 3) ORDER BY sorts results
-- Sorts rows ascending/descending.
-- ------------------------------------------------------------
SELECT event_date, event_timestamp, event_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
ORDER BY event_timestamp DESC
LIMIT 20;

-- 3b) Readability tip: GA4 timestamps are in microseconds
SELECT TIMESTAMP_MICROS(event_timestamp) AS event_time,
       event_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
ORDER BY event_timestamp DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 4) COUNT, SUM, AVG, MIN, MAX
-- Summarize many rows into a few values.
-- ------------------------------------------------------------

-- 4a) Count total events in a date range
SELECT COUNT(*) AS event_count
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231';

-- 4b) Count purchases in a date range
SELECT COUNT(*) AS purchase_events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
  AND _TABLE_SUFFIX BETWEEN '20201201' AND '20201231';


-- ------------------------------------------------------------
-- 5) GROUP BY controls the grain
-- Defines what one row in the result represents.
-- ------------------------------------------------------------

-- 5a) Events by day
SELECT event_date, COUNT(*) AS events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
GROUP BY event_date
ORDER BY event_date;

-- 5b) Top event types
SELECT event_name, COUNT(*) AS events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
GROUP BY event_name
ORDER BY events DESC
LIMIT 15;


-- ------------------------------------------------------------
-- 6) HAVING filters after grouping
-- Filters aggregated results (after GROUP BY).
-- ------------------------------------------------------------

-- Only event types with at least 50,000 events
SELECT event_name, COUNT(*) AS events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
GROUP BY event_name
HAVING COUNT(*) >= 50000
ORDER BY events DESC;


-- ------------------------------------------------------------
-- 7) Wildcard tables + _TABLE_SUFFIX
-- events_* queries many daily tables; _TABLE_SUFFIX limits
-- which days are scanned (faster/cheaper).
-- ------------------------------------------------------------
SELECT event_date, COUNT(*) AS events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201207'
GROUP BY event_date
ORDER BY event_date;
