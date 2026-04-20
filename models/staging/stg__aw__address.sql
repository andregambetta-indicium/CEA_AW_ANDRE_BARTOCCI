with source_address as (
    select
        /* Primary Key */
        cast(addressid as string) as addressid
        
        /* Foreign Key */
        , cast(stateprovinceid as string) as stateprovinceid
        
        /* Descriptive Columns */
        , cast(addressline1 as string) as addressline1
        , cast(addressline2 as string) as addressline2
        , cast(city as string) as city
        , cast(postalcode as string) as postalcode
        
        /* Geospatial Data */
        , cast(spatiallocation as string) as spatiallocation
        
    from {{ source('raw_data_aw', 'address') }}
)

select * 
from source_address