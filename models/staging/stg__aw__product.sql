with source_product as (
    select
        /* Primary Key */
        cast(productid as string) as productid
        
        /* Foreign Keys */
        , cast(productsubcategoryid as string) as productsubcategoryid
        , cast(productmodelid as string) as productmodelid
        
        /* Descriptive Columns */
        , cast(name as string) as name
        , cast(productnumber as string) as productnumber
        , cast(color as string) as color
        , cast(size as string) as size
        , cast(sizeunitmeasurecode as string) as sizeunitmeasurecode
        , cast(weightunitmeasurecode as string) as weightunitmeasurecode
        , cast(productline as string) as productline
        , cast(class as string) as class
        , cast(style as string) as style
        
        /* Flags */
        , cast(makeflag as boolean) as makeflag
        , cast(finishedgoodsflag as boolean) as finishedgoodsflag
        
        /* Quantities and Manufacturing */
        , cast(safetystocklevel as int) as safetystocklevel
        , cast(reorderpoint as int) as reorderpoint
        , cast(daystomanufacture as int) as daystomanufacture
        
        /* Financial Values - Standardized to 2 decimal places */
        , cast(standardcost as numeric(18,2)) as standardcost
        , cast(listprice as numeric(18,2)) as listprice
        
        /* Weight - Uniformed to 2 decimal places */
        , cast(weight as numeric(18,2)) as weight
        
        /* Dates - Cast to date to remove time */
        , cast(sellstartdate as date) as sellstartdate
        , cast(sellenddate as date) as sellenddate
        
    from {{ source('raw_data_aw', 'product') }}
)

select * 
from source_product