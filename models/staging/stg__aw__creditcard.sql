with source_creditcard as (
    select
        cast(creditcardid as string) as creditcardid
        , cast(cardtype as string) as cardtype
        , cast(cardnumber as string) as cardnumber
        , cast(expmonth as int) as expmonth
        , cast(expyear as int) as expyear
        
    from {{ source('raw_data_aw', 'creditcard') }}
)

select * 
from source_creditcard