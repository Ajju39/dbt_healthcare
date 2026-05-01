{{ config(materialized='table', schema='GOLD') }}

SELECT
    patient_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    state,
    DATEDIFF(year, date_of_birth, CURRENT_DATE()) AS patient_age
FROM {{ ref('stg_patients') }}