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


-- ¿que pacientes tienen mas de un medico?

-- ¿cuantos pacientes tiene cada medico?

-- ¿cuanto cobra facturo cada medico?



