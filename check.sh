#!/bin/bash

# Цветовая палитра
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}====================================================${NC}"
echo -e "       ${BOLD}ПРОВЕРКА CDN-СЕРВЕРОВ МУЗЫКИ INSTAGRAM${NC}       "
echo -e "${CYAN}====================================================${NC}"
echo ""

domains=(
  "scontent.cdninstagram.com"
  "z-p3-cdn.fbsbx.com"
)

for domain in "${domains[@]}"; do
  status=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 "https://$domain")
  
  if [ "$status" == "204" ] || [ "$status" == "000" ] || [ "$status" == "403" ]; then
    printf " Домен: ${BOLD}%-30s${NC} -> Статус: ${YELLOW}%-3s${NC} | [ ${RED}${BOLD}НЕ РАБОТАЕТ${NC} ]\n" "$domain" "$status"
  else
    printf " Домен: ${BOLD}%-30s${NC} -> Статус: ${GREEN}%-3s${NC} | [ ${GREEN}${BOLD}РАБОТАЕТ${NC} ]\n" "$domain" "$status"
  fi
done

echo ""
echo -e "${CYAN}====================================================${NC}"
