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