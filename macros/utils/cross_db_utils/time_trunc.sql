{# Same as date trunc, but casts the time/date expression to timestamp #}
{% macro time_trunc(date_part, date_expression) -%}
    {{ return(adapter.dispatch('time_trunc', 'elementary') (date_part, date_expression)) }}
{%- endmacro %}

{% macro default__time_trunc(date_part, date_expression) %}
    date_trunc('{{date_part}}', cast({{ date_expression }} as {{ elementary.type_timestamp() }}))
{% endmacro %}

{% macro bigquery__time_trunc(date_part, date_expression) %}
    timestamp_trunc(cast({{ date_expression }} as timestamp), {{ date_part }})
{% endmacro %}

{% macro sqlserver__time_trunc(date_part, date_expression) %}
    {# datetrun only supported since sql server 2022 #}
    {%- if date_part == 'day' %}
        cast(cast({{ date_expression }} as date) as {{ elementary.type_timestamp() }})
    {%- endif %}
{% endmacro %}
