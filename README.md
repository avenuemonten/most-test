👨‍💻 26.06.2025 Сел за ПК

🧟‍♂️ 22:44 Из-за невнимательности скачал Ubuntu 24.02, тем самым Zabbix не работает правильно (вовсе не работает)  

Официальный спидран по тестовому заданию начинается😆

✅ 23:00 Были установлены правильные версии Ubuntu на VMWARE 
![Скриншот](https://github.com/avenuemonten/most-test/blob/main/img/reinstall%20ubuntu.png)

✅Сразу же после установки, зашёл на ВМ most2 и дал разрешение пользователю "devops2" выполнять sudo без пароля (чтобы команда ssh больше не запрашивало пароль)
![Скриншот2](https://github.com/avenuemonten/most-test/blob/main/img/visudo%20fix.png)

✅На ВМ most1 был создан проект most-ci-project со скриптом build.sh / deploy.sh (Через Powershell, т.к VMWARE не поддерживает кириллицу пришлось зайти через винду для "красоты") 
![Скриншот3](https://github.com/avenuemonten/most-test/blob/main/img/build.sh.png)
![Скриншот4](https://github.com/avenuemonten/most-test/blob/main/img/deploy.sh.png)

✅После этого добавил права на выполнение bash скрипта командой : chmod +x

✅ 23:20 Успешно проверен
![Скриншот5](https://github.com/avenuemonten/most-test/blob/main/img/aprove%20test.png)
