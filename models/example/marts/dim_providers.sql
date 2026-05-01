{{ config(materialized='table', schema='GOLD') }}

SELECT
    provider_id,
    provider_name,
    specialty,
    state
FROM {{ ref('stg_providers') }}