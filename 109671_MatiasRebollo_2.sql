-- Me quedo con el padron y el apellido de aquellos que tengan nota en 75.40 y 75.41
SELECT al.padron, al.apellido
FROM notas n1 INNER JOIN notas n2 ON (n1.padron = n2.padron)
INNER JOIN alumnos al ON (n1.padron = al.padron)
WHERE n1.codigo = 75 AND n1.numero = 40
AND n2.codigo = 75 AND n2.numero = 41
EXCEPT
-- Le resto aquellos que tengan nota en las materias 75.01 o 62.05
SELECT al.padron, al.apellido
FROM notas n1 INNER JOIN alumnos al ON (n1.padron = al.padron)
WHERE (n1.codigo = 75 AND n1.numero = 01)
OR (n1.codigo = 62 AND n1.numero = 05)

-- Resultado --
-- "padron"	"apellido"
-- 83000	"Gómez"
-- 85000	"Fernández"
-- 84000	"López"