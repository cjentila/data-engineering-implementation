-- Data mart for monthly revenue analysis by pickup zone and service type
-- This aggregation is optimized for business reporting and dashboards
-- Enables analysis of revenue trends across different zones and taxi types
SELECT 
    pickup_zone,
    SUM(revenue_monthly_total_amount) revenue_amount
FROM {{ ref('fct_monthly_zone_revenue') }}
WHERE service_type = 'Green'
AND date_trunc(revenue_month, year) = '2020-01-01'
GROUP BY ALL
ORDER BY revenue_amount DESC
LIMIT 1