with source_personcreditcard as (
    select
        /* Foreign Keys (Composite PK) */
        cast(businessentityid as string) as businessentityid
        , cast(creditcardid as string) as creditcardid
        
    from {{ source('raw_data_aw', 'personcreditcard') }}
)

select * 
from source_personcreditcard