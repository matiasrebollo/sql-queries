-- Me quedo con las materias que aprobo el alumno 83000
WITH materias_alumno_83000 AS (SELECT codigo, numero
							   FROM notas
							   WHERE padron = '83000'
							   AND nota >= 4)
-- Primero juntamos las materias que aprobo el alumno 83000 con los alumnos que tengan nota en alguna de 
-- esas materias. Luego al agrupar por padron, y pedir que tenga N combinaciones DISTINTAS de codigo-numero (materias)
-- siendo N la cantidad de materias que aprobo el alumno 83000, nos quedamos con los alumnos que tengan nota
-- en todas.
SELECT nt.padron 
FROM notas nt INNER JOIN materias_alumno_83000 ma ON (nt.codigo = ma.codigo AND nt.numero = ma.numero)
WHERE nt.padron <> '83000'
GROUP BY nt.padron
HAVING COUNT (DISTINCT (nt.codigo, nt.numero)) >= (SELECT COUNT(*) FROM materias_alumno_83000)

-- Resultado --
-- "padron"
-- 83000
-- 84000
-- 85000