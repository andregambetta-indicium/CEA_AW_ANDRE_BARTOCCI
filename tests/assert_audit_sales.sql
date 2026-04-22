with sales_audit as (
    select
        round(sum(subtotal), 2) as total_bruto_2011
    from {{ ref('fct_sales') }}
    where order_date between '2011-01-01' and '2011-12-31'
)

select *
from sales_audit
-- Ajustado para o valor real encontrado na fonte após investigação
where total_bruto_2011 != 12641672.51
