WITH TRIPS AS (
    SELECT
        MD5(
            vendor_id || 
            pickup_location_id || 
            pickup_datetime || 
            dropoff_location_id || 
            dropoff_datetime || 
            trip_type
        ) AS trip_id,
        *,
        TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE) AS trip_duration
    FROM {{ ref('int_trips_union') }}
    WHERE store_and_fwd_flag = true
),
TRIP_CUMULATIVE_AMOUNT AS (
    SELECT 
        *,
        SUM(total_amount) OVER(PARTITION BY trip_id ORDER BY trip_duration) cumulative_total_amount
    FROM TRIPS
)
SELECT 
    *
FROM TRIP_CUMULATIVE_AMOUNT