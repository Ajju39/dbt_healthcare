{{ config(materialized='table', schema='GOLD') }}

SELECT
    DATE_TRUNC('month', claim_date) AS claim_month,
    COUNT(DISTINCT claim_id) AS total_claims,
    SUM(claim_amount) AS total_claim_amount,
    SUM(paid_amount) AS total_paid_amount,
    
    -- Denial Rate
    SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) 
        / COUNT(*) AS denial_rate,
    
    -- Avg Claim Amount
    AVG(claim_amount) AS avg_claim_amount

FROM {{ ref('fact_claims') }}

GROUP BY 1
ORDER BY 1