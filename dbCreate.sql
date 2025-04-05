-- Tabla Comuna
DROP TABLE IF EXISTS Comuna CASCADE;
CREATE TABLE Comuna (
    id_comuna SERIAL PRIMARY KEY,
    nombre_comuna VARCHAR(30) NOT NULL,
    region VARCHAR(50) NOT NULL
);


-- Tabla Cliente
DROP TABLE IF EXISTS Cliente CASCADE;
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    id_comuna INT REFERENCES Comuna(id_comuna),
    rut_cliente CHAR(10) NOT NULL,
    nombre_cliente VARCHAR(50) NOT NULL,
    telefono_cliente CHAR(9),
    genero_cliente CHAR(1),
    fecha_nacimiento DATE  -- PARA CALCULAR EDAD
);


-- Tabla Peluqueria
DROP TABLE IF EXISTS Peluqueria CASCADE;
CREATE TABLE Peluqueria (
    id_peluqueria SERIAL PRIMARY KEY,
    id_comuna INT REFERENCES Comuna(id_comuna),
    nombre_peluqueria VARCHAR(200) NOT NULL,
    direccion_peluqueria VARCHAR(255) NOT NULL,
    telefono_peluqueria CHAR(9) NOT NULL,
    horario_apertura TIME NOT NULL,
    horario_cierre TIME NOT NULL
);


-- Tabla Empleado
DROP TABLE IF EXISTS Empleado CASCADE;
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    id_comuna INT REFERENCES Comuna(id_comuna),
    id_peluqueria INT REFERENCES Peluqueria(id_peluqueria),
    nombre_empleado VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);


-- Tabla Sueldo
DROP TABLE IF EXISTS Sueldo CASCADE;
CREATE TABLE Sueldo (
    id_sueldo SERIAL PRIMARY KEY,
    id_empleado INT REFERENCES Empleado(id_empleado),
    monto_sueldo INT NOT NULL,
    fecha_pago DATE NOT NULL
);


-- Tabla Horarios
DROP TABLE IF EXISTS Horarios CASCADE;
CREATE TABLE Horarios (
    id_horarios SERIAL PRIMARY KEY,
    hora TIME NOT NULL
);


-- Tabla Cita
DROP TABLE IF EXISTS Cita CASCADE;
CREATE TABLE Cita (
    id_cita SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_empleado INT REFERENCES Empleado(id_empleado),
	id_horarios INT REFERENCES Horarios(id_horarios),
	id_peluqueria INT REFERENCES Peluqueria(id_peluqueria),
    fecha_cita DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_termino TIME NOT NULL 
);


-- Tabla Producto
DROP TABLE IF EXISTS Producto CASCADE;
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(50) NOT NULL,
	precio_producto INT NOT NULL
);


-- Tabla Servicio
DROP TABLE IF EXISTS Servicio CASCADE;
CREATE TABLE Servicio (
    id_servicio SERIAL PRIMARY KEY,
    nombre_servicio VARCHAR(50) NOT NULL,
    precio_servicio INT NOT NULL,
    tipo_servicio VARCHAR(20) NOT NULL  -- (CORTE, BARBA, TINTE)
);


-- Tabla Pago
DROP TABLE IF EXISTS Pago CASCADE;
CREATE TABLE Pago (
    id_pago SERIAL PRIMARY KEY,
    monto_pago INT NOT NULL
);


-- Tabla Detalle
DROP TABLE IF EXISTS Detalle CASCADE;
CREATE TABLE Detalle (
    id_detalle SERIAL PRIMARY KEY,
    id_pago INT REFERENCES Pago(id_pago),
    id_servicio INT REFERENCES Servicio(id_servicio),
	id_cita INT REFERENCES Cita(id_cita)
);