-- models/daily_new_cases.sql

WITH daily_cases AS (
    SELECT
        date,
        country,
        SUM(number_of_cases) AS total_cases
    FROM {{ source('covid19_epidemiological_data', 'cases') }}
    GROUP BY date, country
)

SELECT
    date,
    country,
    total_cases - LAG(total_cases, 1) OVER(PARTITION BY country ORDER BY date) AS daily_new_cases
FROM daily_cases
ORDER BY date, country;
