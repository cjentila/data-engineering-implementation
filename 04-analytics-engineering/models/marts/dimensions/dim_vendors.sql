SELECT DISTINCT 
    vendor_id,
    {{ get_vendor_name('vendor_id') }} AS vendor_name
FROM {{ ref('int_trips_union') }}