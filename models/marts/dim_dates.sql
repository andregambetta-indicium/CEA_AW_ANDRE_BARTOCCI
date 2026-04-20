with date_series as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2010-01-01' as date)",
        end_date="cast('2025-12-31' as date)"
    )
    }}
),

final_dates as (
    select
        cast(date_day as date) as date_id,
        date_day as full_date,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(quarter from date_day) as quarter,
        extract(dayofweek from date_day) as day_of_week,
        dayname(date_day) as day_name,
        monthname(date_day) as month_name,
        case 
            when dayname(date_day) in ('Sat', 'Sun') then true 
            else false 
        end as is_weekend
    from date_series
)

select * from final_dates
