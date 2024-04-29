{% macro convert_month(lpep_pickup_datetime) %}
  CASE
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 1 THEN 'January'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 2 THEN 'February'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 3 THEN 'March'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 4 THEN 'April'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 5 THEN 'May'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 6 THEN 'June'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 7 THEN 'July'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 8 THEN 'August'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 9 THEN 'September'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 10 THEN 'October'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 11 THEN 'November'
    WHEN EXTRACT(MONTH FROM {{ lpep_pickup_datetime }}) = 12 THEN 'December'
    ELSE 'Invalid month'
  END
{% endmacro %}
