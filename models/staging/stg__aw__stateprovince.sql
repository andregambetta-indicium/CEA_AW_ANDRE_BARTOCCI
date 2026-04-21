with source_stateprovince as (
    select
        cast(stateprovinceid as string) as stateprovinceid
        , cast(countryregioncode as string) as countryregioncode
        , cast(territoryid as string) as territoryid
        , cast(stateprovincecode as string) as stateprovincecode
        , cast(name as string) as name
        , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
        
    from {{ source('raw_data_aw', 'stateprovince') }}
)

select * 
from source_stateprovince