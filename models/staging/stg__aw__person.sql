with source_person as (
    select
        cast(businessentityid as string) as businessentityid
        , cast(firstname as string) as firstname
        , cast(middlename as string) as middlename
        , cast(lastname as string) as lastname
        , cast(persontype as string) as persontype
        , cast(title as string) as title
        , cast(suffix as string) as suffix
        , cast(emailpromotion as int) as emailpromotion
        
    from {{ source('raw_data_aw', 'person') }}
)

select * 
from source_person