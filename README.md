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
