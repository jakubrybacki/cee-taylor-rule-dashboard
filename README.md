# CEE Taylor Rule Quarto Dashboard

Interaktywny front-end dashboardu badawczego dla reguły Taylora w państwach Europy Środkowo-Wschodniej (Polska, Czechy, Węgry, Rumunia), zbudowany w oparciu o silnik **Quarto Dashboard**, biblioteki **Plotly** i **DT (DataTables)** oraz wytyczne ze standardu `dashboard-standards`.

---

## 1. Zawartość Dashboardu

1. **🎯 Taylor Rule Monitor & Projections (`#taylor-rule`)**:
   - **Tabela podsumowująca (Row 1, 100% szerokości)**: Zestawienie bieżących stóp referencyjnych dla 4 państw (Polska, Czechy, Węgry, Rumunia) wraz z celami reguły Taylora z 1993 r., reguły z wygładzaniem oraz projekcją 4-kwartalną forward (+4Q), z interaktywnymi plakietkami oceny restrykcyjności polityki (*Policy Stance*).
   - **Symulator parametrów i stopy naturalnej $r^*$**: Suwaki reakcji na inflację ($\phi_\pi$), lukę popytową ($\phi_x$), wygładzania ($\rho$) oraz stopy naturalnej ($r^*$) przeliczające w czasie rzeczywistym wiersze tabeli z presetami reguł krajowych.
   - Bezserwerowy przycisk eksportu CSV pod tabelą.

2. **📈 Historical Rates (2010–2026) (`#historical-rates`)**:
   - **Selektor państw**: Synchroniczny pasek wyboru kraju w jednym rzędzie (Polska, Czechy, Węgry, Rumunia).
   - **Wykres 1**: Porównanie oficjalnych stóp banków centralnych (czarna linia `#111111`) z realną stopą ex-post ($r_t = i_t - \pi_t$), poziomem docelowym reguły Taylora ($i_t^*$) oraz wygładzoną stopą implikowaną ($i_t$).
   - **Wykres 2 (Combo)**: Dekompozycja luki dla standardowej reguły Taylora (1993) – skumulowane kolumny wkładów inflacji $1.5(\pi_t - \pi^*)$ i luki PKB $0.5 x_t$ wraz z linią luki polityki $\text{Gap}_t = i_t - i_t^{*, \text{Taylor}}$.
   - **Wykres 3 (Combo)**: Dekompozycja luki dla bayesowskich parametrów krajowych (Unsmoothed Target) – skumulowane kolumny wkładów $\phi_{\pi, c}(\pi_t - \pi^*)$ i $\phi_{x, c} x_t$ z linią $\text{Gap}_t^* = i_t - i_t^*$.
   - Przyciski pobierania CSV wyrównane do prawej krawędzi kart.

---

## 2. Standardy Inżynieryjne (`dashboard-standards`)

- **Paleta barw Looker Studio**: `#111111` (linia główna), `#d6498b` (róż/cel), `#41b6c4` (turkus/wygładzenie), `#fe9929` (pomarańcz/luka), `#fec44f` (bursztyn/tabela).
- **Zasada pionowego stosu 2 elementów**: Wszystkie widoki ułożone w pełnej szerokości wierszach (`## Row {width=100%}`), zapobiegając ściśnięciu w układzie 50%/50%.
- **Mobilny Continuous Scroll Feed (390px)**: Na smartfonach ($\le 768$px) wszystkie panele wyświetlają się w jednym pionowym strumieniu z plakietkami sekcji (`::before`), a menu nawigacyjne realizuje płynne skoki kotwicowe ze zwijaniem paska.
- **Desktop Tab Isolation**: Widoki pulpitowe są precyzyjnie izolowane selektorem `.active`.
- **Budżet rozmiaru**: Plik `index.html` ma zaledwie ~0.34 MB, ładuje się natychmiastowo.

---

## 3. Uruchamianie i Ponowna Kompilacja

- Aby obejrzeć dashboard: otwórz plik [index.html](file:///g:/Mój%20dysk/Papers/Mateusz/Artykuły%20-%20zaakceptowane/Article%20-%20PTE%20-%20Bank%20i%20Kredyt/Dashboard/quarto_dashboard/index.html) w dowolnej przeglądarce internetowej.
- Aby zaktualizować/przekompilować dashboard po zmianie danych:
  - Uruchom dwuklikiem plik `render_dashboard.bat`, LUB
  - Wpisz w terminalu w tym folderze: `quarto render index.qmd`.
