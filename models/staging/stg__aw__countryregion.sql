with source_countryregion as (
    select
        /* Primary Key */
        cast(countryregioncode as string) as countryregioncode
        
        /* Descriptive Columns */
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'countryregion') }}
)

select * 
from source_countryregion