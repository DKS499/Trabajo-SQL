USE aeropuerto;
-- selecciona el dni de los pasajeros que vuelan con el empleado El Richarz - Victor

-- selecciona los nombres de los pilotos que han tenido como copiloto a Matfied - Victor

-- selecciona toda la informacion de los vuelos no internacionales - Victor

-- cuenta el total de dinero gastado en los sueldos anualmente - Adri
SELECT SUM(salario) AS Gasto_anual
FROM empleados;
-- selecciona los dnis de los pasajeros en los vuelos con codigo 1 y 3 - Adri
SELECT dni
FROM embarcar
WHERE código IN (1, 3);
-- selecciona al empleado con mayor salario - Adri
SELECT MAX(salario) AS Empleado_Mejor_Pagado
FROM empleados;

-- selecciona los empleados con sueldos mayores a 48000 - Ariel

-- cuenta cuantos pilotos hay en la plantilla -Ariel

-- selecciona a todos los empleados que tengan mas de seis meses de antigüedad - Ariel

-- Selecciona todos los azafatos que sean hombres - Ariel
