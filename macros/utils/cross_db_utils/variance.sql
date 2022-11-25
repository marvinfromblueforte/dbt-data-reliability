{% macro variance(column_name) %}
    {{ return(adapter.dispatch('variance', 'elementary') (column_name)) }}
{% endmacro %}

{% macro default__variance(column_name) %}
    variance(cast({{ column_name }} as {{ elementary.type_float() }}))
{% endmacro %}

{% macro sqlserver__variance(column_name) %}
    variance(cast({{ column_name }} as {{ elementary.type_float() }}))
{% endmacro %}

