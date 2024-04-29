{{
    config(
        materialized="table"
    )

}}

SELECT
  {{ convert_month('lpep_pickup_datetime') }} AS month_name,
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS tahun,
  store_and_fwd_flag_bool,
  RatecodeID,
  {{ rcode_info('RatecodeID') }} AS RatecodeID_info,
  total_amount,
  {{ usd_to_idr('total_amount') }} as amount_idr,
  SUM(trip_distance) AS trip_distance_sum
FROM
  {{ ref('taxitrip') }}
GROUP BY
  tahun,
  month_name,
  RatecodeID,
  RatecodeID_info,
  total_amount,
  store_and_fwd_flag_bool
ORDER BY
  tahun,
  month_name,
  RatecodeID
