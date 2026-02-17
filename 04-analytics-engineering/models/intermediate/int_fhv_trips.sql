select COUNT(*) fhv_trip_count
from {{ ref('stg_fhv_tripdata') }}