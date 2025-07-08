-- Comenzamos a unir todas las tablas con INNER JOINS (para cumplir la nota 1 de la consigna), y una vez
-- que tenemos todo, agrupamos por carrera y depto mostrando el promedio de notas por carrera y depto.
SELECT ie.codigo AS codigo_carrera, nt.codigo AS codigo_depto, AVG(nt.nota) AS promedio_notas
FROM notas nt INNER JOIN alumnos al ON (nt.padron = al.padron)
INNER JOIN inscripto_en ie ON (al.padron = ie.padron)
GROUP BY ie.codigo, nt.codigo
ORDER BY ie.codigo, nt.codigo;

-- Resultado -- 
-- "codigo_carrera"	"codigo_depto"	"promedio_notas"
-- 5	61	7.0000000000000000
-- 5	62	7.2500000000000000
-- 6	61	8.8000000000000000
-- 6	62	7.0000000000000000
-- 9	71	6.7142857142857143
-- 9	75	6.6923076923076923
-- 10	71	6.7500000000000000
-- 10	75	6.5000000000000000