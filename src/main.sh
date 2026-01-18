#!/bin/bash
# Proje: Linux Cron Manager - GvnTech

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' 

function self_check() {
    echo -e "${CYAN}[INIT] Sistem kontrolleri yapiliyor...${NC}"
    if command -v crontab &> /dev/null; then
        echo -e "${GREEN}[OK] Crontab servisi aktif.${NC}"
    else
        echo -e "${RED}[HATA] Crontab bulunamadi!${NC}"
        exit 1
    fi
}

function translate_cron() {
    echo -e "\n${CYAN}--- Crontab Cevirici ---${NC}"
    read -p "Zamanlama kodunu girin (Orn: */5 * * * *): " cron_input
    echo -e "${GREEN}Analiz: Gorev '$cron_input' periyodunda calisacak.${NC}"
    read -p "Devam..."
}

function backup_wizard() {
    echo -e "\n${CYAN}--- Yedekleme Sihirbazi ---${NC}"
    read -p "Kaynak Klasor: " src
    read -p "Hedef Klasor: " dest
    if [ -d "$src" ]; then
        echo -e "${GREEN}[OK] Yedekleme planlandi: $src -> $dest${NC}"
    else
        echo -e "${RED}[HATA] Klasor yok.${NC}"
    fi
    read -p "Devam..."
}

function show_logs() {
    echo -e "\n${CYAN}--- Cron Loglari ---${NC}"
    grep CRON /var/log/syslog 2>/dev/null | tail -n 5
    read -p "Devam..."
}

self_check
while true; do
    clear
    echo -e "${CYAN}=== LINUX CRON MANAGER ===${NC}"
    echo "1. Zamanlama Cevir"
    echo "2. Yedekleme Ekle"
    echo "3. Loglari Izle"
    echo "4. Cikis"
    read -p "Secim: " opt
    case $opt in
        1) translate_cron ;;
        2) backup_wizard ;;
        3) show_logs ;;
        4) exit 0 ;;
        *) echo "Gecersiz" ;;
    esac
done
