with source_productcategory as (
    select
        cast(productcategoryid as string) as productcategoryid
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'productcategory') }}
)

select * 
from source_productcategory