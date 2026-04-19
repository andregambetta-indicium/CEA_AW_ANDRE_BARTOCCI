with source_salesorderheader as (
    select
        /* Primary Key & Foreign Keys - Cast as string for identifier consistency */
        cast(salesorderid as string) as salesorderid
        , cast(customerid as string) as customerid
        , cast(salespersonid as string) as salespersonid
        , cast(territoryid as string) as territoryid
        , cast(billtoaddressid as string) as billtoaddressid
        , cast(shiptoaddressid as string) as shiptoaddressid
        , cast(shipmethodid as string) as shipmethodid
        , cast(creditcardid as string) as creditcardid
        , cast(currencyrateid as string) as currencyrateid
        
        /* Dates - Cast from timestamp to date to remove 00:00:00 */
        , cast(orderdate as date) as orderdate
        , cast(duedate as date) as duedate
        , cast(shipdate as date) as shipdate
        
        /* Status & Flags */
        , cast(status as int) as status
        , cast(revisionnumber as int) as revisionnumber
        , cast(onlineorderflag as boolean) as onlineorderflag
        
        /* Document Numbers & Codes */
        , cast(purchaseordernumber as string) as purchaseordernumber
        , cast(accountnumber as string) as accountnumber
        , cast(creditcardapprovalcode as string) as creditcardapprovalcode
        
        /* Financial Values - Standardized to 2 decimal places using numeric(18,2) */
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as taxamt
        , cast(freight as numeric(18,2)) as freight
        , cast(totaldue as numeric(18,2)) as totaldue
        
    from {{ source('raw_data_aw', 'salesorderheader') }}
)

select * 
from source_salesorderheader