with source_salesorderheadersalesreason as (
    select
        cast(salesorderid as string) as salesorderid
        , cast(salesreasonid as string) as salesreasonid
        
    from {{ source('raw_data_aw', 'salesorderheadersalesreason') }}
)

select * 
from source_salesorderheadersalesreason
