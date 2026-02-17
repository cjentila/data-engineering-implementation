SELECT DISTINCT 
    trip_type,
    {{ get_trip_type_name('trip_type') }} AS trip_type_name
FROM {{ ref('int_trips_union') }}