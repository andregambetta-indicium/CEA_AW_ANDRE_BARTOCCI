with source_customer as (
    select
        /* Primary Key */
        cast(customerid as string) as customerid
        
        /* Foreign Keys */
        , cast(personid as string) as personid
        , cast(storeid as string) as storeid
        , cast(territoryid as string) as territoryid
        
    from {{ source('raw_data_aw', 'customer') }}
)

select * 
from source_customer