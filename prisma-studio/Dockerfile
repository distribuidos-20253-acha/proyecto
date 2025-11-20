# Imagen oficial de Bun
FROM oven/bun:debian

# Directorio de trabajo
WORKDIR /app

# Copia del proyecto
COPY . .

# Instalación de dependencias (modo producción)
RUN bun install --production

RUN apt-get update -y && apt-get install -y openssl

ARG PORT
ARG DATABASE_URL

RUN echo "DATABASE_URL=${DATABASE_URL}" > .env

ENV PORT=${PORT}

# Ejecución directa del servicio
CMD bun x prisma studio --port $PORT --browser none
