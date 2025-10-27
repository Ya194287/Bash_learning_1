#!/bin/bash

echo "Задание 6: Ввод/вывод и перенаправление"

echo "Создаем файл input.txt с тестовыми данными..."
echo "Строка 1" > input.txt
echo "Строка 2" >> input.txt
echo "Строка 3" >> input.txt

echo "1. Чтение данных из input.txt:"
cat input.txt

echo "2. Подсчет строк и запись в output.txt:"
wc -l < input.txt > output.txt
echo "Результат сохранен в output.txt"
echo "Содержимое output.txt:"
cat output.txt

echo "3. Перенаправление ошибок в error.log:"
ls non_existent_file.txt 2> error.log
echo "Ошибки сохранены в error.log"
echo "Содержимое error.log:"
cat error.log
