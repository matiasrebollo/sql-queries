-- Nos quedamos con el padron de los alumnos con la fecha de ingreso mas alta (osea mas reciente)
WITH alumnos_mas_recientes AS (SELECT padron
							   FROM alumnos
							   WHERE fecha_ingreso >= ALL(SELECT fecha_ingreso -- Podria haber hecho al igual que el ejercicio 1,
														  FROM alumnos))       -- igualando con el valor MAX de fecha ingreso.
-- Nos quedamos con los valores que pide la consigna de los alumnos con la fecha de ingreso mas reciente														  
SELECT nt.padron, nt.codigo, nt.numero, nt.nota
FROM notas nt INNER JOIN alumnos_mas_recientes amr ON (nt.padron = amr.padron);

-- Resultado --
-- "padron"	"codigo"	"numero"	"nota"
-- 88000	75	         1	         9
-- 88000	71	         14	         8
-- 88000	75	         42	         7
-- 88000	75	         6	         9