with source_salesorderdetail as (
    select
        cast(salesorderid as string) as salesorderid
        , cast(salesorderdetailid as string) as salesorderdetailid
        , cast(productid as string) as productid
        , cast(specialofferid as string) as specialofferid
        , cast(carriertrackingnumber as string) as carriertrackingnumber
        , cast(orderqty as int) as orderqty
        , cast(unitprice as numeric(18,2)) as unitprice
        , cast(unitpricediscount as numeric(18,4)) as unitpricediscount
        
    from {{ source('raw_data_aw', 'salesorderdetail') }}
)

select * 
from source_salesorderdetail