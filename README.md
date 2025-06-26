# 📁Тестовое задание: Virtual Machines, (CI)CD and Monitoring.

Порядок запуска скриптов автоматизаций root:
```
chmod +x build.sh
chmod +x deploy.sh
./build.sh && ./deploy.sh
chmod +x install_conf.sh
./install_conf.sh
```

- [x] Создать две виртуальные машины с Ubuntu Server 22.04 LTS 🖥️
- [x] Настройка CI/CD конвейер между VM 📩
- [x] Установить на одной из VM Zabbix Server 📟
- [x] Мониторинг 📈
- [x] Прикрепление bash скриптов 📎
- [x] Telegram нотификация 📨
- [ ] Docker (в процессе) 💾

> [!NOTE]
> Какой-то шаг скипнул из-за того что не сохранил скриншоты и был сфокусирован на выполнение задач.

# 📑Информация виртуальный машин
| Виртуальная машина | IP | Логин  |  Пароль  | 
| -------------------| -- | ------ | -------- |
| MOST1 | 192.168.68.132  | devops1 | P@ssw0rd |
| MOST2 | 192.168.68.133  | devops2 | P@ssw0rd |


Официальный спидран по тестовому заданию начинается😆

1) 23:00 Были установлены правильные версии Ubuntu

<img src="https://github.com/avenuemonten/most-test/blob/main/img/reinstall%20ubuntu.png" width="200" height="150">

2) Сразу же после установки, зашёл на ВМ most2 и дал разрешение пользователю "devops2" выполнять sudo без пароля (чтобы команда ssh больше не запрашивало пароль)

<img src="https://github.com/avenuemonten/most-test/blob/main/img/visudo%20fix.png" width="200" height="150">

3) На ВМ most1 был создан проект most-ci-project со скриптом build.sh / deploy.sh (Через Powershell, т.к VMWARE не поддерживает кириллицу пришлось зайти через винду для "красоты") 

<img src="https://github.com/avenuemonten/most-test/blob/main/img/build.sh.png" width="200" height="150">

<img src="https://github.com/avenuemonten/most-test/blob/main/img/deploy.sh.png" width="200" height="150">

4) После этого добавил права на выполнение bash скрипта командой : chmod +x

5) 23:20 Успешно проверен

<img src="https://github.com/avenuemonten/most-test/blob/main/img/aprove%20test.png" width="200" height="150">


6) Был сделан скрипт автоматизаций рутин по созданию и установки репозиториев, пакетов, баз данных, настройки конфигураций

<img src="https://github.com/avenuemonten/most-test/blob/main/img/allin.png" width="200" height="150">

7) Запуск скрипта всё в одном

8) После завершения скрипта проверил статус zabbix-serrver

<img src="https://github.com/avenuemonten/most-test/blob/main/img/zabbix_status.png" width="200" height="150">

10) Так же проверил БД

<img src="https://github.com/avenuemonten/most-test/blob/main/img/pg_hba_conf.png" width="200" height="150">

<img src="https://github.com/avenuemonten/most-test/blob/main/img/postgres-psql.png" width="200" height="150">

> [!WARNING]
> ВОЗМОЖНО СКИПНУЛ КАКОЕ-ТО ДЕЙСТВИЕ, НО ТОЧНО БЫЛА ОШИБКА ПРИ ИМПОРТЕ БД ZABBIX ВЕБ-МОРДЫ!

UPD:
> [!WARNING]
> ERROR: relation "role" already exists
> ERROR: duplicate key value violates unique constraint ... Решил данную проблему созданием чистого БД. 

# 🛠Настройка веб-морды zabbix а так же мониторинг и добавление zabbix-agent
1) После удачной установки зашёл в веб-морду zabbix

![Скриншот11](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_web_face.png)

2) Так же заполнил конфигурацию DB выбрал PostgreSQL (т.к в скрипте я выбрал postgresql а не mysql)

![Скриншот12](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_db_connect.png)

3) Дал имя серверу и выбрал якутское время

![Скриншот13](https://github.com/avenuemonten/most-test/blob/main/img/settings_zabbix.png)

4) Zabbix успешно настроен

![Скриншот14](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_final.png)

5) Основная страница Zabbix, ждал когда запустится/подгрузятся мониторинги сервера

![Скриншот15](https://github.com/avenuemonten/most-test/blob/main/img/web_zabbix_main.png)

6) Успешно загрузился мониторинг, остался добавить Zabbix-agent в моём случае это второй ВМ под именем most2

![Скриншот16](https://github.com/avenuemonten/most-test/blob/main/img/monitoring%20zabbix%20server.png)

![Скриншот17](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_server.png)

![Скриншот18](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_server2.png)

# 📑Чек-лист
| Задача                                                     | Статус |
| ---------------------------------------------------------- | ------ |
| Установлен PostgreSQL и создан пользователь `zabbix`       | ✅      |
| Установлен и запущен Zabbix Server                         | ✅      |
| Установлен и запущен Zabbix Agent                          | ✅      |
| Импортирована база данных `server.sql.gz`                  | ✅      |
| Установлен и настроен Zabbix frontend                      | ✅      |
| Успешно завершён финальная настройка веб-морды        | ✅      |
| Хост `Zabbix server` отображается в интерфейсе             | ✅      |
| Шаблон мониторинга работает `Linux by Zabbix agent`        | ✅      |
| В интерфейсе доступны графики и метрики (диск, CPU и т.д.) | ✅      |

7) Зашёл по пути `sudo nano /etc/zabbix/zabbix_agentd.conf` расскоментировал hostname поменял на hostname=most2

8) Перезагрузил zabbix-agent командой `sudo systemctl restart zabbix-agent`

9) Перешёл Monitoring -> Hosts добавил агента для мониторинга а так же готовый шаблон

![Скриншот19](https://github.com/avenuemonten/most-test/blob/main/img/add_most2.png)

![Скриншот20](https://github.com/avenuemonten/most-test/blob/main/img/add_most22.png)


> [!IMPORTANT]
> 1:54 Закончил описать свои шаги, сейчас занят Telegram Notification Plugin. Как основного бота буду использовать botfather. А так же docker контейнер для полной автоматизации

# Telegram Notification

1) Основной бот был взят у @botfather, получил токен. А так же добавил его в группу и перешел по api и добавил на финальном скрипте deploy.sh
![Скриншот21](https://github.com/avenuemonten/most-test/blob/main/img/telegram_notification1.png)
![Скриншот22](https://github.com/avenuemonten/most-test/blob/main/img/telegram_notification2.png)


