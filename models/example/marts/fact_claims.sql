{{ config(materialized='table', schema='GOLD') }}

SELECT
    c.claim_id,
    c.patient_id,
    c.provider_id,
    c.claim_date,
    c.diagnosis_code,
    c.procedure_code,
    c.claim_amount,
    c.paid_amount,
    c.claim_status,
    p.payment_date,
    p.payment_method,
    p.payment_amount
FROM {{ ref('stg_claims') }} c
LEFT JOIN {{ ref('stg_payments') }} p
    ON c.claim_id = p.claim_id