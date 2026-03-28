-- no olvidar realizar la BD paso a paso, el orden si importa
-- no olvidar terminar con el punto-y-coma ;

-- crear y usar la base de datos
CREATE DATABASE BiblioTechDB;
USE BiblioTechDB;


-- 1. CREAR LAS TABLAS

-- crear tabla autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(50)
);

-- crear tabla libros
-- se agrega stock para poder reducirlo en las transacciones (paso 5)
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    id_autor INT,
    anio_publicacion INT,
    genero VARCHAR(50),
    stock INT DEFAULT 1,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- crear tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

-- crear tabla préstamos
-- on delete cascade asegura que si se borra el cliente, se borran sus préstamos
CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- 2. INSERCIÓN DE DATOS DE PRUEBA

-- insertar autores (al menos 3 con diferentes nacionalidades)
INSERT INTO autores (nombre, nacionalidad) VALUES 
('Isabel Allende', 'Chilena'),
('Felipe Lecannelier', 'Española'),  -- es chileno
('Gabriel García Márquez', 'Colombiana');

-- insertar libros (al menos 5, cada uno asociado a un autor)
INSERT INTO libros (titulo, id_autor, anio_publicacion, genero, stock) VALUES 
('Eva Luna', 1, 1987, 'Novela', 5),
('La casa de los espíritus', 1, 1982, 'Realismo Mágico', 3),
('AMAR', 2, 2016, 'Psicología', 4),
('Trauma y apego', 2, 2023, 'Psicología', 2),
('Cien años de soledad', 3, 1967, 'Realismo Mágico', 3);

-- insertar clientes ficticios (al menos 3)
INSERT INTO clientes (nombre, correo, telefono) VALUES 
('Daniela Torres', 'danielatorresb@gmail.com', '555-1234'),
('Antonia Espinosa', 'ficticio@ficticiouno.com', '555-5678'),
('Motasio Kawaii', 'mota@mejormascotadelmundo.com', '555-8765');

-- insertar préstamos (al menos 4)
INSERT INTO prestamos (id_cliente, id_libro, fecha_prestamo, fecha_devolucion) VALUES 
(1, 1, '2026-03-01', '2026-03-15'),
(2, 2, '2026-03-05', NULL),
(1, 3, '2026-03-20', NULL),
(3, 5, '2026-03-22', '2026-04-01');

-- 3. CONSULTAS SQL PARA MANIPULACIÓN DE DATOS

-- mostrar todos los libros disponibles con su autor
SELECT l.titulo, a.nombre AS autor 
FROM libros l 
JOIN autores a ON l.id_autor = a.id_autor 
WHERE l.stock > 0;

-- listar los clientes que han tomado préstamos
SELECT DISTINCT c.nombre 
FROM clientes c 
JOIN prestamos p ON c.id_cliente = p.id_cliente;

-- obtener la cantidad de libros prestados por cada cliente
SELECT c.nombre, COUNT(p.id_prestamo) AS total_libros 
FROM clientes c 
JOIN prestamos p ON c.id_cliente = p.id_cliente 
GROUP BY c.id_cliente;

-- mostrar los préstamos activos, ordenados por fecha de devolución más próxima
SELECT p.id_prestamo, c.nombre, l.titulo, p.fecha_prestamo 
FROM prestamos p 
JOIN clientes c ON p.id_cliente = c.id_cliente 
JOIN libros l ON p.id_libro = l.id_libro 
WHERE p.fecha_devolucion IS NULL 
ORDER BY p.fecha_prestamo ASC;

-- identificar los autores cuyos libros han sido más prestados
SELECT a.nombre, COUNT(p.id_prestamo) AS veces_prestado 
FROM autores a 
JOIN libros l ON a.id_autor = l.id_autor 
JOIN prestamos p ON l.id_libro = p.id_libro 
GROUP BY a.id_autor 
ORDER BY veces_prestado DESC;

-- 4. ACTUALIZAR Y ELIMINAR DATOS CON INTEGRIDAD REFERENCIAL

-- actualizar el género de un libro específico
UPDATE libros 
SET genero = 'Novela Contemporánea' 
WHERE id_libro = 1;

-- cambiar la nacionalidad de un autor sin afectar la relación con sus libros
UPDATE autores 
SET nacionalidad = 'Chilena' 
WHERE id_autor = 2;

-- borrar un cliente y asegurarse de que sus préstamos se eliminen automáticamente
DELETE FROM clientes 
WHERE id_cliente = 1;

-- 5. APLICAR TRANSACCIONES Y RESTRICCIONES

-- implementar una transacción que registre un nuevo préstamo y reduzca el stock del libro
START TRANSACTION;
INSERT INTO prestamos (id_cliente, id_libro, fecha_prestamo, fecha_devolucion) 
VALUES (2, 4, CURDATE(), NULL);
UPDATE libros 
SET stock = stock - 1 
WHERE id_libro = 4;
COMMIT;

-- simular un fallo en la operación y revertir los cambios usando ROLLBACK
START TRANSACTION;
INSERT INTO prestamos (id_cliente, id_libro, fecha_prestamo, fecha_devolucion) 
VALUES (3, 2, CURDATE(), NULL);
UPDATE libros 
SET stock = stock - 1 
WHERE id_libro = 2;
-- rollback simula la cancelación debido a un error (ej. cliente con deuda)
ROLLBACK; 

-- verificar que un cliente no pueda pedir prestado un libro si ya lo tiene pendiente de devolución
SELECT COUNT(*) AS prestamo_pendiente 
FROM prestamos 
WHERE id_cliente = 2 AND id_libro = 2 AND fecha_devolucion IS NULL;

