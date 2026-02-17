{%  macro get_trip_type_name(trip_type) %}
CASE
    WHEN {{ trip_type }} = 1 THEN 'Street-hail'
    WHEN {{ trip_type }} = 2 THEN 'Dispatch'
    ELSE 'Unknown'
END
{% endmacro %}
