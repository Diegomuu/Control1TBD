-- Comuna
INSERT INTO Comuna (nombre_comuna, region) VALUES
('Providencia', 'Metropolitana'),
('Ñuñoa', 'Metropolitana'),
('Las Condes', 'Metropolitana'),
('Maipú', 'Metropolitana'),
('La Florida', 'Metropolitana'),
('Puente Alto', 'Metropolitana'),
('Santiago Centro', 'Metropolitana'),
('La Reina', 'Metropolitana'),
('Macul', 'Metropolitana'),
('San Miguel', 'Metropolitana');

-- Cliente
INSERT INTO Cliente (id_comuna, rut_cliente, nombre_cliente, telefono_cliente, genero_cliente, fecha_nacimiento) VALUES
(1, '12345678-9', 'Ana Soto', '912345678', 'F', '1990-04-01'),
(2, '23456789-0', 'Luis Pérez', '923456789', 'M', '1985-07-21'),
(3, '34567890-1', 'Carla Ríos', '934567890', 'F', '1992-11-15'),
(4, '45678901-2', 'Pedro López', '945678901', 'M', '1980-01-05'),
(5, '56789012-3', 'Martina Díaz', '956789012', 'F', '2000-05-09'),
(6, '67890123-4', 'Tomás Vidal', '967890123', 'M', '1998-03-17'),
(7, '78901234-5', 'Javiera Mella', '978901234', 'F', '1995-09-10'),
(8, '89012345-6', 'Ignacio Lara', '989012345', 'M', '1988-12-30'),
(9, '90123456-7', 'Camila Fuentes', '999123456', 'F', '1993-08-22'),
(10, '01234567-8', 'Sebastián Rivas', '910123456', 'M', '1991-06-13');

-- Peluqueria
INSERT INTO Peluqueria (id_comuna, nombre_peluqueria, direccion_peluqueria, telefono_peluqueria, horario_apertura, horario_cierre) VALUES
(1, 'Peluquería Estilo Urbano', 'Av. Providencia 1234', '912345678', '09:00', '19:00'),
(2, 'Look Perfecto', 'Av. Irarrázaval 567', '923456789', '10:00', '20:00'),
(3, 'Barber House', 'Los Leones 789', '934567890', '08:00', '18:00'),
(4, 'Glamour Spa Hair', 'La Florida 456', '945678901', '09:30', '19:30'),
(5, 'Studio Cut', 'San Miguel 100', '956789012', '10:00', '20:00'),
(6, 'El Corte Ideal', 'Santiago Centro 300', '967890123', '08:30', '18:30'),
(7, 'Barbería Pro', 'Ñuñoa 401', '978901234', '09:00', '19:00'),
(8, 'Pelucas y Estilo', 'Puente Alto 111', '989012345', '10:00', '20:00'),
(9, 'Corte Moderno', 'Macul 202', '999123456', '08:00', '18:00'),
(10, 'Urban Hair', 'La Reina 333', '910123456', '09:00', '19:00');

-- Empleado
INSERT INTO Empleado (id_comuna, id_peluqueria, nombre_empleado, cargo) VALUES
(1, 1, 'Valentina Soto', 'Estilista'),
(2, 2, 'Carlos Muñoz', 'Barbero'),
(3, 3, 'Marcela Gómez', 'Colorista'),
(4, 4, 'José Ramírez', 'Estilista'),
(5, 5, 'Fernanda Reyes', 'Recepcionista'),
(6, 6, 'Ricardo Pinto', 'Barbero'),
(7, 7, 'Daniela Silva', 'Estilista'),
(8, 8, 'Jorge Castro', 'Asistente'),
(9, 9, 'Isabel Mena', 'Colorista'),
(10, 10, 'Rodrigo Vega', 'Estilista');

-- Sueldo
INSERT INTO Sueldo (id_empleado, monto_sueldo, fecha_pago) VALUES
(1, 850000, '2021-01-15'),
(2, 920000, '2021-03-20'),
(3, 750000, '2021-06-10'),
(4, 1050000, '2022-02-28'),
(5, 990000, '2022-05-14'),
(6, 600000, '2022-07-09'),
(7, 880000, '2022-10-20'),
(8, 1150000, '2023-01-18'),
(9, 780000, '2023-04-25'),
(10, 970000, '2023-08-03'),
(3, 690000, '2023-10-15'),
(1, 870000, '2024-01-12'),
(5, 920000, '2024-04-22'),
(7, 780000, '2024-07-29'),
(2, 1050000, '2024-09-08'),
(6, 800000, '2024-11-17'),
(8, 1140000, '2025-01-05'),
(10, 890000, '2025-03-14'),
(4, 760000, '2025-06-11'),
(9, 980000, '2025-08-19');

-- Horarios
INSERT INTO Horarios (hora) VALUES
('09:00'), ('10:00'), ('11:00'), ('12:00'), ('13:00'),
('14:00'), ('15:00'), ('16:00'), ('17:00'), ('18:00');

