{{
    config(
        alias                   = 'incr',
        materialized            = 'incremental',
        incremental_strategy    = 'merge',
        unique_key              = 'id_empleado'
    )
}}

with incr as (
    select *
    from {{ ref('empleados_final') }}
)

select *
from incr