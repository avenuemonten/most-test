#!/bin/bash
set -e

echo "Сборка проекта запущена..."

if grep -q "MOST" hello.txt; then
    echo "Сборка проекта прошла успешно"
else
    echo "При сборке проекта произошла ошибка!"
    exit 1
fi

mkdir -p ./files
cp hello.txt ./files/
echo "Файл/Артефакт сохранён в ./files/"