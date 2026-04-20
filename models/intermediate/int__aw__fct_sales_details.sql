with sales_order_detail as (
    select * from {{ ref('stg__aw__salesorderdetail') }}
),

int_fct_sales_details as (
    select
        salesorderdetailid,
        salesorderid,
        productid,
        specialofferid,
        carriertrackingnumber,
        orderqty,
        unitprice,
        unitpricediscount,
        (unitprice * orderqty) as gross_total,
        (unitprice * (1 - unitpricediscount) * orderqty) as net_total

    from sales_order_detail
)

select * from int_fct_sales_details
