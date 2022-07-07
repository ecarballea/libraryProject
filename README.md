# libraryProject

## Orientacion:
Ejercicio práctico Python/DJango/Rest.
Una biblioteca tiene un catálogo de libros existentes, donde solo existe un ejemplar de cada título, un registro de préstamos y un registro de lectores. Las propiedades de cada entidad serán las mínimas necesarias solo para la realización del ejercicio. 
1-	Libro (id, nombre, ISBN, estado booleano para saber si el libro está prestado)
2-	Lector (id, nombre)
3-	Préstamo (fecha del préstamo), donde una persona puede tener muchos libros prestados.
Desarrollar un sistema con Python/DJango que exponga una web listando los libros existentes y puedan adicionarse y eliminarse, pero que exponga un api para una aplicación móvil que se desarrollaría en el futuro. Utilizar el ORM de DJango para acceder al repositorio de datos, preferiblemente almacenado en MySql o PostgreSQL, usando preferiblemente el enfoque code first. 
El sistema debe arrancar al menos con dos Lectores, y la Api debe exponer el CRUD completo de libros y además la funcionalidad de realizarle un préstamo a un Lector, dado el Id del libro y el id del lector. Deben realizarse las validaciones pertinentes para la realización de un préstamo. Documentar los métodos expuestos en la API como ayuda a los desarrolladores móviles.


### Carpeta api_documentation:
Contiene los archivos *openapi.json* y *openapi.yaml* que pueden ser cargados desde https://editor.swagger.io/ para ver la documentación de la api que servirá para desarrolladores móviles. Dentro de la carpeta hay un documento word con una explicacion similar a esta con una imagen de este procedimiento en acción.

### Carpeta DB_library:
Contiene la Base de Datos del proyecto *libraryproject.sql* almacenada en MySql y creada en phpMyAdmin.

### Carpeta libraryProject:
Contiene los archivos centrales el proyecto.

### Carpeta api_library:
Contiene la aplicacion de la api del proyecto.
