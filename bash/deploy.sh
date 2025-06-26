#!/bin/bash
set -e

REMOTE_USER=devops2
REMOTE_HOST=192.168.68.133
TARGET_DIR=/opt/most-test

echo "Копируем файл на $REMOTE_HOST..."
echo "Пользователь: $REMOTE_USER"

ssh $REMOTE_USER@$REMOTE_HOST "sudo mkdir -p $TARGET_ID && sudo chown $REMOTE_USER $TARGET_DIR"
scp ./files/hello.txt $REMOTE_USER@$REMOTE_HOST:$TARGET_DIR/

echo "Файл/Артефакт успешно скопирован в $TARGET_DIR на $REMOTE_HOST"

# Телеграм уведомление
echo "Отправка статуса выполнении скрипта"

# Сообщение
BOT_TOKEN="8036616969:AAFcRIXcGb9lR5Yuk-5PlYDhffLWpNle_g0"
CHAT_ID="-1002562480389"
MESSAGE="CI/CD этап успешно завершён на $(hostname)"

curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
  -d chat_id="$CHAT_ID" \
  -d text="$MESSAGE"