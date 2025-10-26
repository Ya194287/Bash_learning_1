#!/bin/bash

echo "=== Задание 1: Функционал Bash ==="
echo ""

# 1. Список файлов с типами
echo "1. Список файлов в текущей директории:"
for item in *; do
    if [ -f "$item" ]; then
        echo "   ФАЙЛ: $item"
    elif [ -d "$item" ]; then
        echo "   ПАПКА: $item"
    else
        echo "   ДРУГОЕ: $item"
    fi
done

echo ""

# 2. Проверка файла из аргумента
echo "2. Проверяем наличие файла из аргумента:"
if [ $# -eq 0 ]; then
    echo "   Ошибка: Укажите имя файла как аргумент"
    echo "   Пример: ./task1.sh readme.txt"
else
    filename=$1
    if [ -e "$filename" ]; then
        echo "   Файл '$filename' СУЩЕСТВУЕТ"
    else
        echo "   Файл '$filename' НЕ СУЩЕСТВУЕТ"
    fi
fi

echo ""

# 3. Информация о правах доступа
echo "3. Информация о файлах (имя и права доступа):"
for item in *; do
    if [ -e "$item" ]; then
        echo "   $(ls -l "$item" | awk '{print $1, $9}')"
    fi
done

