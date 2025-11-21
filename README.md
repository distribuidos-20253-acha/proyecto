# Uso del sistema

```
# 1. Configurar en el env las ips de los dispositivos

# 2. Construir la libreria compartida en cada sede
cd acha-lib
bun i
bun x tsc

# 2. Construir la sede deseada en cada sede (esperar a que termine y darle unos 10 segundos a que termine de prender la db)
docker compose --f compose-main.yml --profile sede up -d
docker compose --f compose-tally.yml --profile sede up -d

#3. Crear el proceso solicitante
cd p_solicitante
node index.ts -f
```

Cada sede tiene su propio prisma studio, este estará por defecto en el puerto 5555.
Cada sede tiene su propio catalog service, que permite el stress testing y el buscador de libros.
