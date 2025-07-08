-- "Creo" una tabla temporal con el padron, el apellido, y la cantidad de materias que promociono el alumno
WITH cantidad_promociones AS (SELECT al.padron, al.apellido, COUNT(*) AS cantidad 
							  FROM alumnos al INNER JOIN notas nt ON (al.padron = nt.padron)
							  WHERE nota >= 7 
                              GROUP BY al.padron)
							  
-- Me quedo con el padron y apellido de aquellos alumnos cuya cantidad de promociones coincidan (=) con la maxima
SELECT cp.padron, cp.apellido
FROM cantidad_promociones cp
WHERE cp.cantidad = (SELECT MAX(cantidad)
					 FROM cantidad_promociones);

-- Resultados --
-- "padron"	"apellido"
-- 88000	"Vargas"
-- 86000	"Díaz"
-- 83000	"Gómez"
-- 85000	"Fernández"
