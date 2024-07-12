--select id_empleados, nombre
--from ex_em.ex_emp.empleados

select 
     id_empleados as ID_Empleado,
     nombre as Empleado,
     salario,
     --aplicar macro
     {{test_ex('puesto')}} as Puesto
from ex_em.ex_emp.empleados em
    join ex_em.ex_emp.salarios ss
        on em.id_empleados = ss.id_empleado
    join ex_em.ex_emp.puesto pp
        on em.id_empleados = pp.id_empleado
order by 1

-- dbt test --select ex_empo_t