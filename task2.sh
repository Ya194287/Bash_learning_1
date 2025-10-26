#!/bin/bash

echo "Задание 2: Работа с PATH"


echo "Текущий PATH:"
echo $PATH

if [ $# -eq 0 ]; then
    echo "Укажите папку для добавления: ./task2.sh /папка"
    exit 1
fi

new_dir=$1

echo "Добавляем папку: $new_dir"
export PATH="$PATH:$new_dir"

echo "Новый PATH:"
echo $PATH

