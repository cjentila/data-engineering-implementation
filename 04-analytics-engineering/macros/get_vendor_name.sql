{%  macro get_vendor_name(vendor_id) %}
CASE
    WHEN {{ vendor_id }} = 1 THEN 'Creative Mobile Technologies, LLC'
    WHEN {{ vendor_id }} = 2 THEN 'Curb Mobility, LLC'
    WHEN {{ vendor_id }} = 6 THEN 'Myle Technologies Inc'
    WHEN {{ vendor_id }} = 7 THEN 'Helix'
    ELSE 'Unknown Vendor'
END
{% endmacro %}
