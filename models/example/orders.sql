-- source from the SAMPLE_DATA schema and ORDERS table

SELECT
    *
FROM
    {{ source('SAMPLE_DATA', 'ORDERS') }}