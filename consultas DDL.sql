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
SELECT *
FROM empleados
WHERE salario > 48000;

-- cuenta cuantos pilotos hay en la plantilla - Ariel
SELECT COUNT(*) AS Total_Pilotos
FROM piloto;

-- selecciona a todos los empleados que tengan más de seis meses de antigüedad - Ariel
SELECT *
FROM empleados
WHERE DATEDIFF(CURDATE(), fecha_contratacion) > 180;

-- Selecciona todos los azafatos que sean hombres - Ariel
SELECT *
FROM empleados
WHERE puesto = 'Azafato' AND genero = 'Masculino';