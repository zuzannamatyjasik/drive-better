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
Drive Better (DB) to aplikacja mająca na celu niwelowanie liczby oszustw finansowych popełnianych przez taksówkarzy. Po wprowadzeniu odpowiednich danych, zostaje wyznaczona najkrótsza trasa dojazdu oraz pokazana rzeczywista cena przejazdu.  Założeniem było zwiększenie komfortu oraz bezpieczeństwa pasażerów - z tego powodu został dodatkowo umieszczony przycisk SOS. Dokładny zakres funkcjonalności aplikacji został umieszczony poniżej. Został tutaj zamieszczony projekt aplikacji, która nie jest jeszcze wdrożona do sklepu Play Store.

## Prawa autorskie.
Aplikacja została stworzona przez studentki Uniwersytetu Gdańskiego z kierunku informatyka i ekonometria ze specjalnością aplikacje informatyczne w biznesie. Autorkami są Zuzanna Matyjasik, Patrycja Biedrzycka i Marika Idczak. Licencja do oprogramowania jest w pełni otwarta - MIT (Massachusetts Institute of Technology) z grupy FSF (Free Software Fundation).

## Specyfikacja wymagań.
#### Funkcjonalność.
*Zakres działania aplikacji został dokładnie opisany w osobnym pliku "[Funkcjonalność](https://github.com/zuzannamatyjasik/drive-better/blob/master/funkcjonalnosc)".*

Po uruchomieniu aplikacji użytkownik wybiera swoją lokalizację oraz miejsce docelowe. Następnie musi wprowadzić opłatę za kilometr (informację tę może znaleźć umieszczoną na taksówce lub spytać się kierowcy). Aplikacja wyznacza najkrótszą trasę oraz oblicza, jaka będzie cena przejazdu - kierowcy często w ogóle nie włączają taksometru i podają własną, zawyżoną cenę. W przypadku, kiedy kierowca zacznie zachowywać się agresywnie lub w inny, niepokojący nas sposób, pasażer będzie mógł nacisnąć przycisk SOS i powiadomić zaufaną osobę o zaistniałej sytuacji.

*Diagram funkcjonalności*

<img src="https://i.ibb.co/R4wWh48/Untitled-Document.png" alt="Untitled-Document" border="0" />

##### Wymagania niefunkcjonalne.
###### Wydajność i skalowalność.
Wydajność aplikacji zależy od szybkości połączenia internetowego oraz wydjaności urządzenia. W przypadku uruchamiania aplikacji na emulatorze czas oczekiiwania na wykonanie akcji będzie wydłużony. Głównym ograniczeniem aplikacji odnośnie skalowalności jest zastosowane API. Jako, że jest to dopiero wstępny projekt aplikacji, skupiono się na wykożystaniu darmowych funkcjonalności. Google Maps API (wyświatlanie mapy oraz pobieranie lokalizacji) przewiduje nieograniczoną liczbę zapytań użytkowników w ciągu dnia. Aczkolwiek niektóre funkcje API są płatne, np. wyznaczanie drogi (5$ za każde 1000 zapytań), dlatego użyto również drugiego API - Openrouteservice API. Dzięki niemu można wyznaczyć trasę między dwona punktami oraz obliczyć jej długość. Limit to 2000 darmowych zapytań w ciągu dnia. Dodatkowym ograniczeniem są wymogi Firebase. poniżej przedstawiono dokładnie rozpisane ograniczenia darmowych zapytań.
<img src="https://i.ibb.co/fY6C6p6/Zrzut-ekranu-2020-05-18-o-11-47-56.png" alt="Zrzut-ekranu-2020-05-18-o-11-47-56" border="0">

