## Cel projektu
Celem projektu jest stworzenie skryptu w języku Bash, który umożliwi efektywne zarządzanie zasobami systemowymi oraz komunikację z podłączonym urządzeniem USB. Projekt integruje funkcjonalności związane z zarządzaniem procesami, monitorowaniem pamięci oraz filtrowaniem danych.

Projekt ten stanowi narzędzie pomocnicze dla studentów w ramach nauki na przedmiot Systemy Operacyjne

## Zakres projektu
1. **Identyfikacja, monitorowanie i zarządzanie procesami oraz wątkami.**
2. **Monitorowanie i zarządzanie pamięcią główną, pomocniczą i wirtualną.**
3. **Komunikacja z urządzeniem USB, obsługującym określone polecenia.**
4. **Filtrowanie danych z plików tekstowych według podanych kryteriów.**

## Funkcjonalności

### 1. Procesy i wątki
- **Procesy:**
  - Wyświetlanie liczby procesów w systemie.
  - Wyświetlanie nazwy i rozmiaru największego procesu.
- **Wątki:**
  - Wyświetlanie liczby wątków w systemie.
  - Wyświetlanie nazwy i rozmiaru procesu o największej liczbie wątków oraz liczby wątków.

### 2. Pamięci

### 3. Urządzenia wejścia-wyjścia (I/O)

### 4. Filtrowanie plików

## Wymagania systemowe
- System operacyjny Linux (np. Ubuntu, Debian).
- Bash w wersji 4.0 lub wyższej.
- Uprawnienia administratora (sudo) do wykonywania niektórych poleceń.
- Narzędzia systemowe: `grep`, `awk`, `sed`, `ps`, `free`, `lsusb`.

## Instalacja i uruchomienie
1. Sklonuj repozytorium:
   ```bash
   git clone <URL_REPO>
   ```
2. Przejdź do katalogu projektu:
   ```bash
   cd bash_script_project
   ```
3. Nadaj uprawnienia do wykonania skryptu:
   ```bash
   chmod +x script.sh
   ```
4. Uruchom skrypt:
   ```bash
   ./script.sh
   ```
