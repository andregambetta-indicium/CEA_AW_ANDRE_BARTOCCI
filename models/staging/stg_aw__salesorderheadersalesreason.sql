with source_salesorderheadersalesreason as (
    select
        /* Primary Keys & Foreign Keys */
        cast(salesorderid as string) as salesorderid
        , cast(salesreasonid as string) as salesreasonid
        
    from {{ source('raw_data_aw', 'salesorderheadersalesreason') }}
)

select * 
from source_salesorderheadersalesreason
