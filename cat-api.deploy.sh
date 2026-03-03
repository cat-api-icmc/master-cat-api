#!/bin/bash

PURPLE=$(tput setaf 5)
NC=$(tput sgr0)
SIGNATURE="${PURPLE}[CAT_API]${NC}"

echo "${SIGNATURE} Iniciando deploy dos containers"

echo "${SIGNATURE} Parando containers..."
docker stop $(docker ps -aq)

echo "${SIGNATURE} Atualizando containers..."
docker compose pull

echo "${SIGNATURE} Subindo containers atualizados..."
docker compose up -d --force-recreate

echo "${SIGNATURE} Limpando containers antigos..."
docker system prune -f

echo "${SIGNATURE} Deploy concluído com sucesso!"
