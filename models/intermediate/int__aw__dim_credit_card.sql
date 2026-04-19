with credit_card as (
    select * from {{ ref('stg__aw__creditcard') }}
),

person_credit_card as (
    select * from {{ ref('stg__aw__personcreditcard') }}
),

int_credit_card as (
    select
        credit_card.creditcardid,
        person_credit_card.businessentityid as personid,
        credit_card.cardtype,
        credit_card.cardnumber,
        credit_card.expmonth,
        credit_card.expyear

    from credit_card
    left join person_credit_card 
        on credit_card.creditcardid = person_credit_card.creditcardid
)

select * from int_credit_card
