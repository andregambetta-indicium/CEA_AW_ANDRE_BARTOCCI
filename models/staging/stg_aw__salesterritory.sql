with source_salesterritory as (
    select
        /* Primary Key */
        cast(territoryid as string) as territoryid
        
        /* Descriptive Columns */
        , cast(name as string) as name
        , cast(countryregioncode as string) as countryregioncode
        , cast("group" as string) as territory_group 
        
        /* Financial Values */
        , cast(salesytd as numeric(18,2)) as salesytd
        , cast(saleslastyear as numeric(18,2)) as saleslastyear
        
    from {{ source('raw_data_aw', 'salesterritory') }}
)

select * 
from source_salesterritory