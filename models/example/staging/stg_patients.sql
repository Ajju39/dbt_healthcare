{{ config(materialized='view') }}

SELECT
    patient_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    state
FROM HEALTHCARE_DB.RAW.PATIENTS