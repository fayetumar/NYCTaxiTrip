{{
    config(
        materialized="table"
    )

}}

SELECT
  {{ convert_month('lpep_pickup_datetime') }} AS month_name,
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS tahun,
  store_and_fwd_flag_bool,
  {{ pay_type('payment_type') }} as payment_type,
  total_amount,
  {{ usd_to_idr('total_amount') }} as amount_idr,
  COUNT(1) AS jumlah_transaksi
FROM
  {{ ref('taxitrip') }}
GROUP BY
  tahun,
  month_name,
  payment_type,
  total_amount,
  store_and_fwd_flag_bool
ORDER BY
  tahun,
  month_name,
  payment_type
