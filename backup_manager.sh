#!/bin/bash

echo "Менеджер резервного копирования"
echo ""

# Настройки
BACKUP_DIR="./backups"
LOG_FILE="./backup.log"
SOURCE_DIR="."

# Создаем директорию для бэкапов
mkdir -p "$BACKUP_DIR"

# Функция логирования
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Проверяем аргумент
if [ $# -eq 1 ]; then
    SOURCE_DIR=$1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    log "Ошибка: Папка $SOURCE_DIR не существует"
    exit 1
fi

# Создаем имя файла с датой
backup_date=$(date '+%Y%m%d_%H%M%S')
backup_file="$BACKUP_DIR/backup_$backup_date.tar.gz"

log "Начало резервного копирования папки: $SOURCE_DIR"

# Создаем архив
if tar -czf "$backup_file" -C "$SOURCE_DIR" . 2>/dev/null; then
    # Считаем файлы
    file_count=$(find "$SOURCE_DIR" -type f | wc -l)
    backup_size=$(du -h "$backup_file" | cut -f1)
    
    log "Резервная копия создана успешно"
    log "Файл: $backup_file"
    log "Размер: $backup_size"
    log "Количество файлов: $file_count"
    
    echo ""
    echo "✅ Резервная копия создана:"
    echo "   Файл: $(basename "$backup_file")"
    echo "   Размер: $backup_size"
    echo "   Файлов: $file_count"
    echo "   Лог: $LOG_FILE"
else
    log "Ошибка: Не удалось создать резервную копию"
    exit 1
fi
