#!/bin/bash

echo "Добавление ссылок на удалённые репозитории Astra Linux."

list_rep='# Astra Linux repository description https://wiki.astralinux.ru/x/0oLiC \n
\n
#deb cdrom:[OS Astra Linux 1.7.5 1.7_x86-64 DVD ]/ 1.7_x86-64 contrib main non-free \n
\n
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-main/ 1.7_x86-64 main contrib non-free \n
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-update/ 1.7_x86-64 main contrib non-free \n
\n
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-base/ 1.7_x86-64 main contrib non-free \n
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/ 1.7_x86-64 main contrib non-free \n
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-update/ 1.7_x86-64 main contrib non-free \n';

echo -e $list_rep > /etc/apt/source.list;

echo "Ссылки успешно добавлены!"

echo "Установка и настройка программ."

apt-get install fly-admin-samba;

apt-get update -y;
apt-get dist-upgrade -y;
apt-get autoremove -y;

echo "Все дополнительные программы установлены и обновлены!"

#Создание нового пользователя
valid_user_add= 'y'; #Переменная содержит ответ пользователя

echo "Добавить нового пользователя (без прав администратора)? (y/n)";
read $valid_user_add;

if [ $valid_user_add = "y" ]
then

    #Указание имени
    user_name= ""; #Переменная содержит имя пользователя

    echo "Укажите имя пользователя:";
    read $user_name;

    if [ user_name = "" ]
    then
        $user_name= "user";
    fi

    #Указание пароля
    user_passwd= ""; #Переменная содержит пароль пользователя

    echo "Укажите пароль пользователя:"
    read $user_passwd;

    if [ user_passwd = "" ]
    then
        $user_passwd= "1234";
    fi

    #Указание польного имени пользователя

    user_real_name= "";

    read $user_real_name;

    if [ user_real_name = "" ]
    then
        finger $user_name;
    else
        finger $user_real_name;

else
    echo "Не добавляем пользователя"
fi
