with source_customer as (
    select
        cast(customerid as string) as customerid
        , cast(personid as string) as personid
        , cast(storeid as string) as storeid
        , cast(territoryid as string) as territoryid
        
    from {{ source('raw_data_aw', 'customer') }}
)

select * 
from source_customer