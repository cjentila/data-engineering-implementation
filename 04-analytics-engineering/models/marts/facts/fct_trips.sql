WITH TRIPS AS (
    SELECT *
    FROM {{ ref('int_trips') }}
),
UNIQUE_TRIPS AS (
    SELECT
        trip_id,
        vendor_id,
        rate_code_id,
        pickup_location_id,
        dropoff_location_id,

        -- Max timestamps due to duplicate trips which are just cummulative trip recorded
        MAX(pickup_datetime) pickup_datetime,
        MAX(dropoff_datetime) dropoff_datetime,
        MAX(trip_duration) trip_duration, -- Max trip_duration due to duplicate trips which are just cummulative trip recorded

        -- trip info
        store_and_fwd_flag,
        trip_type,
        passenger_count,
        SUM(trip_distance) trip_distance, -- Sum the trip_distance due to cumulative cases

        -- Sum the amounts due to refunds, and cumulative total of duplicate trip_ids
        SUM(fare_amount) fare_amount,
        SUM(extra) extra,
        SUM(mta_tax) mta_tax,
        SUM(tip_amount) tip_amount,
        SUM(tolls_amount) tolls_amount,
        SUM(ehail_fee) ehail_fee,
        SUM(improvement_surcharge) improvement_surcharge,
        SUM(congestion_surcharge) congestion_surcharge,
        SUM(total_amount) total_amount
    FROM TRIPS
    GROUP BY ALL
)
SELECT 
    *
FROM UNIQUE_TRIPS