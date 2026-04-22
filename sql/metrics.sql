-- Overall experiment performance by variant
SELECT
    variant,
    COUNT(*) AS total_users,
    SUM(clicked) AS total_clicks,
    SUM(converted) AS total_conversions,
    ROUND(SUM(clicked) * 100.0 / COUNT(*), 2) AS ctr,
    ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(*), 2) AS revenue_per_user
FROM experiment_results
GROUP BY variant
ORDER BY variant;

-- Click-to-conversion efficiency
SELECT
    variant,
    SUM(clicked) AS total_clicks,
    SUM(converted) AS total_conversions,
    ROUND(SUM(converted) * 100.0 / NULLIF(SUM(clicked), 0), 2) AS click_to_conversion_rate
FROM experiment_results
GROUP BY variant
ORDER BY variant;

-- Daily performance trend
SELECT
    event_date,
    variant,
    COUNT(*) AS users_exposed,
    SUM(converted) AS conversions,
    ROUND(SUM(revenue), 2) AS revenue
FROM experiment_results
GROUP BY event_date, variant
ORDER BY event_date, variant;
