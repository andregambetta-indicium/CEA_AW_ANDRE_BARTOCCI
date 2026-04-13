with source_stateprovince as (
    select
        /* Primary Key */
        cast(stateprovinceid as string) as stateprovinceid
        
        /* Foreign Keys */
        , cast(countryregioncode as string) as countryregioncode
        , cast(territoryid as string) as territoryid
        
        /* Descriptive Columns */
        , cast(stateprovincecode as string) as stateprovincecode
        , cast(name as string) as name
        
        /* Flags */
        , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
        
    from {{ source('raw_data_aw', 'stateprovince') }}
)

select * 
from source_stateprovince