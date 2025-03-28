# countdown_timer

Prerequistes: ffmpeg

## Basic usage to create 30s countdown
Units of input can only be `s` or `m`,
```
chmod +x create_countdown_timer.sh
./create_countdown_video.sh 30s
./create_countdown_video.sh 10m 
``` 

Alternatively,
```
bash <(curl -s https://raw.githubusercontent.com/jj-tay/countdown_timer/refs/heads/main/create_countdown_video.sh) 15m
```
