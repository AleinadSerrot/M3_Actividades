INDICACIONES:

Tipo de Entrega: Repositorio en GitHub más presentación final explicando funcionalidades y tecnologías utilizadas.



INSTRUCCIONES / CRITERIOS DE EVALUACIÓN:
1.- Creación de la base de datos:

Crear una base de datos llamada clinica_veterinaria.

2.- Creación de tablas:
Crear las siguientes tablas con las siguientes relaciones y restricciones:

Dueño:

**id_dueno (INT, PRIMARY KEY, AUTO_INCREMENT)
nombre (VARCHAR(100))
direccion (VARCHAR(200))
telefono (VARCHAR(20))**

Mascota:

**id_mascota (INT, PRIMARY KEY, AUTO_INCREMENT)
nombre (VARCHAR(100))
tipo (VARCHAR(50)) - Ejemplo: Perro, Gato
fecha_nacimiento (DATE)
id_dueno (INT, FOREIGN KEY que hace referencia a Dueño.id_dueno)**

Atención:

**id_atencion (INT, PRIMARY KEY, AUTO_INCREMENT)
fecha_atencion (DATE)
descripcion (TEXT)
id_mascota (INT, FOREIGN KEY que hace referencia a Mascota.id_mascota)
id_profesional (INT, FOREIGN KEY que hace referencia a Profesional.id_profesional)**

Profesional:

**id_profesional (INT, PRIMARY KEY, AUTO_INCREMENT)
nombre (VARCHAR(100))
especialidad (VARCHAR(100))

Datos:

Dueños:
1, Juan Pérez, Calle Falsa 123, 555-1234
2, Ana Gómez, Avenida Siempre Viva 456, 555-5678
3, Carlos Ruiz, Calle 8 de Octubre 789, 555-8765

Mascotas:

1, Rex, Perro, 2020-05-10, 1
2, Luna, Gato, 2019-02-20, 2
3, Fido, Perro, 2021-03-15, 3

Profesionales:

1, Dr. Martínez, Veterinario
2, Dr. Pérez, Especialista en dermatología
3, Dr. López, Cardiólogo veterinario

Atenciones:

1, 2025-03-01, Chequeo general, 1, 1
2, 2025-03-05, Tratamiento dermatológico, 2, 2
3, 2025-03-07, Consulta cardiológica, 3, 3

Instrucciones de consultas:

Obtener todos los dueños y sus mascotas.
Obtener las atenciones realizadas a las mascotas con los detalles del profesional que atendió.
Contar la cantidad de atenciones por profesional.
Actualizar la dirección de un dueño (por ejemplo, cambiar la dirección de Juan Pérez).
Eliminar una atención (por ejemplo, atención con id 2).
Realizar una transacción para agregar una nueva mascota, atención y actualización de información.


https://github.com/AleinadSerrot/M3_Actividades