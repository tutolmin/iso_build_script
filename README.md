# Bash Installer Framework

Используется замечательный фреймворк для автоматизации сборки ISO образа.

## Запуск сборки

Необходимо запустить `./install.sh -r` или с ключем `-h` для получения справки.

## Задачи

Все задачи собраны в папке `tasks` и организованы таким образом, чтобы имя файла имело числовую приставку. Таким образом обеспечивается очередность выполненения задач. Для примера созданы несколько задач для проверки версии операционной системы, доступности интернет соединения, а также доступного дискового пространства, необходимого для сборки образа.

## Утилиты

Необходимые для работы утилиты расположены в папке `utils`

### Логирование

Логирование процесса сборки производится в файл `install.sh.<date>.log`. Возможно логированые различных уровней  `WARNING`, `INFO`, `IMPORTANT`, `ERROR`, `START`, `FINISH`. Вывод также отображается на консоли.

