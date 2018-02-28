# Yandex.Disk + Timelapse
Подключение Яндекс Диска для слива фоточек с вебкамеры.


## Установка davfs2 и подключение Яндекс Диска.
1) `apt-get install davfs2` - Ставим самый главный и основной пакет. Eсли что либо спросит, то указываем **"no"**.

2) `usermod -a -G davfs2 pi` - Добавляем права пользователю **pi**.

3) `mkdir /mnt16/yandex.disk/timelapse` - Создаем директорию диска.

4) `echo "https://webdav.yandex.ru:443 robots password" >> /etc/davfs2/secrets` - Запишем логин и пароль в файл /etc/davfs2/secrets, где **robots** – имя почтового ящика, а **password** - пароль для него.

5) `sudo chmod 600 /etc/davfs2/secrets` - Даём права.

6) `mount -t davfs https://webdav.yandex.ru:443 /mnt16/yandex.disk/` - Пробуем смонтировать наш **"Яндекс Диск"**.

## Настройка вебки.

1) ``apt-get install fswebcam`` - Ставим софтину для вебки.
2) ``touch /etc/timelapse.conf`` - Создаём её конфигурационный файл.

**timelapse.conf**

    device "/dev/video0"
    resolution 1600x1200
    skip 50
    frames 3
    set brightness=60%
    set contrast=13%
    #no-banner

## CRONTAB ###

    ### WebCam Timelapse every minute
    */1 * * * * /root/timelapse.sh > /dev/null 2>/dev/null
    
    ### Yandex Disk Delete Photo every day at 00:00
    0 0 * * * /root/YaDiskDel.sh > /dev/null 2>/dev/null

## Скриншоты ###

![ya-disk-del](https://user-images.githubusercontent.com/35877180/36772146-1de33acc-1c65-11e8-9bac-65aeca12271f.PNG)
