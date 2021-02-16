# Query Review

Lo complicado de hacer revisión de modelos de datos, es que venden un concepto acompañado del modelo en vez de ser objetivos y formular de forma abstracta el requerimiento sin tener un modelo para evitar prejuicios.

Con una *Pull Request*, lo que buscamos con estas **buenas prácticas** es evaluar la propuesta de cambios con la finalidad de enterarnos, validar, estandarizar, y reducir problemas a futuro,

Continuamente se están realizando cambios en el modelo de datos, esta es una lista de los puntos a evaluar cuando se hace una Pull Request, esta acción de revisión la llamaremos en ahora en adelante como **Query Review.** Al igual como lo hace un equipo de desarrollo, solo que nosotros velaremos por aquellos cambios a nivel de base de datos.

Posiblemente nosotros debamos hacer el cambio porque es una tabla muy grande, hay mucho tráfico y para prevenir degradación y/o caída del servicio debamos asumir el control. Y luego puede que debamos marcar en la tabla de migraciones que fue aplicada, esto último depende de la herramienta que usemos.

## Generales:

- Nombres en inglés, las tablas en plural porque contiene varios registros, y los campos en singular por que hace referencia a un registro.
- No usar palabras reservadas para nombres de columnas o tablas o de cualquier otro objeto, por ejemplo: evitar usar password, status, user.
- No usar símbolos reservados como por ejemplo los puntos.
- Usar los separadores de la tabla _ y no los puntos. Esto sería usar la nomenclatura Snake Case como si habláramos de Camel o Pascal Case.
- Asegurarse que cualquier cambio sobre una tabla no supone un bloqueo mayor del tiempo considerable para comprometer el servicio.
- Toda tabla debe tener una Primary Key (bigint unsigned) y un UUID de tipo UNIQUE que asignará la aplicación. La Primary Key es gestionada por la base de datos para uso interno, no debería ser usada para establecer relaciones, y el UUID es generado por la aplicación y es utilizado para hacer relaciones.

## Tablas:

- Todas las tablas deben ser de tipo de engine InnoDB y por lo menos con las propiedades `CHARSET=UTF-8` y `COLLATE=utf8_unicode_ci`. El *COLLATE* puede variar dependiendo del criterio de búsqueda a implementar.
- El ROW_FORMAT de cada tabla se recomienda para uso general que sea DYNAMIC.
- Todas las tablas deben tener una clave primaria.
- El nombre para una tabla intermedia que relaciona dos tablas es separada con un subguión, por ejemplo: users y products se puede llamar users_products.
- Tener columnas de auditoría, estas también implican para el eliminado lógico de los datos, por ejemplo: created_at, updated_at, deleted_at, created_by, deleted_by. Las que terminan en *_at* son de tipo TIMESTAMP y las que terminan en *_by* puede ser BIGINT que hace referencia para algún usuario del sistema.
- Documentar las tablas con alguna descripción muy breve.

## Columnas:

- Todas las columnas que son de tipo **Foreign Key** deben usar el siguiente tipo de dato si usa un valor entero: `BITINT UNSIGNED`. En caso de ser un **UUID** usar el tipo de dato `BINARY(16)` o `CHAR(24)`, el *CONSTRAINT* no es obligatorio. Y deben ser del mismo tipo de dato entre ambas tablas donde se define la relación.
- Evitar la propiedad de dejar valores vacíos por defecto: `NOT NULL DEFAULT ''`.
- Documentar las columnas con alguna descripción muy breve y significativa.

## Claves primarias:

- Se debe usar Primary Key BIGINT UNSIGNET Auto Increment en todas las tablas.
- No usar la combinación de varias columnas.
- Si es de tipo BIGINT deben tener las siguientes propiedades: `BITINT UNSIGNED, NOT NULL, AUTO_INCREMENT`.
- Para columnas que contengan un **UUID** se recomienda usar el tipo de dato `BINARY(16)` o `CHAR(36)` (Preferiblemente char) y si es un **Primary Key hipotético** o de tipo único debe definirlas con el constraint UNIQUE.

## Clave foráneas:

- Tener una nomenclatura constante para nombrar columnas de tipo FOREIGN KEY, debe estar formado por el nombre de la tabla foránea en singular y el sufijo *_id*, por ejemplo: user_id, profile_id ó address_id.
- Para aquellas columnas que hacen referencia a un valor foraneo fuera del modelo, como un token o code particular, definirlo con el nombre de la funcionalidad y un sufijo _token, _code por ejemplo: auth_token, publication_code. No debe usar el *_id* porque está reservado para las claves foráneas.
- Evitar en lo posible usar FOREIGN KEY con la posibilidad de permitir NULL porque afecta al rendimiento.

## Índices (**_idx**):

- No crear un índice exclusivo de una columna que tiene el CONSTRAINT del FOREIGN KEY, ya el CONSTRAINT define el índice. De igual forma pasa con los PRIMARY y UNIQUE KEY.

## Consultas:

- Evitar el uso abusivo de IN con muchos valores, nos referimos a más de 100 cómo muchos valores.
- Evitar el uso de GROUP BY, ORDER BY en consultas con muchos datos.
- Evitar el uso de JOIN con muchos datos.
- El tamaño de la tabla y el tráfico sobre ella supone un bloqueo considerable mayor de 10s que deba requerir la implementación de la herramienta `pt-online-schema-change`. El tiempo de 10s depende de los timeouts definidos en el servidor de aplicaciones WEB. Incluso la latencia en las replicaciones serán afectadas y debemos saber cual es el margen máximo aceptable, cualquier cambio debe ser probado en un entorno de prueba lo más real a producción.

el rendimiento y poder ocasionar una parada absoluta de la plataforma.

- Evitar que el CONSTRAINT tenga una acción en cascada, por ejemplo: Que al eliminar un registro padre no elimine automáticamente sus hijos: ON DELETE RESTRICT, ON UPDATE RESTRICT.

por que es un peligro, eliminar no es bueno porque no deja rastro de lo que paso, cuesta recuperar o es imposible recuperar. si son muchos registros a borrar se convierte en una tarea que bloquea y ocacionaria problemas posteriores como contencion.

- Si es posible, agregar un CONSTRAINT de tipo UNIQUE (**_uq**) para evitar registros duplicados, por ejemplo: el UNIQUE para la columna email de la tabla users.
- Ser conscientes de las diferencias que hay entre los tipos de datos como; CHAR, VARCHAR, ENUM, TEXT entre sus variantes. Cada uno tiene sus ventajas y desventajas, cada uno influye en la optimización de memoria, tiempo de respuesta y/o búsqueda o penaliza en disco.
- Si se añade o modifica un índice, debe estar acompañada de la consulta para demostrar el caso y así se puede hacer una evaluación.

Es importante destacar que siempre hay excepciones dependiendo de las reglas de negocio, pero debe estar documentado para evitar malos entendidos a futuro.

## Ejemplo

Vamos a mostrar un ejemplo de como debe ser una estructura mínima de una tabla:

```sql
CREATE TABLE `vouchers` (
  `id` bigint(20) unsigned AUTO_INCREMENT,
  `vouchers_id` CHAR(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vouchers_un` (`vouchers_id`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`),
  KEY `deleted_at_idx` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
```
