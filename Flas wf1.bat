@echo off
setlocal
title ESP32-S2 Flash Tool

:: Header tampilan
echo =================================================
echo        ESP32-S2 FLASHING TOOL (By Jaka Isna)
echo =================================================
echo.

:: Meminta input COM Port dari user
set /p comport="Masukkan nomor COM Port (contoh: 11): "

:: Memastikan input tidak kosong
if "%comport%"=="" (
    echo [ERROR] COM Port tidak boleh kosong!
    pause
    exit
)

echo.
echo Menghubungkan ke COM%comport%...
echo Pastikan ESP32-S2 sudah dalam mode BOOT/DOWNLOAD.
echo.

:: Menjalankan perintah esptool
:: Menggunakan write-flash (versi terbaru) dan parameter stabil
esptool --chip esp32s2 --port COM%comport% --baud 115200 --no-stub write-flash -fm dio -fs 4MB 0x0 wf1.bin

:: Mengecek status keberhasilan
if %ERRORLEVEL% EQU 0 (
    echo.
    echo =================================================
    echo [SUCCESS] Flashing selesai dengan sukses! Alhamdulilah
    echo =================================================
) else (
    echo.
    echo =================================================
    echo [FAILED] Terjadi kesalahan saat flashing.
    echo Periksa kabel, COM Port, atau mode BOOT perangkat.
    echo =================================================
)

pause