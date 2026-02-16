SELECT 

    -- iDs
    SAFE_CAST(VendorID AS INTEGER) vendor_id, 
    SAFE_CAST(RatecodeID AS INTEGER) ratecode_id, 
    SAFE_CAST(PULocationID AS INTEGER) pickup_location_id,
    SAFE_CAST(DOLocationID AS INTEGER) dropoff_location_id, 

    -- timestamps
    SAFE_CAST(lpep_pickup_datetime AS TIMESTAMP) pickup_datetime, 
    SAFE_CAST(lpep_dropoff_datetime AS TIMESTAMP) dropoff_datetime, 

    -- trip info
    SAFE_CAST(store_and_fwd_flag AS BOOLEAN) store_and_fwd_flag, 
    SAFE_CAST(trip_type AS INTEGER) trip_type, 
    SAFE_CAST(passenger_count AS INTEGER) passenger_count, 
    SAFE_CAST(trip_distance AS INTEGER) trip_distance, 

    -- payment info
    SAFE_CAST(payment_type AS INTEGER) AS payment_type, 
    SAFE_CAST(fare_amount AS NUMERIC) fare_amount, 
    SAFE_CAST(extra AS NUMERIC) extra, 
    SAFE_CAST(mta_tax AS NUMERIC) mta_tax, 
    SAFE_CAST(tip_amount AS NUMERIC) tip_amount, 
    SAFE_CAST(tolls_amount AS NUMERIC) tolls_amount, 
    SAFE_CAST(ehail_fee AS NUMERIC) ehail_fee, 
    SAFE_CAST(improvement_surcharge AS NUMERIC) improvement_surcharge, 
    SAFE_CAST(total_amount AS NUMERIC) total_amount, 
    SAFE_CAST(congestion_surcharge AS NUMERIC) congestion_surcharge
FROM {{ source('raw_data', 'green_tripdata_partitioned') }} 
WHERE lpep_pickup_datetime BETWEEN '2019-02-01' AND '2019-02-28'
AND NULLIF(VendorID, '') IS NOT NULL
