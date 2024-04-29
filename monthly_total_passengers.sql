{{
    config(
        materialized="table"
    )

}}

SELECT
  {{ convert_month('lpep_pickup_datetime') }} AS month_name,
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS tahun,
  SUM(passenger_count) AS passenger_sum,
  store_and_fwd_flag_bool,
  total_amount,
  {{ usd_to_idr('total_amount') }} AS amount_idr
FROM
  {{ ref('taxitrip') }}
GROUP BY
  tahun,
  month_name,
  total_amount,
  store_and_fwd_flag_bool
ORDER BY
  tahun,
  month_name
