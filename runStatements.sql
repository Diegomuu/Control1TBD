-- 1
SELECT c.nombre_comuna, p.nombre_peluqueria, h.hora, COUNT(ci.id_cita) AS total_citas
FROM Cita ci
JOIN Peluqueria p ON ci.id_peluqueria = p.id_peluqueria
JOIN Comuna c ON p.id_comuna = c.id_comuna
JOIN Horarios h ON ci.id_horarios = h.id_horarios
GROUP BY c.nombre_comuna, p.nombre_peluqueria, h.hora
ORDER BY total_citas ASC;

-- 2
WITH tabla1 AS (
    SELECT 
        cliente.id_cliente,
        cliente.nombre_cliente,
        comuna.nombre_comuna AS comuna_cliente,
        peluqueria.id_peluqueria,
        peluqueria.nombre_peluqueria,
        cu.nombre_comuna AS comuna_peluqueria,
        EXTRACT(MONTH FROM cita.fecha_cita) AS mes,
        SUM(pago.monto_pago) AS total_gastado
    FROM cita
    JOIN cliente ON cita.id_cliente = cliente.id_cliente
    JOIN comuna ON cliente.id_comuna = comuna.id_comuna
    JOIN peluqueria ON cita.id_peluqueria = peluqueria.id_peluqueria
    JOIN comuna cu ON peluqueria.id_comuna = cu.id_comuna
    JOIN detalle ON cita.id_cita = detalle.id_cita
    JOIN pago ON detalle.id_pago = pago.id_pago
    GROUP BY cliente.id_cliente, comuna.nombre_comuna, peluqueria.id_peluqueria, peluqueria.nombre_peluqueria, cu.nombre_comuna, mes
)
SELECT 
    t1.nombre_cliente,
    t1.comuna_cliente,
    t1.id_peluqueria,
    t1.nombre_peluqueria,
    t1.comuna_peluqueria,
    t1.mes,
    t1.total_gastado
FROM tabla1 t1
JOIN (
    SELECT 
        id_peluqueria,
        mes,
        MAX(total_gastado) AS max_gasto
    FROM tabla1
    GROUP BY id_peluqueria, mes
) t2
ON t1.id_peluqueria = t2.id_peluqueria AND t1.mes = t2.mes AND t1.total_gastado = t2.max_gasto
ORDER BY t1.id_peluqueria, t1.mes;

-- 3
SELECT nombre_empleado, nombre_peluqueria, monto_sueldo,fecha_pago
FROM (
    SELECT e.nombre_empleado, 
           p.nombre_peluqueria, 
           s.monto_sueldo,
           s.fecha_pago,
           RANK() OVER (PARTITION BY p.id_peluqueria ORDER BY s.monto_sueldo DESC) AS ranking
    FROM empleado e
    JOIN peluqueria p ON e.id_peluqueria = p.id_peluqueria
    JOIN sueldo s ON e.id_empleado = s.id_empleado
    WHERE s.fecha_pago >= CURRENT_DATE - INTERVAL '3 years'
) subquery
WHERE ranking = 1;

-- 4
SELECT DISTINCT cl.id_cliente, cl.nombre_cliente, cl.rut_cliente
FROM cliente cl
JOIN cita ci ON cl.id_cliente = ci.id_cliente
JOIN detalle d1 ON d1.id_cita = ci.id_cita
JOIN servicio s1 ON d1.id_detalle = s1.id_detalle
JOIN detalle d2 ON d2.id_cita = ci.id_cita
JOIN servicio s2 ON d2.id_detalle = s2.id_detalle
WHERE cl.genero_cliente = 'M'
  AND LOWER(s1.nombre_servicio) LIKE '%corte%'
  AND LOWER(s2.nombre_servicio) LIKE '%barba%';

-- 5
SELECT c.nombre_cliente,co.nombre_comuna,p.nombre_peluqueria,s.precio_servicio
FROM Cliente c 
JOIN Comuna co ON c.id_comuna = co.id_comuna
JOIN Peluqueria p ON p.id_comuna = co.id_comuna 
JOIN Cita ci ON ci.id_peluqueria = p.id_peluqueria 
JOIN Detalle d ON ci.id_cita = d.id_cita
JOIN Servicio s ON s.id_detalle = d.id_detalle
WHERE s.tipo_servicio = 'TINTE';

