#!/bin/bash

echo "Задание 5: Управление процессами"

# Запускаем три sleep в фоне
echo "Запускаем процессы sleep в фоновом режиме:"
sleep 25 &
echo "1. sleep 25s запущен (PID: $!)"

sleep 15 & 
echo "2. sleep 15s запущен (PID: $!)"

sleep 5 &
echo "3. sleep 5s запущен (PID: $!)"

# Показываем список задач
echo "Список фоновых задач:"
jobs

echo ""
echo "Управление задачами:"
echo "fg %1 - перевести задачу 1 в foreground"
echo "bg %1 - перевести задачу 1 в background" 
echo "jobs    - показать все задачи"
echo ""

# Даем время посмотреть
sleep 3

echo "Завершаем все sleep процессы..."
pkill sleep

echo "Готово!"