-- Cita
INSERT INTO Cita (id_cliente, id_empleado, id_horarios, id_peluqueria, fecha_cita, hora_inicio, hora_termino) VALUES
(5, 2, 8, 3, '2021-03-12', '10:00', '11:30'),
(3, 6, 4, 1, '2022-07-21', '14:00', '14:30'),
(8, 4, 1, 2, '2023-11-05', '09:30', '11:00'),
(1, 7, 3, 1, '2025-01-16', '12:00', '13:00'),
(6, 1, 6, 4, '2024-05-23', '15:30', '17:00'),
(10, 3, 2, 3, '2022-02-08', '11:00', '12:00'),
(2, 9, 7, 4, '2023-08-30', '16:00', '18:00'),
(7, 8, 5, 2, '2025-03-17', '10:30', '11:00'),
(4, 10, 3, 1, '2021-10-11', '13:00', '14:30'),
(9, 5, 9, 3, '2024-12-01', '17:00', '18:00'),
(3, 2, 4, 4, '2023-06-15', '08:30', '10:30'),
(6, 1, 1, 2, '2021-04-09', '15:00', '15:30'),
(8, 4, 2, 1, '2022-09-22', '11:30', '12:30'),
(10, 7, 5, 3, '2025-07-04', '13:00', '14:00'),
(1, 9, 6, 2, '2023-03-30', '09:00', '10:00'),
(5, 6, 3, 1, '2024-06-18', '12:30', '14:30'),
(2, 10, 8, 4, '2021-12-27', '15:30', '16:30'),
(7, 3, 1, 2, '2022-11-03', '10:00', '10:30'),
(4, 8, 4, 3, '2023-05-12', '14:00', '15:30'),
(9, 5, 2, 1, '2025-02-14', '16:00', '17:30');

-- Pago
INSERT INTO Pago (monto_pago) VALUES
(7000), (9000), (5000), (12000), (8000),
(15000), (6000), (5000), (4000), (20000),
(7000), (9000), (5000), (12000), (8000),
(15000), (6000), (5000), (4000), (20000);

-- Detalle
INSERT INTO Detalle (id_pago, id_cita) VALUES
(1, 10),
(2, 3),
(3, 14),
(4, 7),
(5, 1),
(6, 18),
(7, 5),
(8, 9),
(9, 12),
(10, 2);

-- Producto
INSERT INTO Producto (id_detalle, nombre_producto, precio_producto) VALUES
(1, 'Aftershave mentolado', 2700),
(1, 'Cepillo para barba', 3200),
(2, 'Mascarilla capilar', 5000),
(2, 'Peine de bolsillo', 1800),
(3, 'Espuma para afeitar', 2600),
(3, 'Bálsamo de barba', 3500),
(4, 'Shampoo anticaspa', 4200),
(4, 'Toalla de microfibra', 2000),
(5, 'Aceite esencial', 3800),
(5, 'Cepillo desenredante', 2900),
(6, 'Gel con aroma', 2500),
(6, 'Mascarilla capilar intensa', 4800),
(7, 'Spray modelador', 3300),
(7, 'Loción hidratante', 3600),
(8, 'Cera natural', 3100),
(8, 'Peine de madera', 2100),
(9, 'Set de navajas', 8000),
(9, 'Bálsamo post-tinte', 4000),
(10, 'Shampoo hidratante', 3900),
(10, 'Peine antiestático', 2700);

-- Servicio
INSERT INTO Servicio (id_detalle, nombre_servicio, precio_servicio, tipo_servicio) VALUES
(1, 'Lavado exprés', 3000, 'CORTE'),
(1, 'Barba rápida', 4000, 'BARBA'),
(2, 'Corte degradado', 9000, 'CORTE'),
(2, 'Masaje capilar', 4500, 'TINTE'),
(3, 'Coloración parcial', 10000, 'TINTE'),
(3, 'Barba perfilada', 5000, 'BARBA'),
(4, 'Corte infantil', 6000, 'CORTE'),
(4, 'Tinte natural', 9500, 'TINTE'),
(5, 'Corte ejecutivo', 8500, 'CORTE'),
(5, 'Arreglo de barba', 5500, 'BARBA'),
(6, 'Decoloración', 12000, 'TINTE'),
(6, 'Perfilado facial', 4000, 'BARBA'),
(7, 'Tinte ceniza', 11000, 'TINTE'),
(7, 'Corte express', 7500, 'CORTE'),
(8, 'Peinado clásico', 5000, 'CORTE'),
(8, 'Revisión barba', 3000, 'BARBA'),
(9, 'Corte artístico', 13000, 'CORTE'),
(9, 'Barba estilo libre', 6000, 'BARBA'),
(10, 'Retoque de barba', 3500, 'BARBA'),
(10, 'Corte con navaja', 9500, 'CORTE');

