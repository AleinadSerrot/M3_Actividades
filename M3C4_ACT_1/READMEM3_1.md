Actividad M3C4 - Actividad AE 5

INDICACIONES:

Tipo de Entrega: Zip, .Rar.



INSTRUCCIONES ESPECÍFICAS:
Una institución educativa necesita digitalizar su sistema de gestión de cursos y estudiantes. Los administradores requieren un modelo de base de datos que permita registrar información sobre cursos, estudiantes y profesores, así como la relación entre ellos.

# El sistema debe permitir:

Registrar estudiantes y su historial de cursos.
Permitir que un estudiante se inscriba en varios cursos.
Asignar profesores a los cursos.
Gestionar las calificaciones de los estudiantes en cada curso.

# Requerimientos:

Modelado Conceptual (MER):

Identificar entidades principales y entidades débiles si las hay.
Definir atributos y claves primarias para cada entidad.
Establecer relaciones entre entidades, indicando cardinalidades y restricciones.

Transformación al Modelo Relacional:

Convertir el MER en un modelo relacional, asegurando integridad referencial.
Definir claves primarias y foráneas.
Aplicar reglas de normalización para evitar redundancias innecesarias.

Entidades principales:

Estudiante:  **id\_estudiante, nombre, apellido, correo**
Curso: **id \_curso, nombre, descripción, cantidad\_horas**

Profesor: **id\_profesor, nombre, apellido, especialidad**

Inscripción: **id\_inscripción, id\_estudiante (FK), id\_curso (FK), fecha\_inscripción**

Calificación: **id\_calificación, id\_estudiante (FK), id\_curso (FK), nota\_final**

Relaciones clave:

Un estudiante puede inscribirse en muchos cursos.
Un curso puede tener muchos estudiantes inscritos.
Un profesor puede dictar varios cursos, pero cada curso tiene un solo profesor.
Un estudiante puede tener varias calificaciones, una por cada curso inscrito.

Instrucciones para los estudiantes:
Diseña el MER en una herramienta como Lucidchart, Draw.io o MySQL Workbench.
Transforma el MER en un modelo relacional, identificando claves primarias y foráneas.
Asegura la normalización para evitar datos redundantes o Inconsistentes.



https://github.com/AleinadSerrot/M3\_Actividades

