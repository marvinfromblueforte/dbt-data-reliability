{% macro date_trunc(datepart, date) %}
    {% if dbt_version >= '1.2.0' %}
        {{ return(dbt.date_trunc(datepart, date)) }}
    {% else %}
        {{ return(adapter.dispatch('date_trunc', 'dbt_utils')(datepart, date)) }}
    {% endif %}
{% endmacro %}
