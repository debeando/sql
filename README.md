Curso de SQL basico en MySQL
---

# Iniciar MySQL

```bash
docker run --name mysql -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 -d mysql:8
```

NOTA: Puede que reinicies el equipo y el contenedor se detenga, puedes iniciarlo de la siguiente manera:

```bash
docker start mysql
```

## Entrar en el MySQL:

```
docker exec -it mysql mysql -h 127.0.0.1 -uroot -padmin
```

## Entrar en la instancia de MySQL

```
docker exec -it mysql /bin/bash
```

## Entrar al MySQL teniendo el cliente en local instalado:

```
mysql -h 127.0.0.1 -u root -padmin
```

mysqldump -h 127.0.0.1 -u root -padmin demo > demo.sql

mysql -h 127.0.0.1 -u root -padmin < demo.sql



Clientes para conectarse al MySQL



