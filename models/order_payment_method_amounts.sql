{# setting variables to improve readability #}
{# %- can be used to control whitespace #}

-- {% set payment_methods = get_payment_methods() -%}
{# can use the macro from the dbt_utils package instead of our own #}


{# for loop for more DRY code #}
{# loop.last allows you to run code under the condition that you are not at the last iteration of a loop #}
{# here, we use it for commas between columns, but don't want a trailing comma after last column #}
{%- set payment_methods = dbt_utils.get_column_values(table=ref('raw_payments'), column='payment_method') -%}

select
order_id, 
{%- for payment_method in payment_methods %}
sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount
{%- if not loop.last %},{% endif -%}
{%- endfor %}
from {{ ref('raw_payments') }}
group by 1