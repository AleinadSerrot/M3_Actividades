-- transformación del modelo entidad-relación (mer) al modelo relacional
-- no olvidar realizar la BD paso a paso, el orden sí importa para asegurar la integridad referencial

-- crear y usar la base de datos
CREATE DATABASE hogwarts_db;
USE hogwarts_db;

-- se crean primero las tablas principales (entidades fuertes) que no tienen llaves foráneas
-- crear tabla profesor
CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad VARCHAR(100)
);

-- crear tabla estudiante
CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(100) UNIQUE
);

-- se crean las tablas dependientes, aplicando las reglas de normalización
-- crear tabla curso
-- la relación es 1:N (un profesor dicta varios cursos, pero cada curso tiene un solo profesor), por lo que la llave foránea va en esta tabla
CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    cantidad_horas INT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

-- crear tabla inscripción 
-- esta es una entidad débil/intermedia que resuelve la relación N:M (muchos a muchos) entre estudiantes y cursos
CREATE TABLE inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- crear tabla calificación 
-- se relaciona al estudiante con el curso para gestionar sus notas finales de forma normalizada
CREATE TABLE calificacion (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    nota_final DECIMAL(3,1),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- INSERCIÓN DE DATOS DE PRUEBA

-- insertar profesores
INSERT INTO profesor (nombre, apellido, especialidad) VALUES
('Severus', 'Snape', 'Pociones'),
('Minerva', 'McGonagall', 'Transformaciones'),
('Filius', 'Flitwick', 'Encantamientos');

-- insertar estudiantes
INSERT INTO estudiante (nombre, apellido, correo) VALUES
('Harry', 'Potter', 'hpotter@hogwarts.edu'),
('Hermione', 'Granger', 'hgranger@hogwarts.edu'),
('Ron', 'Weasley', 'rweasley@hogwarts.edu');

-- insertar cursos
INSERT INTO curso (nombre, descripcion, cantidad_horas, id_profesor) VALUES
('Pociones Avanzadas', 'Elaboración de filtros y pociones complejas', 120, 1),
('Transformaciones Básicas', 'El arte de alterar la forma y apariencia', 100, 2),
('Encantamientos I', 'Hechizos fundamentales y uso de la varita', 90, 3);

-- insertar inscripciones
-- se inscribe a los estudiantes en distintos cursos para demostrar la funcionalidad del sistema
INSERT INTO inscripcion (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, '2026-03-01'),
(2, 1, '2026-03-01'),
(2, 2, '2026-03-02'),
(3, 3, '2026-03-03');

-- insertar calificaciones
-- se asignan las notas finales correspondientes al historial de cada estudiante
INSERT INTO calificacion (id_estudiante, id_curso, nota_final) VALUES
(1, 1, 5.5),
(2, 1, 7.0),
(2, 2, 6.8),
(3, 3, 4.5);