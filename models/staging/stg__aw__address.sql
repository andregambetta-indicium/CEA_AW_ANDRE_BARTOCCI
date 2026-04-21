with source_address as (
    select
        cast(addressid as string) as addressid
        , cast(stateprovinceid as string) as stateprovinceid
        , cast(addressline1 as string) as addressline1
        , cast(addressline2 as string) as addressline2
        , cast(city as string) as city
        , cast(postalcode as string) as postalcode
        , cast(spatiallocation as string) as spatiallocation
        
    from {{ source('raw_data_aw', 'address') }}
)

select * 
from source_address