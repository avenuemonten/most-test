👨‍💻 26.06.2025 Сел за ПК

🧟‍♂️ 22:44 Из-за невнимательности скачал Ubuntu 24.02, тем самым Zabbix не работает правильно (вовсе не работает)  

Официальный спидран по тестовому заданию начинается😆

✅ 23:00 Были установлены правильные версии Ubuntu на VMWARE 
![Скриншот](https://github.com/avenuemonten/most-test/blob/main/img/reinstall%20ubuntu.png)

✅Сразу же после установки, зашёл на ВМ most2 и дал разрешение пользователю "devops2" выполнять sudo без пароля (чтобы команда ssh больше не запрашивало пароль)
![Скриншот2](https://github.com/avenuemonten/most-test/blob/main/img/visudo%20fix.png)

⚙️На ВМ most1 был создан проект most-ci-project со скриптом build.sh / deploy.sh (Через Powershell, т.к VMWARE не поддерживает кириллицу пришлось зайти через винду для "красоты") 
![Скриншот3](https://github.com/avenuemonten/most-test/blob/main/img/build.sh.png)
![Скриншот4](https://github.com/avenuemonten/most-test/blob/main/img/deploy.sh.png)

✅После этого добавил права на выполнение bash скрипта командой : chmod +x

✅ 23:20 Успешно проверен
![Скриншот5](https://github.com/avenuemonten/most-test/blob/main/img/aprove%20test.png)


⚙️Был сделан скрипт автоматизаций рутин по созданию и установки репозиториев, пакетов, баз данных, настройки конфигураций
![Скриншот7](https://github.com/avenuemonten/most-test/blob/main/img/allin.png)


✅Запуск скрипта всё в одном

✅После завершения скрипта проверил статус zabbix-serrver
![Скриншот8](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_status.png)

✅Так же проверил БД
![Скриншот9](https://github.com/avenuemonten/most-test/blob/main/img/pg_hba_conf.png)
![Скриншот10](https://github.com/avenuemonten/most-test/blob/main/img/postgres-psql.png)

‼️ВНИМАНИЕ! ВОЗМОЖНО СКИПНУЛ КАКОЕ-ТО ДЕЙСТВИЕ, НО ТОЧНО БЫЛА ОШИБКА ПРИ ИМПОРТА БАЗ В ZABBIX ВЕБ-МОРДЫ! 

✅После удачной установки зашёл в веб-морду zabbix
![Скриншот11](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_web_face.png)

✅Так же заполнил конфигурацию DB выбрал PostgreSQL (т.к в скрипте я выбрал postgresql а не mysql)
![Скриншот12](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_db_connect.png)

✅Дал имя серверу и выбрал якутское время
![Скриншот13](https://github.com/avenuemonten/most-test/blob/main/img/settings_zabbix.png)

✅Zabbix успешно настроен
![Скриншот14](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_final.png)

✅Основная страница Zabbix, ждал когда запустится/подгрузятся мониторинги сервера
![Скриншот15](https://github.com/avenuemonten/most-test/blob/main/img/web_zabbix_main.png)

✅Успешно загрузился мониторинг, остался добавить Zabbix-agent в моём случае это второй ВМ под именем most2
![Скриншот16](https://github.com/avenuemonten/most-test/blob/main/img/monitoring%20zabbix%20server.png)
![Скриншот17](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_server.png)
![Скриншот18](https://github.com/avenuemonten/most-test/blob/main/img/zabbix_server2.png)

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

✅Зашёл по пути `sudo nano /etc/zabbix/zabbix_agentd.conf` расскоментировал hostname поменял на hostname=most2

✅Перезагрузил zabbix-agent командой `sudo systemctl restart zabbix-agent`

✅Перешёл Monitoring -> Hosts добавил агента для мониторинга а так же готовый шаблон
![Скриншот19](https://github.com/avenuemonten/most-test/blob/main/img/add_most2.png)
![Скриншот20](https://github.com/avenuemonten/most-test/blob/main/img/add_most22.png)


‼️1:54 Закончил описать свои шаги, сейчас занят Telegram Notification Plugin. Как основного бота буду использовать botfather. А так же попробую сделать полный docker контейнер для полной автоматизации
