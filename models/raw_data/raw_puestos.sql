{{
    config(
        materialized='view'
    )
}}


select id_empleado,
       puesto
from {{ source('rawd_puesto', 'puestos') }}

