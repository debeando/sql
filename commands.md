# Comando básicos

Estos son comando básicos de exploración para navegar denteo del servidor de MySQL.

## Listar las bases de datos:

```sql
SHOW DATABASES;
```

## Usar una base de datos:

```sql
USE demo;
```

## Listar las tablas:

Para ejecutar este comando debe estar dentro de una base de datos.

```sql
SHOW TABLES;
```

## Listar las columnas de una tabla:

Hay dos formas de hacerlo, usando la sentencia abreviada `DESC` o la version larga `DESCRIBE`.

```sql
DESC table_demo;
DESCRIBE table_demo;
```

## Listar las consultas:

Esto es como el administrador de tareas del S.O. pero a nivel de MySQL.

```sql
SHOW PROCESSLIST;
```

## Ver los indices de una tabla:

```sql
SHOW INDEXES FROM table_demo;
```

Recuerda reemplazar `table_demo` por el nombre de una tabla existente, puede usar el comando `SHOW TABLES;` para conocer las tablas disponibles.

## Ver la sentencia de creación de una tabla:

```sql
SHOW CREATE TABLE table_demo;
```

## Salir de la terminal:

Si está dentro de un cliente gráfico no le hace falta, solo se usa cuando accede al servidor mediante la herramienta para cli llamada `mysql`.

```sql
EXIT;
```
