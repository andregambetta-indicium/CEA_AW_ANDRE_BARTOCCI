with customer as (
    select * from {{ ref('stg__aw__customer') }}
),

person as (
    select * from {{ ref('stg__aw__person') }}
),

int_customer as (
    select
        customer.customerid,
        customer.personid,
        customer.storeid,
        customer.territoryid,
        person.firstname,
        person.middlename,
        person.lastname,
        person.persontype,
        person.title as customertitle,
        person.suffix as customersuffix,
        person.emailpromotion

    from customer
    left join person 
        on customer.personid = person.businessentityid
)

select * from int_customer
