with source_creditcard as (
    select
        /* Primary Key */
        cast(creditcardid as string) as creditcardid
        
        /* Descriptive Columns */
        , cast(cardtype as string) as cardtype
        , cast(cardnumber as string) as cardnumber
        
        /* Expiration Info */
        , cast(expmonth as int) as expmonth
        , cast(expyear as int) as expyear
        
    from {{ source('raw_data_aw', 'creditcard') }}
)

select * 
from source_creditcard