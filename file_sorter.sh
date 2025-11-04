#!/bin/bash

echo "Автоматическая сортировка файлов"
echo ""

# Настройки
SORT_DIR="./test_files"
LOG_FILE="./file_sorter.log"

# Создаем директории для сортировки
mkdir -p "$SORT_DIR/Images"
mkdir -p "$SORT_DIR/Documents"
mkdir -p "$SORT_DIR/Archives"
mkdir -p "$SORT_DIR/Scripts"

# Функция логирования
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Создаем тестовые файлы если директория пуста
if [ -z "$(ls -A "$SORT_DIR" 2>/dev/null)" ]; then
    echo "Создаем тестовые файлы..."
    touch "$SORT_DIR/image1.jpg"
    touch "$SORT_DIR/image2.png" 
    touch "$SORT_DIR/document1.txt"
    touch "$SORT_DIR/document2.pdf"
    touch "$SORT_DIR/script1.sh"
    touch "$SORT_DIR/archive1.zip"
fi

log "Начало сортировки файлов в: $SORT_DIR"

# Счетчики
moved_count=0

# Функция для перемещения файлов
move_file() {
    local file=$1
    local target_dir=$2
    
    if [ -f "$file" ]; then
        mv "$file" "$target_dir/"
        log "Перемещен: $(basename "$file") -> $target_dir/"
        ((moved_count++))
    fi
}

echo "Сортировка файлов..."
echo ""

# Сортировка по расширениям
for file in "$SORT_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension="${filename##*.}"
        
        case "${extension,,}" in
            jpg|jpeg|png|gif|bmp)
                move_file "$file" "$SORT_DIR/Images"
                echo "зображение: $filename -> Images/"
                ;;
            txt|pdf|doc|docx|xls|xlsx)
                move_file "$file" "$SORT_DIR/Documents" 
                echo "Документ: $filename -> Documents/"
                ;;
            sh|bash|py|js)
                move_file "$file" "$SORT_DIR/Scripts"
                echo "Скрипт: $filename -> Scripts/"
                ;;
            zip|tar|gz|rar)
                move_file "$file" "$SORT_DIR/Archives"
                echo "Архив: $filename -> Archives/"
                ;;
        esac
    fi
done

log "Сортировка завершена. Перемещено файлов: $moved_count"

echo ""
echo "Сортировка завершена!"
echo "Перемещено файлов: $moved_count"
echo "Лог сохранен в: $LOG_FILE"
echo ""

# Показываем структуру после сортировки
echo "Структура папки после сортировки:"
find "$SORT_DIR" -type d | sort
