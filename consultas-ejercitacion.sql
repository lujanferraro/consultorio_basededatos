-- ¿Cuántos pacientes tiene el consultorio?

SELECT  COUNT(paciente_id) as cant_pacientes FROM pacientes;


-- ¿Cuántos medicos tiene el consultorio?

SELECT COUNT(medico_id) as cant_medicos FROM medicos;

-- ¿Que especialidades tiene el consultorio?

SELECT nombre_especialidad FROM especialidades;

-- ¿Cuantos medicos hay por especialidad?

SELECT e.nombre_especialidad , COUNT(*) FROM medicos as m
LEFT JOIN especialidades as e
ON m.especialidad_id = e.especialidad_id
GROUP BY m.especialidad_id;


-- ¿cuantos pacientes tiene cada medico?

SELECT DISTINCT m.apellido as medico,  COUNT(p.paciente_id)  as cant_pacientes FROM turnos as t
JOIN medicos as m
ON m.medico_id= t.medico_id
JOIN pacientes as p
ON t.paciente_id= p.paciente_id
GROUP BY (m.apellido);

-- ¿cuanto factura cada medico?

SELECT m.apellido as medico, SUM(precio) as facturado FROM medicos as m
JOIN turnos as t
ON m.medico_id= t.medico_id
GROUP BY (m.apellido);




