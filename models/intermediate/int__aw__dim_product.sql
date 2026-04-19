with product as (
    select * from {{ ref('stg__aw__product') }}
),

product_subcategory as (
    select * from {{ ref('stg__aw__productsubcategory') }}
),

product_category as (
    select * from {{ ref('stg__aw__productcategory') }}
),

int_product as (
    select
        product.productid,
        product.productsubcategoryid,
        product.productmodelid,
        product_subcategory.productcategoryid,
        product_category.name as productcategoryname,
        product_subcategory.name as productsubcategoryname,
        product.name as productname,
        product.productnumber,
        product.color as productcolor,
        product.size as productsize,
        product.sizeunitmeasurecode,
        product.weight as productweight,
        product.weightunitmeasurecode,
        product.productline,
        product.class as productclass,
        product.style as productstyle,
        product.makeflag,
        product.finishedgoodsflag,
        product.sellstartdate,
        product.sellenddate,
        product.safetystocklevel,
        product.reorderpoint,
        product.daystomanufacture,
        product.standardcost,
        product.listprice

    from product
    left join product_subcategory 
        on product.productsubcategoryid = product_subcategory.productsubcategoryid
    left join product_category 
        on product_subcategory.productcategoryid = product_category.productcategoryid
)

select * from int_product
