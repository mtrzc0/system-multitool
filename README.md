## Cel projektu
Celem projektu jest stworzenie skryptu w języku Bash, który umożliwi efektywne zarządzanie zasobami systemowymi oraz komunikację z podłączonym urządzeniem USB. Projekt integruje funkcjonalności związane z zarządzaniem procesami, monitorowaniem pamięci oraz filtrowaniem danych.

Projekt ten stanowi narzędzie pomocnicze dla studentów w ramach nauki na przedmiot Systemy Operacyjne.

## Zakres projektu
1. **Identyfikacja, monitorowanie i zarządzanie procesami oraz wątkami.**
2. **Monitorowanie i zarządzanie pamięcią główną, pomocniczą i wirtualną.**
3. **Komunikacja z urządzeniem USB, obsługującym określone polecenia.**
4. **Filtrowanie danych z plików tekstowych według podanych kryteriów.**

## Funkcjonalności

### 1. Procesy, wątki

a) Liczba procesów i wątków w systemie,
b) Dla największego procesu w systemie:
Nazwę, PID, rozmiar, klasę planowania, priorytet planowania
Liczbę procesów potomnych, liczbę otwartych plików
c) Dla procesu o największej liczbie wątków:
Nazwę, PID, klasę planowania, priorytet planowania
d) Dla procesu o podanej nazwie przez użytkownika:
PID, rozmiar pamięci wirtulnej (VmSize), rozmiar pamieci fizycznej (VmRSSS)
Liczbę wątków, liczbę otwartych plików
Liczba dobrowolnych przełączeń kontekstu (voluntary_ctxt_switches)
Liczba przymusowych przełączeń kontekstu (nonvoluntary_ctxt_switches)

### 2. Pamięci

### 3. Urządzenia

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
   cd system-multitool
   ```
3. Nadaj uprawnienia do wykonania skryptu:
   ```bash
   chmod +x tool.sh
   ```
4. Uruchom skrypt:
   ```bash
   ./tool.sh
   ```
