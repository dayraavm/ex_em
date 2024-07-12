with empleados as (

     select * from {{ ref('raw_empleados') }}

),

salarios as ( 

    select * from {{ ref('raw_salarios')}}

),
puestos as ( 

    select * from {{ ref('raw_puestos')}}

),

empleados_final as (

    select
        empleados.id_empleado as ID_Empleado,
        empleados.nombre as Empleado,
        salarios.salario,
        puestos.puesto
    from empleados
        join salarios
           on empleado.id_empleado = salarios.id_empleado
        join puestos
           on empleados.id_empleado = puestos.id_empleado
    order by empleados.id_empleado
)

select * from empleados_final