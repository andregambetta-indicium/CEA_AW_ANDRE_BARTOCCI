with source_salesreason as (
    select
        /* Primary Key */
        cast(salesreasonid as string) as salesreasonid
        
        /* Descriptive Columns */
        , cast(name as string) as name
        , cast(reasontype as string) as reasontype
        
    from {{ source('raw_data_aw', 'salesreason') }}
)

select * 
from source_salesreason