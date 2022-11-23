{% macro standard_deviation(column_name) %}
    {{ return(adapter.dispatch('standard_deviation', 'elementary') (column_name)) }}
{% endmacro %}

{% macro default__standard_deviation(column_name) %}
    stddev(cast({{ column_name }} as {{ elementary.type_float() }}))
{% endmacro %}

{% macro sqlserver__standard_deviation(column_name) %}
    stdev(cast({{ column_name }} as {{ elementary.type_float() }}))
{% endmacro %}

