with source_productsubcategory as (
    select
        /* Primary Key */
        cast(productsubcategoryid as string) as productsubcategoryid
        
        /* Foreign Key */
        , cast(productcategoryid as string) as productcategoryid
        
        /* Descriptive Column */
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'productsubcategory') }}
)

select * 
from source_productsubcategory