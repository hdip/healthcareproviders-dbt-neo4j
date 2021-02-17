
--{{ config(materialized='table') }}

select *
from stg_network

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
