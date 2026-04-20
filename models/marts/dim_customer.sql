with int_customer as (
    select * from {{ ref('int__aw__dim_customer') }}
)

select
    customerid as customer_id,
    personid as person_id,
    storeid as store_id,
    territoryid as territory_id,
    firstname as first_name,
    middlename as middle_name,
    lastname as last_name,
    firstname || ' ' || coalesce(middlename || ' ', '') || lastname as full_name,
    persontype as person_type,
    customertitle as customer_title,
    customersuffix as customer_suffix,
    emailpromotion as email_promotion_level

from int_customer
