WITH green_tripdata AS (
    SELECT *
    FROM {{ ref('stg_green_tripdata') }}
),
yellow_tripdata AS (
    SELECT *
    FROM {{ ref('stg_yellow_tripdata') }}
),
union_tripdata AS (
    SELECT *
    FROM green_tripdata
    UNION ALL
    SELECT *
    FROM yellow_tripdata
)
SELECT *
FROM union_tripdata