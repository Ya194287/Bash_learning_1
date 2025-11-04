#!/bin/bash

echo "Мониторинг системы"


# Сбор данных о системе

# 1. Загрузка CPU
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "Загрузка CPU: ${cpu_usage}%"

# 2. Использование памяти
memory_info=$(free -m | grep Mem:)
total_memory=$(echo $memory_info | awk '{print $2}')
used_memory=$(echo $memory_info | awk '{print $3}')
memory_usage=$((used_memory * 100 / total_memory))

echo "Использование памяти: ${memory_usage}% (${used_memory}M / ${total_memory}M)"

# 3. Дисковое пространство
disk_usage=$(df / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')

echo "Использование диска: ${disk_usage}% (${disk_used} / ${disk_total})"
echo ""

# Проверка использования памяти
if [ "$memory_usage" -gt 80 ]; then
    echo "НИМАНИЕ: Использование памяти превышает 80%!"
    echo ""
    echo "Топ-5 процессов по использованию памяти:"
    echo "---------------------------------------"
    ps aux --sort=-%mem | head -6 | awk '{print $2, $4, $11}'
    echo ""
    
    echo "Топ-5 процессов по использованию CPU:"
    echo "------------------------------------"
    ps aux --sort=-%cpu | head -6 | awk '{print $2, $3, $11}'
else
    echo "Использование памяти в норме"
fi

echo ""
echo "Мониторинг завершен в: $(date '+%Y-%m-%d %H:%M:%S')"
