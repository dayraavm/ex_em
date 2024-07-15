{{
    config(
        materialized='view'
        
    )
}}

with empleados_t as (

    select id_empleado,
           nombre,
           fehca_reg
    from {{ ref('stg_emp') }}

),

salarios_t as ( 

    select id_empleado,
           salario
    from {{ ref('stg_sal') }}

),
puestos_t as ( 

    select id_empleado,
           puesto
    from {{ ref('stg_puest') }}
),

empleados_final as (

    select
        empleados_t.id_empleado as ID_Empleado,
        empleados_t.nombre as Empleado,
        salarios_t.salario as Salario,
        {{test_ex('puestos_t.puesto')}} as Puesto,
        empleados_t.fehca_reg as Fecha_Modif
    from empleados_t
        join salarios_t
            on empleados_t.id_empleado = salarios_t.id_empleado
        join puestos_t
            on empleados_t.id_empleado = puestos_t.id_empleado
    --where FEHCA_REG = '2024-11-07'
    order by 1
)

select * 
from empleados_final