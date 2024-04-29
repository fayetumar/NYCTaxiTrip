{% macro usd_to_idr(total_amount) %}
    ({{ total_amount }} * 16241 )
{% endmacro %}
