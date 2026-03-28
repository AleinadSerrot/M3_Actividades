Actividad M3C10 - Actividad AE-3

# INDICACIONES:

Tipo de Entrega: Código SQL en TXT, Word, PDF o capturas de pantalla (en orden).


INSTRUCCIONES ESPECÍFICAS:
1- Crear las siguientes tablas en la base de datos BiblioTechDB:

Autores: id_autor (PK, AUTO_INCREMENT), nombre, nacionalidad.

Libros: id_libro (PK, AUTO_INCREMENT), titulo, id_autor (FK), anio_publicacion, genero.

Clientes: id_cliente (PK, AUTO_INCREMENT), nombre, correo UNIQUE, telefono.

Prestamos: id_prestamo (PK, AUTO_INCREMENT), id_cliente (FK), id_libro (FK), fecha_prestamo, fecha_devolucion.

2- Insertar datos en las tablas:

Al menos 3 autores con diferentes nacionalidades.
Al menos 5 libros, cada uno asociado a un autor.
Al menos 3 clientes con datos ficticios.
Al menos 4 préstamos, asegurando que un cliente no pueda pedir dos veces el mismo libro sin haberlo devuelto.

3- Consultas SQL para manipulación de datos:

Mostrar todos los libros disponibles con su autor.
Listar los clientes que han tomado préstamos.
Obtener la cantidad de libros prestados por cada cliente.
Mostrar los préstamos activos, ordenados por fecha de devolución más próxima.
Identificar los autores cuyos libros han sido más prestados.

4- Actualizar y eliminar datos con integridad referencial:

Actualizar el género de un libro específico.
Cambiar la nacionalidad de un autor sin afectar la relación con sus libros.
Borrar un cliente y asegurarse de que sus préstamos se eliminen automáticamente.

5- Aplicar transacciones y restricciones:

Implementar una transacción que registre un nuevo préstamo y reduzca el stock del libro.
Simular un fallo en la operación y revertir los cambios usando ROLLBACK.
Verificar que un cliente no pueda pedir prestado un libro si ya lo tiene pendiente de devolución.


https://github.com/AleinadSerrot/M3_Actividades