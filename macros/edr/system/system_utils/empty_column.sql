{% macro empty_column(column_name, data_type) %}
    {{ adapter.dispatch('empty_column','elementary')(column_name, data_type) }}
{% endmacro %}


{% macro default__empty_column(column_name, data_type) %}

    {%- set dummy_values = elementary.dummy_values() %}

    {%- if data_type == 'boolean' %}
        cast ({{ dummy_values['boolean'] }} as {{ elementary.type_bool()}}) as {{ column_name }}
    {%- elif data_type == 'timestamp' -%}
        cast('{{ dummy_values['timestamp'] }}' as {{ elementary.type_timestamp() }}) as {{ column_name }}
    {%- elif data_type == 'int' %}
        cast({{ dummy_values['int'] }} as {{ elementary.type_int() }}) as {{ column_name }}
    {%- elif data_type == 'bigint' %}
        cast({{ dummy_values['bigint'] }} as {{ elementary.type_bigint() }}) as {{ column_name }}
    {%- elif data_type == 'float' %}
        cast({{ dummy_values['float'] }} as {{ elementary.type_float() }}) as {{ column_name }}
    {%- elif data_type == 'long_string' %}
        cast('{{ dummy_values['long_string'] }}' as {{ elementary.type_long_string() }}) as {{ column_name }}
    {%- else %}
        cast('{{ dummy_values['string'] }}' as {{ elementary.type_string() }}) as {{ column_name }}
    {%- endif %}

{% endmacro %}

{% macro sqlserver__empty_column(column_name, data_type) %}

    {%- set dummy_values = elementary.dummy_values() %}

    {%- if data_type == 'boolean' %}
        {%- if dummy_values['boolean'] %}
            cast (1 as {{ elementary.type_bool()}}) as {{ column_name }}
        {%- else %}
            cast (0 as {{ elementary.type_bool()}}) as {{ column_name }}
        {%- endif %}
    {%- elif data_type == 'timestamp' -%}
        cast('{{ dummy_values['timestamp'] }}' as {{ elementary.type_timestamp() }}) as {{ column_name }}
    {%- elif data_type == 'int' %}
        cast({{ dummy_values['int'] }} as {{ elementary.type_int() }}) as {{ column_name }}
    {%- elif data_type == 'bigint' %}
        cast({{ dummy_values['bigint'] }} as {{ elementary.type_bigint() }}) as {{ column_name }}
    {%- elif data_type == 'float' %}
        cast({{ dummy_values['float'] }} as {{ elementary.type_float() }}) as {{ column_name }}
    {%- elif data_type == 'long_string' %}
        cast('{{ dummy_values['long_string'] }}' as {{ elementary.type_long_string() }}) as {{ column_name }}
    {%- else %}
        cast('{{ dummy_values['string'] }}' as {{ elementary.type_string() }}) as {{ column_name }}
    {%- endif %}

{% endmacro %}
