with source_productcategory as (
    select
        /* Primary Key */
        cast(productcategoryid as string) as productcategoryid
        
        /* Descriptive Column */
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'productcategory') }}
)

select * 
from source_productcategory