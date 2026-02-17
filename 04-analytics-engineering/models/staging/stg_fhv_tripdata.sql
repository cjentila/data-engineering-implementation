SELECT 
    CAST(dispatching_base_num AS STRING) AS dispatching_base_number, 
    SAFE_CAST(PULocationID AS INTEGER) pickup_location_id,
    SAFE_CAST(DOLocationID AS INTEGER) dropoff_location_id, 

    CAST(pickup_datetime AS TIMESTAMP) pickup_datetime, 
    CAST(dropOff_datetime AS TIMESTAMP) dropoff_datetime, 
    
    CAST(SR_Flag AS STRING) shared_ride_flag, 
    CAST(Affiliated_base_number AS STRING) affiliated_base_number
FROM {{ source('raw_data', 'fhv_tripdata') }}
WHERE dispatching_base_num IS NOT NULL