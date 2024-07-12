select 
     id_empleados as ID_Empleado,
     nombre as nombre_Empleado,
     salario,
     puesto 
from ex_em.ex_emp.empleados em
    join ex_em.ex_emp.salarios ss
        on em.id_empleados = ss.id_empleado
    join ex_em.ex_emp.puesto pp
        on em.id_empleados = pp.id_empleado
order by 1