-- 6
WITH CitasFiltradas AS (
    SELECT 
        c.id_peluqueria,
        h.hora,
        EXTRACT(YEAR FROM c.fecha_cita) AS anio,
        EXTRACT(MONTH FROM c.fecha_cita) AS mes,
        COUNT(*) AS cantidad
    FROM Cita c
    JOIN Horarios h ON c.id_horarios = h.id_horarios
    WHERE EXTRACT(YEAR FROM c.fecha_cita) BETWEEN 2018 AND 2029
    GROUP BY c.id_peluqueria, h.hora, anio, mes
),
MaximosPorPeluqueriaYMes AS (
    SELECT 
        id_peluqueria,
        anio,
        mes,
        MAX(cantidad) AS max_cantidad
    FROM CitasFiltradas
    GROUP BY id_peluqueria, anio, mes
)
SELECT 
    p.nombre_peluqueria,
    cf.anio,
    cf.mes,
    cf.hora,
    cf.cantidad AS citas_en_hora
FROM CitasFiltradas cf
JOIN MaximosPorPeluqueriaYMes mp
    ON cf.id_peluqueria = mp.id_peluqueria 
    AND cf.anio = mp.anio 
    AND cf.mes = mp.mes 
    AND cf.cantidad = mp.max_cantidad
JOIN Peluqueria p ON cf.id_peluqueria = p.id_peluqueria
ORDER BY p.nombre_peluqueria, cf.anio, cf.mes;

-- 7
WITH CitasConDuracion AS (
    SELECT 
        c.id_cliente,
        c.nombre_cliente,
        p.id_peluqueria,
        p.nombre_peluqueria,
        DATE_TRUNC('month', ci.fecha_cita) AS mes,
        ci.fecha_cita,
        ci.hora_inicio,
        ci.hora_termino,
        EXTRACT(EPOCH FROM (ci.hora_termino - ci.hora_inicio)) / 60 AS duracion_minutos
    FROM cita ci
    JOIN cliente c ON ci.id_cliente = c.id_cliente
    JOIN peluqueria p ON ci.id_peluqueria = p.id_peluqueria
)
-- seleccionar las citas de mayor duración por peluqueria y mes
SELECT DISTINCT ON (mes, id_peluqueria) 
    nombre_cliente, 
    nombre_peluqueria, 
    mes,
    hora_inicio, 
    hora_termino, 
    duracion_minutos
FROM CitasConDuracion
ORDER BY mes, id_peluqueria, duracion_minutos DESC;

-- 8
SELECT p.nombre_peluqueria, s.nombre_servicio, s.precio_servicio
FROM Peluqueria p
JOIN Cita c ON p.id_peluqueria = c.id_peluqueria
JOIN Detalle d ON c.id_cita = d.id_cita
JOIN Servicio s ON d.id_detalle = s.id_detalle
WHERE (p.id_peluqueria, s.precio_servicio) IN (
    SELECT c.id_peluqueria, MAX(s.precio_servicio)
    FROM Cita c
    JOIN Detalle d ON c.id_cita = d.id_cita
    JOIN Servicio s ON d.id_detalle = s.id_detalle
    GROUP BY c.id_peluqueria
);

-- 9
Select empleado.id_empleado, empleado.nombre_empleado , COUNT(cita.id_cliente) as num_citas
From cita
join empleado on cita.id_empleado = empleado.id_empleado
where cita.fecha_cita BETWEEN '2021/01/01' and '2021/12/31'
group By empleado.id_empleado
order by num_citas DESC
limit 1;

-- 10
SELECT c.nombre_comuna, COUNT(DISTINCT p.id_peluqueria) AS total_peluquerias, COUNT(DISTINCT cl.id_cliente) AS total_clientes
FROM Comuna c
JOIN Peluqueria p ON c.id_comuna = p.id_comuna
JOIN Cliente cl ON c.id_comuna = cl.id_comuna
GROUP BY c.nombre_comuna
ORDER BY total_peluquerias DESC;