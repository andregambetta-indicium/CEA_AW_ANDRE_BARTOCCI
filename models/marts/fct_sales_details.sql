with int_sales_details as (
    select * from {{ ref('int__aw__fct_sales_details') }}
)

select
    salesorderdetailid as sales_order_detail_id,
    salesorderid as sales_order_id,
    productid as product_id,
    specialofferid as special_offer_id,
    carriertrackingnumber as carrier_tracking_number,
    orderqty as order_quantity,
    unitprice as unit_price,
    unitpricediscount as unit_price_discount,
    gross_total,
    net_total

from int_sales_details
