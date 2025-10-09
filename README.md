# Uso del proceso solicitante

```
# 1. Construir la imagen

docker-compose up -d

# Si solo quieres esta imagen
# docker build . -t p_solicitante

# 2. Usar

docker run --rm -it p_solicitante -f         # Friendly
docker run --rm -it p_solicitante -i <input> # Con un archivo
```

# Operaciones

## Renovación (asincrona)

```json
{
  "operation": "renew",
  "copy_id": string,
  "user_id": string,
}
```

Solo se podrá renovar un libro dos veces, cada renovación aumenta una semana desdse la fecha actual, por lo que esta operación no contiene argumentos de tiempo.

| parámetro |  tipo   | descripción |
| :-------: | :-----: | :---------: |
| operation | "renew" |             |
|  copy_id  | string  |   uuidv7    |
|  user_id  | string  |   uuidv7    |

## Reserve (sincrona)

```json
{
  "operation": "reserve",
  "book_id": string,
  "user_id": string,
  "location": string,
  "duration": string
}
```

| parámetro |   tipo    |      descripción       |
| :-------: | :-------: | :--------------------: |
| operation | "reserve" |                        |
|  book_id  |  string   |         uuidv7         |
|  user_id  |  string   |         uuidv7         |
| location  |  string   | identifier of location |
| duration  |  string   | example: 1d , 4d , 1w  |

Busca una copy del libro con id `book_id` que se encuentre en la locación pasada como parámetro `location`, al ser asíncrona, el proceso solicitante esperará el resultado de la db, de forma que si no es posible solicitar prestada una copia del libro en la locación, se mostrará un error al usuario.

## Return (asíncrona)

```json
{
  "operation": "return",
  "copy_id": string,
  "user_id": string,
}
```

| parámetro |   tipo   | descripción |
| :-------: | :------: | :---------: |
| operation | "return" |             |
|  copy_id  |  string  |   uuidv7    |
|  user_id  |  string  |   uuidv7    |

Devuelve un libro prestado.

# Despliegue

```sh
docker-compose --profile actores up -d
docker-compose --profile database up -d
docker-compose --profile load_manager up -d
```