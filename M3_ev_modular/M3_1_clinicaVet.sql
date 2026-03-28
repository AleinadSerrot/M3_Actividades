-- no olvidar realizar la BD paso a paso, el orden si importa

-- crear y usar la base de datos 
CREATE DATABASE M3clinica_veterinaria;
USE M3clinica_veterinaria;

-- crear tabla Dueño 
CREATE TABLE Dueño (
    id_dueno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

-- crear tabla Profesional
CREATE TABLE Profesional (
    id_profesional INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

-- crear tabla Mascota 
CREATE TABLE Mascota (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES Dueño(id_dueno)
);

-- crear tabla de horarios de Atención 
CREATE TABLE Atencion (
    id_atencion INT PRIMARY KEY AUTO_INCREMENT,
    fecha_atencion DATE,
    descripcion TEXT,
    id_mascota INT,
    id_profesional INT,
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
    FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional)
);

-- 2. INSERCIÓN DE DATOS DE PRUEBA (DATOS EXIGIDOS POR LA EVALUACIÓN)

-- insertar dueños
INSERT INTO Dueño (id_dueno, nombre, direccion, telefono) VALUES
(1, 'Juan Pérez', 'Calle Falsa 123', '555-1234'),
(2, 'Ana Gómez', 'Avenida Siempre Viva 456', '555-5678'),
(3, 'Carlos Ruiz', 'Calle 8 de Octubre 789', '555-8765');

-- insertar mascotas
INSERT INTO Mascota (id_mascota, nombre, tipo, fecha_nacimiento, id_dueno) VALUES
(1, 'Rex', 'Perro', '2020-05-10', 1),
(2, 'Luna', 'Gato', '2019-02-20', 2),
(3, 'Fido', 'Perro', '2021-03-15', 3);

-- insertar profesionales 
INSERT INTO Profesional (id_profesional, nombre, especialidad) VALUES
(1, 'Dr. Martínez', 'Veterinario'),
(2, 'Dr. Pérez', 'Especialista en dermatología'),
(3, 'Dr. López', 'Cardiólogo veterinario');

-- insertar atenciones
INSERT INTO Atencion (id_atencion, fecha_atencion, descripcion, id_mascota, id_profesional) VALUES
(1, '2025-03-01', 'Chequeo general', 1, 1),
(2, '2025-03-05', 'Tratamiento dermatológico', 2, 2),
(3, '2025-03-07', 'Consulta cardiológica', 3, 3);

-- 3. CONSULTAS Y MANIPULACIÓN DE DATOS

-- a) obtener todos los dueños y sus mascotas
SELECT D.nombre AS Nombre_Dueno, M.nombre AS Nombre_Mascota, M.tipo
FROM Dueño D
JOIN Mascota M ON D.id_dueno = M.id_dueno;

-- b) obtener las atenciones realizadas a las mascotas con los detalles del profesional que la atendió
SELECT M.nombre AS Mascota, A.fecha_atencion, A.descripcion, P.nombre AS Profesional, P.especialidad
FROM Atencion A
JOIN Mascota M ON A.id_mascota = M.id_mascota
JOIN Profesional P ON A.id_profesional = P.id_profesional;

-- c) contar la cantidad de atenciones por profesional
SELECT P.nombre AS Profesional, COUNT(A.id_atencion) AS Total_Atenciones
FROM Profesional P
LEFT JOIN Atencion A ON P.id_profesional = A.id_profesional
GROUP BY P.id_profesional;

-- d) actualizar la dirección de un dueño (ejemplo: cambiar la dirección de Juan Pérez, id 1)
UPDATE Dueño
SET direccion = 'Nueva Dirección 321'
WHERE id_dueno = 1; 

-- e) eliminar una atención (ejemplo: atención con id 2) 
DELETE FROM Atencion
WHERE id_atencion = 2;

-- 4. TRANSACCIÓN

-- realizar una transacción para agregar una nueva mascota, atención y actualización de información 
START TRANSACTION;

-- 1. agregar nueva mascota al dueño Carlos Ruiz (id_dueno = 3)
INSERT INTO Mascota (nombre, tipo, fecha_nacimiento, id_dueno) 
VALUES ('Max', 'Perro', '2024-01-01', 3);

-- se guarda el ID autogenerado de la nueva mascota para usarlo en la atención
SET @id_nueva_mascota = LAST_INSERT_ID();

-- 2. registro de atención para esta nueva mascota con el Dr. Martínez (id_profesional = 1)
INSERT INTO Atencion (fecha_atencion, descripcion, id_mascota, id_profesional) 
VALUES (CURDATE(), 'Revisión inicial', @id_nueva_mascota, 1);

-- 3. actualizar información: cambiar el teléfono del dueño Carlos Ruiz
UPDATE Dueño 
SET telefono = '555-0000' 
WHERE id_dueno = 3;

COMMIT;