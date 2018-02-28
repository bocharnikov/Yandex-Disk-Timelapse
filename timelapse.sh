#!/bin/bash

DIR=/mnt16/yandex.disk/timelapse
PICNAME=$(date +\%Y.\%m.\%d\-\%H:\%M:\%S).jpg

fswebcam -c /etc/timelapse.conf --save $DIR/$PICNAME
#echo "Фотография за $(date +\%Y.\%m.\%d-\%H:\%M:\%S)" | mail -s "WebCam TimeLapse" you@email.com -A /mnt16/yandex.disk/timelapse/$PICNAME



