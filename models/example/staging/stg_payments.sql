{{ config(materialized='view') }}

SELECT
    payment_id,
    claim_id,
    payment_date,
    payment_method,
    payment_amount
FROM HEALTHCARE_DB.RAW.PAYMENTS