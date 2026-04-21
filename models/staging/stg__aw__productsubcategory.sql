with source_productsubcategory as (
    select
        cast(productsubcategoryid as string) as productsubcategoryid
        , cast(productcategoryid as string) as productcategoryid
        , cast(name as string) as name
        
    from {{ source('raw_data_aw', 'productsubcategory') }}
)

select * 
from source_productsubcategory