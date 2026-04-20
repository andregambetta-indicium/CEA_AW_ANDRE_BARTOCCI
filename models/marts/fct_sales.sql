with int_sales as (
    select * from {{ ref('int__aw__fct_sales') }}
)

select
    salesorderid as sales_order_id,
    customerid as customer_id,
    salespersonid as sales_person_id,
    territoryid as territory_id,
    billtoaddressid as billing_address_id,
    shiptoaddressid as shipping_address_id,
    shipmethodid as shipping_method_id,
    creditcardid as credit_card_id,
    currencyrateid as currency_rate_id,
    orderdate as order_date,
    duedate as due_date,
    shipdate as shipping_date,
    status as order_status,
    onlineorderflag as is_online_order,
    purchaseordernumber as purchase_order_number,
    accountnumber as account_number,
    creditcardapprovalcode as credit_card_approval_code,
    revisionnumber as revision_number,
    reasonname as sales_reason,
    reasontype as sales_reason_type,
    subtotal,
    taxamt as tax_amount,
    freight as freight_amount,
    totaldue as total_amount_due

from int_sales