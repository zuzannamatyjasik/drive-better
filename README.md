# DriveBetter

##### *Spis treści:*
* *Charakterystyka i cel projektu*
* *Prawa autorskie*
* *Specyfikacja wymagań*
  * *Funkcjonalność*
  * *Wymagania niefunkcjonalne*
* *Architektura systemu oprogramowania*
  * *Architektura rozwoju*
  * *Architektura uruchomieniowa*
* *Testy*
  * *Scenariusze testów*
  * *Sprawozdanie z wykonania scenariuszy testów*

## Charakterystyka projektu
Drive Better (DB) to aplikacja mająca na celu niwelowanie liczby oszustw finansowych popełnianych przez taksówkarzy. Założeniem było zwiększenie komfortu oraz bezpieczeństwa pasażerów - z tego powodu został dodatkowo umieszczony przycisk SOS. Dokładny zakres funkcjonalności aplikacji został umieszczony poniżej.

## Prawa autorskie.
Aplikacja została stworzona przez studentki Uniwersytetu Gdańskiego z kierunku informatyka i ekonometria ze specjalnością aplikacje informatyczne w biznesie. Autorkami są Zuzanna Matyjasik, Patrycja Biedrzycka i Marika Idczak. Licencja do oprogramowania jest w pełni otwarta - MIT.

## Specyfikacja wymagań.
##### Funkcjonalność.
*Zakres działania aplikacji został dokładnie opisany w osobnym pliku "funkcjonalność".*
Po uruchomieniu aplikacji użytkownik wybiera swoją lokalizację oraz miejsce docelowe. Następnie musi wprowadzić opłatę za kilometr (informację tę może znaleźć umieszczoną na taksówce lub spytać się kierowcy). Aplikacja wyznacza najkrótszą trasę oraz oblicza, jaka będzie cena przejazdu - kierowcy często w ogóle nie włączają taksometru i podają własną, zawyżoną cenę. W przypadku, kiedy kierowca zacznie zachowywać się w sposób agresywny lub inny, niepokojący nas sposób pasażer będzie mógł nacisnąć przycisk SOS i powiadomić zaufaną osobę o zaistniałej sytuacji.
[Funkcjonalność](https://github.com/zuzannamatyjasik/drive-better/blob/master/funkcjonalnosc)

##### Wymagania niefunkcjonalne.

### Architektura systemu oprogramowania.
##### Architektura rozwoju.
Aplikacja została napisana w środowisku Android Studio v. 3.5.5. Dodatkowo zostało zainstalowane repozytorium Fluttera v 44.0.1, wspierające język Dart. Dodatkowo wykorzystane zostało API Google Maps w celu wyświetlenia mapy, pobrania aktualnej pozycji oraz wybrania punktu końcowego trasy. Do wskazania na mapie najkrótszej drogi do celu użyto API [Openrout Service](https://openrouteservice.org). Pakiet SqlLight został użyty do przechowywania alarmowego numeru telefonu. Projekt najlepiej uruchomić w emulatorze z Androidem 8.0 Oreo.
##### Architektura uruchomieniowa.
W celu uruchomienia projektu najlepiej skożystac ze środowiska z emulatorem wspierającego system Android, przykładowo Android Studio.

### Testy.
##### Scenariusze testów.
##### Sprawozdanie z wykonania scenariuszy testów.
