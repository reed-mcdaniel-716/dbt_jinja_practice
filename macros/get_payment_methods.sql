{# first macro #}
{# takes two args for the column name and relation (either a table or a view) #}
{% macro get_column_values(column_name, relation) %}

{% set relation_query %}
select distinct
{{ column_name }}
from {{ relation }}
order by 1
{% endset %}

{% set results = run_query(relation_query) %}

{# condensing returned query to a list of unique column values #}
{# We used the execute variable to ensure that the code runs during the parse stage of dbt (otherwise an error would be thrown). #}
{# We used Agate methods to get the column back as a list #}
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{# return value #}
{{ return(results_list) }}

{% endmacro %}

{# second macro (uses first) #}
{% macro get_payment_methods() %}

{{ return(get_column_values('payment_method', ref('raw_payments'))) }}

{% endmacro %}
