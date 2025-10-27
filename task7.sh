#!/bin/bash

echo "Задание 7: Alias и автодополнение"
echo ""

# 1. Объяснение и команда для alias
echo "1. Создаем alias ll для ls -la:"
echo "   Выполните в терминале: alias ll='ls -la'"
echo "   Затем: ll (для проверки)"
echo ""

# 2. Создаем тестовые папки
echo "2. Созданы тестовые папки для автодополнения:"
mkdir -p test_folder_1 test_folder_2 test_folder_abc
ls -d test_*
echo ""

# 3. Объяснение автодополнения
echo "3. Демонстрация автодополнения:"
echo "   Введите: cd test_f и нажмите Tab"
echo "   Должно дополниться до: cd test_folder_"
echo "   Или нажмите Tab дважды для списка вариантов"
echo ""

# 4. Инструкция для постоянного alias
echo "4. Чтобы сделать alias постоянным:"
echo "   Добавьте в ~/.bashrc: alias ll='ls -la'"
echo "   Выполните: source ~/.bashrc"
echo ""


