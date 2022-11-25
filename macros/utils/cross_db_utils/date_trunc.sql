{% macro date_trunc(datepart, date) %}
    {% if dbt_version >= '1.2.0' %}
        {{ return(dbt.date_trunc(datepart, date)) }}
    {% else %}
        {{ return(adapter.dispatch('datepart', 'dbt_utils')(datepart, date)) }}
    {% endif %}
{% endmacro %}
