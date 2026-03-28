-- no olvidar realizar la BD paso a paso, el orden si importa

-- crear y usar la base de datos
CREATE DATABASE biblioM3C6;
USE biblioM3C6;

-- crear tabla autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

-- crear tabla libros
-- restricción: el campo titulo no debe ser nulo
CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT,
    anio_publicacion INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- crear tabla prestamos
-- asegurar que los libros no se puedan prestar si no están registrados en la tabla libros (fk)
CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY,
    id_libro INT,
    fecha_prestamo DATE,
    id_usuario INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- INSERCIÓN DE DATOS DE PRUEBA

-- insertar autores
INSERT INTO autores (id_autor, nombre, apellido) VALUES 
(1, 'Isabel', 'Allende'),
(2, 'Felipe', 'Lecannelier'),
(3, 'Gabriel', 'García Márquez');

-- insertar libros
INSERT INTO libros (id_libro, titulo, id_autor, anio_publicacion) VALUES 
(101, 'Eva Luna', 1, 1987),
(102, 'La casa de los espíritus', 1, 1982),
(103, 'Mujeres del alma mía', 1, 2020),
(104, 'AMAR', 2, 2016),
(105, 'Trauma y apego', 2, 2023),
(106, 'Cien años de soledad', 3, 1967);

-- insertar registros de préstamos
INSERT INTO prestamos (id_prestamo, id_libro, fecha_prestamo, id_usuario) VALUES 
(1001, 101, '2026-03-01', 501),
(1002, 104, '2026-03-05', 502),
(1003, 106, '2026-03-10', 503);

-- VALIDAR INTEGRIDAD REFERENCIAL

-- intentar insertar un préstamo para un libro que no exista (esto arrojará error)
INSERT INTO prestamos (id_prestamo, id_libro, fecha_prestamo, id_usuario) VALUES 
(1004, 999, '2026-03-15', 504);

-- intentar insertar un libro con un autor inexistente (esto arrojará error)
INSERT INTO libros (id_libro, titulo, id_autor, anio_publicacion) VALUES 
(107, 'Libro Fantasma', 99, 2026);