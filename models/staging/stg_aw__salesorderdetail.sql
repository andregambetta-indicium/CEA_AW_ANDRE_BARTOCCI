with source_salesorderdetail as (
    select
        /* Primary & Foreign Keys */
        cast(salesorderid as string) as salesorderid
        , cast(salesorderdetailid as string) as salesorderdetailid
        , cast(productid as string) as productid
        , cast(specialofferid as string) as specialofferid
        
        /* Descriptive Columns */
        , cast(carriertrackingnumber as string) as carriertrackingnumber
        
        /* Quantities & Values */
        , cast(orderqty as int) as orderqty
        /* Arredondando para 2 casas decimais conforme solicitado */
        , cast(unitprice as numeric(18,2)) as unitprice
        /* Mantendo a precisão original para o desconto para não perder informação no cálculo */
        , cast(unitpricediscount as numeric(18,4)) as unitpricediscount
        
    from {{ source('raw_data_aw', 'salesorderdetail') }}
)

select * 
from source_salesorderdetail