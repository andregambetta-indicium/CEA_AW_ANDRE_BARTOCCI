with sales_order_header as (
    select * from {{ ref('stg__aw__salesorderheader') }}
),

sales_order_detail_aggregated as (
    select
        salesorderid,
        count(salesorderdetailid) as total_items,
        sum(orderqty) as total_orderqty,
        sum(unitprice * orderqty) as gross_total,
        sum(unitprice * (1 - unitpricediscount) * orderqty) as net_total
    from {{ ref('stg__aw__salesorderdetail') }}
    group by 1
),

sales_reasons_aggregated as (
    select
        header_reason.salesorderid,
        listagg(reason.name, ', ') as reasonname,
        listagg(reason.reasontype, ', ') as reasontype
    from {{ ref('stg__aw__salesorderheadersalesreason') }} header_reason
    left join {{ ref('stg__aw__salesreason') }} reason 
        on header_reason.salesreasonid = reason.salesreasonid
    group by 1
),

int_fct_sales as (
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
        header.orderdate,
        header.duedate,
        header.shipdate,
        header.status,
        header.onlineorderflag,
        header.purchaseordernumber,
        header.accountnumber,
        header.creditcardapprovalcode,
        header.revisionnumber,
        reasons.reasonname,
        reasons.reasontype,
        detail.total_items,
        detail.total_orderqty,
        detail.gross_total,
        detail.net_total,
        header.subtotal,
        header.taxamt,
        header.freight,
        header.totaldue

    from sales_order_header header
    left join sales_order_detail_aggregated detail 
        on header.salesorderid = detail.salesorderid
    left join sales_reasons_aggregated reasons 
        on header.salesorderid = reasons.salesorderid
)

select * from int_fct_sales