###### Otwartość i możliwość rozbudowy aplikacji.
Obecny projekt jest bazą (podstawową funkcjonalnością), którą można rozbudować w zancznym stopniu. W przypadku, kiedy aplikacja zyska popularność, wskazane będzie polepszenie wydajności i skalowalności aplikacji. Fundusze do tego można zdobyć przez nawiązanie współpracy, np. ze sklepami. Użytkownikowi mogły by się pojawiać reklamy z ofertą sklepów mijanych na wyznaczanej trasie. Duży potęcjał ma również zaangażowanie firm taksówkarskich. Porozumienie z aplikacją sprawdzającą wiarygodność taksówkarzy, podniesie poziom zaufania klientów do danej firmy. Następnym krokiem może być dodanie rankingu i ocenianie komfortu przejazdu, aby zwiększyć interakcję użytkownika z aplikacją.

###### Bezpieczeństwo i odporność na awarie.
Aplikacja została przetestowana pod kątem możliwych błędów w systemie. Głównie uwagę skoncentrowano na mozliwości wprowadzenia niepoprawnych danych przez użytkownika. Screnariusze oraz wyniki testów można zobaczyć w końcowej części dokumentu (Testy: scenariusze testów, sprawozdanie z wykonania scenariuszy testów). W aktualnej wersji projektu bezpieczeństwo dotyczące danych wprowadzonych przez użytkownika (numer telefonu) opiera się na zabezpieczeniach Firebase. 

### Architektura systemu oprogramowania.
##### Architektura rozwoju.
Aplikacja została napisana w środowisku Android Studio v. 3.5.5. Dodatkowo zostało zainstalowane repozytorium Fluttera v 44.0.1, wspierające język Dart. Wykorzystane zostało API Google Maps, aby wyświetlić mapę, pobrać aktualną pozycję oraz wybrać punkt końcowy trasy. Do wskazania na mapie najkrótszej drogi do celu użyto API [Openroute Service](https://openrouteservice.org). o przechowywania informacji z numerem alarmowym użyto Firebase.
##### Architektura uruchomieniowa.
Aplikację w formie projektu można uruchomić w środowisku Android Studio z zainstalowanym emulatorem z systemem Android Lollipop, Marshmallow, Nougat, Oreo lub Pie. Nawet do uruchamiania w formie projektu niezbędny będzie dostęp do internetu.
Aplikacja została przygotowana pod kontem wprowadzenia do Play Store, dlatego użytkownik najlepiej powinine mieć system Android 9 (API level 28). Z kolei minimalna wersja systemu potrzebna do uruchomienia aplikacji to Android 5 (API level 21). Użytkownik musi zezwolić na dostęp do lokalizacji użądzenia (GPS musi być włączony) oraz być połączony z Internetem.

### Testy.
##### Scenariusze testów.
<img src="https://i.ibb.co/28M087Z/Zrzut-ekranu-2020-05-18-o-10-34-38.png" alt="Zrzut-ekranu-2020-05-18-o-10-34-38" border="0" />
<img src="https://i.ibb.co/pR0jd8v/Zrzut-ekranu-2020-05-18-o-10-35-14.png" alt="Zrzut-ekranu-2020-05-18-o-10-35-14" border="0" />
<img src="https://i.ibb.co/DbVfxz1/Zrzut-ekranu-2020-05-18-o-10-37-19.png" alt="Zrzut-ekranu-2020-05-18-o-10-37-19" border="0" />
<img src="https://i.ibb.co/ccZrfYG/Zrzut-ekranu-2020-05-18-o-10-37-10.png" alt="Zrzut-ekranu-2020-05-18-o-10-37-10" border="0" />
<img src="https://i.ibb.co/cLqP18W/Zrzut-ekranu-2020-05-18-o-10-36-54.png" alt="Zrzut-ekranu-2020-05-18-o-10-36-54" border="0" />
<img src="https://i.ibb.co/n6yhgdN/Zrzut-ekranu-2020-05-18-o-10-37-44.png" alt="Zrzut-ekranu-2020-05-18-o-10-37-44" border="0" />
##### Sprawozdanie z wykonania scenariuszy testów.
