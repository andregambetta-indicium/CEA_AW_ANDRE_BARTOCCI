with dim_product as (
    select * from {{ ref('int__aw__dim_product') }}
)

select
    productid as product_id,
    productsubcategoryid as product_subcategory_id,
    productmodelid as product_model_id,
    productcategoryid as product_category_id,
    productcategoryname as category_name,
    productsubcategoryname as subcategory_name,
    productname as product_name,
    productnumber as product_number,
    productcolor as color,
    productsize as size,
    sizeunitmeasurecode as size_unit_measure_code,
    productweight as weight,
    weightunitmeasurecode as weight_unit_measure_code,
    productline as product_line,
    productclass as class,
    productstyle as style,
    makeflag as is_manufactured,
    finishedgoodsflag as is_finished_good,
    sellstartdate as sell_start_date,
    sellenddate as sell_end_date,
    safetystocklevel as safety_stock_level,
    reorderpoint as reorder_point,
    daystomanufacture as days_to_manufacture,
    standardcost as standard_cost,
    listprice as list_price

from dim_product
