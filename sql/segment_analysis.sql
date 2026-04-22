-- Performance by device
SELECT
    variant,
    device,
    COUNT(*) AS total_users,
    SUM(converted) AS conversions,
    ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM experiment_results
GROUP BY variant, device
ORDER BY device, variant;

-- Performance by region
SELECT
    variant,
    user_region,
    COUNT(*) AS total_users,
    SUM(converted) AS conversions,
    ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM experiment_results
GROUP BY variant, user_region
ORDER BY user_region, variant;

-- Rank segments by revenue contribution
SELECT
    variant,
    user_region,
    SUM(revenue) AS total_revenue,
    RANK() OVER (PARTITION BY variant ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM experiment_results
GROUP BY variant, user_region
ORDER BY variant, revenue_rank;
