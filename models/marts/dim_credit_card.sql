with int_credit_card as (
    select * from {{ ref('int__aw__dim_credit_card') }}
)

select
    creditcardid as credit_card_id,
    personid as person_id,
    cardtype as card_type,
    cardnumber as card_number,
    expmonth as expiration_month,
    expyear as expiration_year

from int_credit_card
