Первое действие скрипта: прохождение по файлам вида ispmgr.username для получения из них имени пользователя и адреса его электронной почты.
Эти данные присваиваются переменным 
USERNAME и USERMAIL.
Далее проверяется есть ли в каталоге пользователя папка карантин и создается при необходимости.
Это обязательно необходимо делать до запуска антивирусника, т.к. если папки по указанному пути не будет, то антивирус отчитается, что вредоносных файлов нет, даже, если они будут.
Cледующим шагом запускается антивирус maldet.
Ключ -co( current options) переопределяет конфигурационные файлы 
(/usr/local/maldetect/conf.maldet - параметр адреса электронной почты и /usr/local/maldetect/internals.conf - папку карантина).
Ключ -a приводит к сканированию всех папок пользователя.
После первого запуска скрипта на сервере его следует сменить на ключ -r,
чтобы сканировались только те файлы, которые были изменены за последние 7 дней (кол-во дней можно изменить).
По окончании сканирования на каталог quarantine рекурсивно изменяются права доступа и владелец, т.к. по умолчанию maldet, запустившись от root и владельцем папки/файлов сделает себя, при этом на файл права будут "000".


The first action of the script: the passage of the type ispmgr.username file for one user name and their email address.
These data are assigned to variables
USERNAME and USERMAIL.
Next is checked whether there is in the user directory and creates a quarantine folder if necessary.
It certainly needs to be done before starting the virus scan, because If a folder in the specified path is not, then the antivirus will report that no malicious files, even if they are.
Next step is run antivirus maldet.
Key -co (current options) overrides the configuration files
(/usr/local/maldetect/conf.maldet - setting email address and /usr/local/maldetect/internals.conf - quarantine folder).
The -a option leads to scan all directorys.
After the first run the script on the server should be changed to key -r,
To scan only those files that have changed in the last 7 days (number of days can be changed).
After scanning the directory quarantine recursively change permissions and owner, as default maldet, run by root and the owner of the folder / files to make themselves, and the rights to the file will be "000".