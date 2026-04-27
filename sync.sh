#!/bin/bash

cd ~/niri-dotfiles || exit

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

if [ -z "$(git status --porcelain)" ]; then
  echo -e "${GREEN}✓ Nenhuma mudança para commitar!${NC}"
  exit 0
fi

git add . &&
  git commit -m "Atualização" &&
  git push

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✓ Dotfiles sincronizados com sucesso!${NC}"
else
  echo -e "${RED}✗ Erro ao sincronizar. Verifique os logs acima.${NC}"
  exit 1
fi
