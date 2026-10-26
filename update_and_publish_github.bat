@echo off
chcp 65001 > nul
echo ==========================================================
echo  Kompleksowa Aktualizacja Dashboardu Reguly Taylora CEE
echo  (Pobranie danych -^> Quarto render -^> Publikacja GitHub)
echo ==========================================================
cd /d "%~dp0"

echo.
echo [1/3] Pobieranie danych z API BIS/Eurostat i aktualizacja BigQuery...
python ..\update_cee_taylor_bigquery.py
if errorlevel 1 (
    echo [OSTRZEZENIE] Wystapil problem z API. Uzywam istniejacych danych lokalnych.
)

echo.
echo [2/3] Renderowanie Quarto Dashboard index.qmd...
quarto render index.qmd
if errorlevel 1 (
    echo [BLAD] Wystapil blad podczas renderowania dashboardu Quarto!
    pause
    exit /b 1
)

echo.
echo [3/3] Publikacja zmian na GitHub (git commit i push)...
git add index.html index.qmd
git diff --cached --quiet
if not errorlevel 1 (
    echo [INFO] Brak nowych zmian w index.html do wyslania na GitHub.
) else (
    git commit -m "Update dashboard data: %date% %time%"
    git push origin main
    if not errorlevel 1 (
        echo.
        echo ==========================================================
        echo  SUKCES: Zmiany zostaly pomyslnie wyslane na GitHub!
        echo  Strona zaktualizuje sie automatycznie pod adresem:
        echo  https://jakubrybacki.github.io/cee-taylor-rule-dashboard/
        echo ==========================================================
    ) else (
        echo [BLAD] Nie udalo sie wypchnac zmian do zdalnego repozytorium GitHub.
    )
)

echo.
pause
