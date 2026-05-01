{{ config(materialized='view') }}

SELECT
    provider_id,
    provider_name,
    specialty,
    state
FROM HEALTHCARE_DB.RAW.PROVIDERS