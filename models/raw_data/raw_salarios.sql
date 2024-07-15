{{
    config(
        materialized='view'
    )
}}

select id_empleado,
       salario
from {{ source('rawd_salario', 'salario') }}

