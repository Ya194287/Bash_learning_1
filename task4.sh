#!/bin/bash

# Функция приветствия
greet() {
    echo "Hello, $1"
}

# Функция сложения чисел
sum() {
    result=$(( $1 + $2 ))
    echo $result
}

echo "Задание 4: Работа с функциями"

# Демонстрация функции приветствия
echo "Функция greet:"
greet "World"
greet "Bash"

# Демонстрация функции сложения
echo "Функция sum:"
echo "Сумма 5 + 3 = $(sum 5 3)"
echo "Сумма 10 + 20 = $(sum 10 20)"

# Интерактивная часть
echo "Интерактивный пример:"
read -p "Введите имя: " name
greet "$name"

read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

if [[ "$num1" =~ ^[0-9]+$ ]] && [[ "$num2" =~ ^[0-9]+$ ]]; then
    result=$(sum $num1 $num2)
    echo "Сумма $num1 + $num2 = $result"
else
    echo "Ошибка: нужно вводить числа!"
fi
