{% macro current_timestamp() -%}
    {% if dbt_version >= '1.2.0' %}
        {# This macro is depricated from dbt_utils version 0.9.0, but still hasn't got an equivalent macro at dbt-core #}
        {# Should be replaced to the equivalent macro once it released #}
        {{ return(adapter.dispatch('current_timestamp', 'dbt_utils')) }}
    {% else %}
        {{ return(adapter.dispatch('current_timestamp', 'dbt_utils')) }}
    {% endif %}
{%- endmacro %}

{% macro current_timestamp_in_utc() %}
    {{ return(adapter.dispatch('current_timestamp_in_utc','elementary')()) }}
{% endmacro %}

{% macro default__current_timestamp_in_utc() -%}
    {% if dbt_version >= '1.2.0' %}
        {# This macro is depricated from dbt_utils version 0.9.0, but still hasn't got an equivalent macro at dbt-core #}
        {# Should be replaced to the equivalent macro once it released #}
        {{ return(dbt_utils.current_timestamp_in_utc()) }}
    {% else %}
        {{ return(dbt_utils.current_timestamp_in_utc()) }}
    {% endif %}
{%- endmacro %}

{% macro sqlserver__current_timestamp_in_utc() -%}
    GETUTCDATE()
{%- endmacro %}
