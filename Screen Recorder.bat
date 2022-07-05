@echo off
:scr
mkdir "%UserProfile%/videos/Records"
cd %UserProfile%/videos/Records
cls
echo [7m                                                   Screen Recorder                                         [0m
echo [32mPlease change your audio device to[0m [31mCABLE Input (VB-Audio Virtual Cable)[0m
echo [32mEnter [31mq[0m [32mon your keyboard to stop record[0m
set /p recn=Enter name for recording file :
echo #Quality of video
echo 1 2 3 4 ..................................................... 51
echo 51 being the worst to 0 being the best — lossless
echo 16 - 480
echo 18 - 720p
echo 20-21- 1080p
set /p recq=Enter a number for crf which relevent to your quality :
echo To start
pause.
ffmpeg -hide_banner -t duration -rtbufsize 1500M -f dshow -i audio="CABLE Output (VB-Audio Virtual Cable)" -f -y -rtbufsize 100M -f gdigrab  -framerate 30 -probesize 10M -draw_mouse 1 -i desktop -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf %recq% -pix_fmt yuv420p "%recn%.mp4"
msg * Your recording process is end. Go to Videos/Records.
echo Your file is in your video's recorded file
echo record a new one   - 1
echo To exit            - 2
set /p ch="Choice:"
if /I "[%ch%]"=="[1]" goto :scr
echo.
if /I "[%ch%]"=="[2]" goto :EOF
set /p recx=Enter your choice :
cls
%recx%

