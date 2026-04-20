with address as (
    select * from {{ ref('stg__aw__address') }}
),

state_province as (
    select * from {{ ref('stg__aw__stateprovince') }}
),

country_region as (
    select * from {{ ref('stg__aw__countryregion') }}
),

sales_territory as (
    select * from {{ ref('stg__aw__salesterritory') }}
),

int_region as (
    select
        address.addressid,
        address.stateprovinceid,
        state_province.territoryid,
        state_province.countryregioncode,
        country_region.name as countryregionname,
        sales_territory.name as salesterritoryname,
        sales_territory.territory_group,
        state_province.stateprovincecode,
        state_province.name as stateprovincename,
        address.city,
        address.postalcode,
        address.addressline1,
        address.addressline2,
        address.spatiallocation,
        state_province.isonlystateprovinceflag,
        sales_territory.salesytd,
        sales_territory.saleslastyear

    from address
    left join state_province 
        on address.stateprovinceid = state_province.stateprovinceid
    left join country_region 
        on state_province.countryregioncode = country_region.countryregioncode
    left join sales_territory 
        on state_province.territoryid = sales_territory.territoryid
)

select * from int_region
