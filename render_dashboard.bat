@echo off
echo ==========================================================
echo    Kompilacja Quarto Dashboard Reguly Taylora CEE
echo ==========================================================
cd /d "%~dp0"
echo [1/2] Pobieranie danych z API Eurostatu i BIS oraz aktualizacja BigQuery...
python ..\update_cee_taylor_bigquery.py
if %ERRORLEVEL% NEQ 0 (
    echo [OSTRZEZENIE] Aktualizacja z API napotkala problem. Uzywam istniejacych danych lokalnych.
)

echo.
echo [2/2] Renderowanie Quarto Dashboard index.qmd...
quarto render index.qmd
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==========================================================
    echo    SUKCES: Dashboard zostal wygenerowany pomyslnie!
    echo    Otworz plik: index.html
    echo ==========================================================
) else (
    echo.
    echo [BLAD] Wystapil blad podczas renderowania dashboardu Quarto.
)
pause
