#!/bin/bash

echo "Задание 3: Управляющие конструкции (условия и циклы)"

# Запрос числа
read -p "Введите число: " number

# Проверяем, что ввели число
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Ошибка: нужно ввести целое число!"
    exit 1
fi

# Проверка числа 
echo "Проверка числа:"
if [ "$number" -gt 0 ]; then
    echo "Число $number положительное"
elif [ "$number" -lt 0 ]; then
    echo "Число $number отрицательное"
else
    echo "Число равно нулю"
fi

# Подсчет с помощью while (только для положительных чисел)
if [ "$number" -gt 0 ]; then
    echo ""
    echo "Подсчет от 1 до $number:"
    count=1
    while [ $count -le $number ]; do
        echo $count
        count=$((count + 1))
    done
fi

echo "Готово!"
