#!/bin/bash
set -e

#Установка всё в одном
ZBX_DBNAME="most"
ZBX_DBUSER="most"
ZBX_DBPASS="P@ssw0rd"

#Проверки добавлены ради красоты, но так же они нужны
echo "Проверка прав суперпользователя"
if [ "$EUID" -ne 0]; then
        echo "Запусти скрипт от root. sudo -i."
        exit 1
fi

echo "Обновляем пакеты.."
apt update && apt install -y wget curl gnupg lsb-release

echo "Добавляем репозитории"
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb
apt update

echo "Устанавливаем Zabbix Server"
apt install -y zabbix-server-pgsql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts

echo "Устанавливаем PostgreSQL..."
apt install -y postgresql postgresql-contrib

echo "Создаём БД PostgreSQL для Zabbix.."
sudo -u postgres psql <<EOF
CREATE DATABASE $ZBX_DBNAME ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C' template template0;
CREATE USER $ZBX_DBUSER WITH ENCRYPTED PASSWORD '$ZBX_DBPASS';
GRANT ALL PRIVILEGES ON DATABASE $ZBX_DBNAME TO $ZBX_DBUSER;
\q
EOF

echo "Настройка структуры БД..."
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u postgres psql $ZBX_DBNAME

echo "Настраиваем конфиг Zabbix.."
CONF_FILE="/etc/zabbix/zabbix_server.conf"
if [ ! -f "$CONF_FILE" ]; then
        echo "Файл конфигурации $CONF_FILE не найден."
        exit 1
fi

sed -i "s/^# DBName=.*/DBName=$ZBX_DBNAME/" "$CONF_FILE"
sed -i "s/^# DBUser=.*/DBUser=$ZBX_DBUSER/" "$CONF_FILE"
sed -i "s/^# DBPassword=.*/DBPassword=$ZBX_DBPASS/" "$CONF_FILE"

echo "Перезапускаем службы.."
systemctl restart zabbix-server apache2
systemctl enable zabbix-server apache2

echo -e "Установка завершена. Откройте в браузере: http://$IP/zabbix для завершения настройки."