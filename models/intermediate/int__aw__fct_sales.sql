with sales_order_header as (
    select * from {{ ref('stg__aw__salesorderheader') }}
),

sales_order_detail as (
    select * from {{ ref('stg__aw__salesorderdetail') }}
),

sales_order_header_reason as (
    select * from {{ ref('stg__aw__salesorderheadersalesreason') }}
),

sales_reason as (
    select * from {{ ref('stg__aw__salesreason') }}
),

int_sales as (
    select
        header.salesorderid,
        header.customerid,
        header.salespersonid,
        header.territoryid,
        header.billtoaddressid,
        header.shiptoaddressid,
        header.shipmethodid,
        header.creditcardid,
        header.currencyrateid,
        detail.salesorderdetailid,
        detail.productid,
        detail.specialofferid,
        header_reason.salesreasonid,
        header.orderdate,
        header.duedate,
        header.shipdate,
        header.status,
        header.onlineorderflag,
        header.purchaseordernumber,
        header.accountnumber,
        header.creditcardapprovalcode,
        header.revisionnumber,
        detail.carriertrackingnumber,
        reason.name as reasonname,
        reason.reasontype,
        detail.orderqty,
        detail.unitprice,
        detail.unitpricediscount,
        header.subtotal,
        header.taxamt,
        header.freight,
        header.totaldue

    from sales_order_header as header
    left join sales_order_detail as detail 
        on header.salesorderid = detail.salesorderid
    left join sales_order_header_reason as header_reason 
        on header.salesorderid = header_reason.salesorderid
    left join sales_reason as reason 
        on header_reason.salesreasonid = reason.salesreasonid
)

select * from int_sales
