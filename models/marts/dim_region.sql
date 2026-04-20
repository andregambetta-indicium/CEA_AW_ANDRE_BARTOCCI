with dim_region as (
    select * from {{ ref('int__aw__dim_region') }}
)

select
    addressid as address_id,
    stateprovinceid as state_province_id,
    territoryid as territory_id,
    countryregioncode as country_region_code,
    countryregionname as country_region_name,
    salesterritoryname as sales_territory_name,
    territory_group,
    stateprovincecode as state_province_code,
    stateprovincename as state_province_name,
    city,
    postalcode as postal_code,
    addressline1 as address_line_1,
    addressline2 as address_line_2,
    spatiallocation as spatial_location,
    isonlystateprovinceflag as is_only_state_province,
    salesytd as sales_year_to_date,
    saleslastyear as sales_last_year

from dim_region
