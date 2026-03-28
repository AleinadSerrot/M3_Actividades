Actividad M3C6 - Actividad AE 4

INDICACIONES:

Tipo de Entrega: Zip, .Rar




INSTRUCCIONES ESPECÍFICAS:

# Modelo Entidad-Relación (ER):

Autores: Con atributos como **id\_autor, nombre, apellido**
Libros: Con atributos como **id\_libro, titulo, id\_autor, anio\_publicacion**
Préstamos: Con atributos como **id\_prestamo, id\_libro (relacionado con libros), fecha\_prestamo, id\_usuario**

# Crear las tablas:

La tabla autores debe tener id\_autor como clave primaria
La tabla libros debe tener id\_libro como clave primaria y id\_autor como clave foránea que hace referencia a la tabla autores
La tabla prestamos debe tener id\_prestamo como clave primaria, id\_libro como clave foránea que hace referencia a la tabla libros, y un campo id\_usuario (puede ser un campo simple para simular a los usuarios)

# Incluir restricciones:

El campo titulo en la tabla libros no debe ser nulo
Asegurar que los libros no se puedan prestar si no están registrados en la tabla libros

# Insertar datos:

Insertar al menos dos autores, tres libros y tres registros de préstamos
Insertar un préstamo para un libro que no exista y verificar que la base de datos rechace la inserción

# Validar integridad referencial:

Intentar insertar un préstamo con un libro o autor inexistente y asegurarse de que la base de datos rechace la inserción debido a la violación de la integridad referencial.



**https://github.com/AleinadSerrot/M3\_Actividades**

