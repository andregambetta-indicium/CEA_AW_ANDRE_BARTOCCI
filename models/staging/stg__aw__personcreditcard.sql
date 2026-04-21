with source_personcreditcard as (
    select
        cast(businessentityid as string) as businessentityid
        , cast(creditcardid as string) as creditcardid
        
    from {{ source('raw_data_aw', 'personcreditcard') }}
)

select * 
from source_personcreditcard