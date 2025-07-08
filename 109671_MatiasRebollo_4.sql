-- Agrupo los alumnos que aparezcan en notas por padron, pero con la condicion de que la cantidad de combinaciones
-- distintas de codigo-numero (es decir materia) sea mayor a 4, y que el promedio de notas sea al menos 6.
SELECT al.padron, al.apellido, AVG(nt.nota) AS promedio
FROM alumnos al INNER JOIN notas nt ON (al.padron = nt.padron)
GROUP BY al.padron
HAVING COUNT(DISTINCT (nt.codigo, nt.numero)) > 4
AND AVG(nt.nota) >= 6;

-- Resultado --
-- "padron"	"apellido"	"promedio"
-- 73000	"Molina"	6.6000000000000000
-- 86000	"Díaz"	    7.8000000000000000