with source_product as (
    select
        cast(productid as string) as productid
        , cast(productsubcategoryid as string) as productsubcategoryid
        , cast(productmodelid as string) as productmodelid
        , cast(name as string) as name
        , cast(productnumber as string) as productnumber
        , cast(color as string) as color
        , cast(size as string) as size
        , cast(sizeunitmeasurecode as string) as sizeunitmeasurecode
        , cast(weightunitmeasurecode as string) as weightunitmeasurecode
        , cast(productline as string) as productline
        , cast(class as string) as class
        , cast(style as string) as style
        , cast(makeflag as boolean) as makeflag
        , cast(finishedgoodsflag as boolean) as finishedgoodsflag
        , cast(safetystocklevel as int) as safetystocklevel
        , cast(reorderpoint as int) as reorderpoint
        , cast(daystomanufacture as int) as daystomanufacture
        , cast(standardcost as numeric(18,2)) as standardcost
        , cast(listprice as numeric(18,2)) as listprice
        , cast(weight as numeric(18,2)) as weight
        , cast(sellstartdate as date) as sellstartdate
        , cast(sellenddate as date) as sellenddate
        
    from {{ source('raw_data_aw', 'product') }}
)

select * 
from source_product