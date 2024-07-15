{{
    config(
        materialized='view'
    )
}}

select id_empleado,
       nombre,
       edad,
       correo,
       fehca_reg
from {{ source('rawd_empleados', 'empleados') }}
