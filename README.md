# rtsp_monitor

## Installer
https://github.com/atakhq/mediamtx-installer

## Soft
https://github.com/bluenviron/mediamtx

## mediamtx.yml
paths:
  stream4:
    source: rtsp://username:password@192.168.1.4:554/stream2
  stream5:
    source: rtsp://username:password@192.168.1.5:554/stream2
  stream6:
    source: rtsp://username:password@192.168.1.6:554/stream2

## index.html
<iframe src="http://<ip>:8889/stream4/" scrolling="no"></iframe>
<iframe src="http://<ip>:8889/stream5/" scrolling="no"></iframe>
<iframe src="http://<ip>:8889/stream6/" scrolling="no"></iframe>
