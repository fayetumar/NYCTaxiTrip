{{
    config(
        materialized="table"
    )

}}

SELECT
    * EXCEPT(
        ehail_fee,
        store_and_fwd_flag
    ),
    CASE
        WHEN store_and_fwd_flag = 'Y' THEN TRUE
        ELSE FALSE
    END AS store_and_fwd_flag_bool
FROM
    {{ ref('raw_taxi_tripdata') }}
