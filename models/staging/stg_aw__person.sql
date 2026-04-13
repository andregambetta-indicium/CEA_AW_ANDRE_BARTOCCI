with source_person as (
    select
        /* Primary Key */
        cast(businessentityid as string) as businessentityid
        
        /* Name Columns */
        , cast(firstname as string) as firstname
        , cast(middlename as string) as middlename
        , cast(lastname as string) as lastname
        
        /* Attributes & Titles */
        , cast(persontype as string) as persontype
        , cast(title as string) as title
        , cast(suffix as string) as suffix
        
        /* Promotion Info */
        , cast(emailpromotion as int) as emailpromotion
        
    from {{ source('raw_data_aw', 'person') }}
)

select * 
from source_person