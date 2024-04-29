{% macro pay_type(RatecodeID) %}
    CASE
        WHEN RatecodeID = 1 THEN 'Credit card'
        WHEN RatecodeID = 2 THEN 'Cash'
        WHEN RatecodeID = 3 THEN 'No charge'
        WHEN RatecodeID = 4 THEN 'Dispute'
        WHEN RatecodeID = 5 THEN 'Unknown'
        WHEN RatecodeID = 6 THEN 'Voided trip'
        ELSE 'Invalid code'
    END
{% endmacro %}
