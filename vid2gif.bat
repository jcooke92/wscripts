@echo off
if "%~1"=="" (
    echo Usage: vid2gif input.mp4 scale
    exit /b
)
set input=%1
set scale=%2

ffmpeg -i "%input%" -vf "fps=30,scale=%scale%:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 1 "%input%.gif"
