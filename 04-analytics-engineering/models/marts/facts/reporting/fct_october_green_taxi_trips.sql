-- Data mart for monthly revenue analysis by pickup zone and service type
-- This aggregation is optimized for business reporting and dashboards
-- Enables analysis of revenue trends across different zones and taxi types
SELECT 
    service_type,
    SUM(total_monthly_trips) total_trips
FROM {{ ref('fct_monthly_zone_revenue') }}
WHERE revenue_month = '2019-10-01'
GROUP BY ALL
ORDER BY service_type DESC