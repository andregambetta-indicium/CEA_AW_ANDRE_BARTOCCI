with source_countryregion as (
    select
        cast(countryregioncode as string) as countryregioncode
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'countryregion') }}
)

select * 
from source_countryregion