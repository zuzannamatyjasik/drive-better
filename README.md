# DriveBetter

##### *Spis treści:*
* *[Charakterystyka i cel projektu](#charakterystyka-projektu)*
* *[Prawa autorskie](#prawa-autorskie)*
* *[Specyfikacja wymagań](#specyfikacja-wymagań)*
  * *Funkcjonalność*
  * *Wymagania niefunkcjonalne*
* *[Architektura systemu oprogramowania](#architektura-systemu-oprogramowania)*
  * *Architektura rozwoju*
  * *Architektura uruchomieniowa*
* *[Testy](#testy)*
  * *Testy*
  * *Przypadki testowe*
  * *Sprawozdanie z wykonania scenariuszy testów*

## Charakterystyka projektu.
Drive Better (DB) to aplikacja mająca na celu niwelowanie liczby oszustw finansowych popełnianych przez taksówkarzy. Po wprowadzeniu odpowiednich danych zostaje wyznaczona najkrótsza trasa dojazdu oraz pokazana rzeczywista cena przejazdu.  Założeniem było zwiększenie komfortu oraz bezpieczeństwa pasażerów - z tego powodu został dodatkowo umieszczony przycisk SOS. Dokładny zakres funkcjonalności aplikacji został opisany poniżej. Został tutaj zamieszczony projekt aplikacji, która nie jest jeszcze wdrożona do sklepu Play Store.

## Prawa autorskie.
Aplikacja została stworzona przez studentki Uniwersytetu Gdańskiego z kierunku informatyka i ekonometria ze specjalnością aplikacje informatyczne w biznesie. Autorkami są Zuzanna Matyjasik, Patrycja Biedrzycka i Marika Idczak. Licencja do oprogramowania jest w pełni otwarta - MIT (Massachusetts Institute of Technology) z grupy FSF (Free Software Fundation).

## Specyfikacja wymagań.
#### Funkcjonalność.
*Zakres działania aplikacji został dokładnie opisany w osobnym pliku "[Funkcjonalność](https://github.com/zuzannamatyjasik/drive-better/blob/master/funkcjonalnosc.md)".*

Po uruchomieniu aplikacji użytkownik wybiera swoją lokalizację oraz miejsce docelowe. Następnie musi wprowadzić opłatę za kilometr (informację tę może znaleźć umieszczoną na taksówce lub spytać się kierowcy). Aplikacja wyznacza najkrótszą trasę oraz oblicza, jaka będzie cena przejazdu - kierowcy często w ogóle nie włączają taksometru i podają własną, zawyżoną cenę. W przypadku, kiedy taksówkarz zacznie zachowywać się agresywnie lub w inny, niepokojący nas sposób, pasażer będzie mógł nacisnąć przycisk SOS i powiadomić zaufaną osobę o zaistniałej sytuacji.

*Diagram funkcjonalności*

<img src="https://i.ibb.co/R4wWh48/Untitled-Document.png" alt="Untitled-Document" border="0" />

#### Wymagania niefunkcjonalne.
###### Wydajność i skalowalność.
Wydajność aplikacji zależy od szybkości połączenia internetowego oraz wydajności urządzenia. W przypadku uruchamiania aplikacji na emulatorze czas oczekiwania na wykonanie akcji będzie wydłużony. Głównym ograniczeniem aplikacji odnośnie do skalowalności jest zastosowane API. Jako że jest to dopiero wstępny projekt, skupiono się na wykorzystaniu dostępnych darmowych funkcjonalności. Google Maps API (wyświetlanie mapy oraz pobieranie lokalizacji) przewiduje nieograniczoną liczbę zapytań użytkowników w ciągu dnia. Aczkolwiek niektóre funkcje Google Maps API są płatne, np. wyznaczanie drogi (5$ za każde 1000 zapytań), dlatego użyto również drugiego API - Openrouteservice API. Dzięki niemu można wyznaczyć trasę między dwoma punktami oraz obliczyć jej długość. Limit to 2000 darmowych zapytań w ciągu dnia. Dodatkowym ograniczeniem są wymogi Firebase. Poniżej przedstawiono dokładnie rozpisane ograniczenia darmowych zapytań.
<img src="https://i.ibb.co/fY6C6p6/Zrzut-ekranu-2020-05-18-o-11-47-56.png" alt="Zrzut-ekranu-2020-05-18-o-11-47-56" border="0">

###### Otwartość i możliwość rozbudowy aplikacji.
Obecny projekt jest bazą (podstawową funkcjonalnością), którą można rozbudować w znacznym stopniu. W przypadku, kiedy aplikacja zyska popularność, wskazane będzie polepszenie wydajności i skalowalności. Fundusze do tego można zdobyć przez nawiązanie współpracy, np. ze sklepami. Użytkownikowi mogłyby się pojawiać reklamy z ofertą sklepów mijanych na wyznaczanej trasie. Duży potencjał ma również zaangażowanie firm taksówkarskich. Porozumienie z aplikacją sprawdzającą wiarygodność taksówkarzy podniesie poziom zaufania klientów do danej firmy. Następnym krokiem może być dodanie rankingu i ocenianie komfortu przejazdu, aby zwiększyć interakcję użytkownika z aplikacją.

###### Bezpieczeństwo i odporność na awarie.
Aplikacja została przetestowana pod kątem możliwych błędów w systemie. Głównie uwagę skoncentrowano na możliwości wprowadzenia niepoprawnych danych przez użytkownika. Scenariusze oraz wyniki testów można zobaczyć w końcowej części dokumentu (Testy -> testy, przypadki testowe, sprawozdanie z wykonania scenariuszy testów). W aktualnej wersji projektu bezpieczeństwo dotyczące danych wprowadzonych przez użytkownika (numer telefonu) opiera się na zabezpieczeniach Firebase. 

## Architektura systemu oprogramowania.
##### Architektura rozwoju.
Aplikacja została napisana w środowisku Android Studio v. 3.5.5. Dodatkowo zostało zainstalowane repozytorium Fluttera v 44.0.1, wspierające język Dart. Wykorzystane zostało [API Google Maps](https://developers.google.com/maps/documentation), aby wyświetlić mapę, pobrać aktualną pozycję oraz wybrać punkt końcowy trasy. Do wskazania na mapie najkrótszej drogi do celu użyto API [Openroute Service](https://openrouteservice.org). Do przechowywania informacji z numerem alarmowym użyto Firebase.
##### Architektura uruchomieniowa.
Aplikację w formie projektu można uruchomić w środowisku Android Studio z zainstalowanym emulatorem z systemem Android Lollipop, Marshmallow, Nougat, Oreo lub Pie. Nawet do uruchamiania w formie projektu niezbędny będzie dostęp do internetu.

Aplikacja została przygotowana pod kątem wprowadzenia do Play Store, dlatego preferowane jest, aby użytkownik miał zainstalowany system Android 9 (API level 28). Z kolei minimalna wersja systemu potrzebna do uruchomienia aplikacji to Android 5 (API level 21). Użytkownik musi zezwolić na dostęp do lokalizacji urządzenia (GPS musi być włączony) oraz mieć połączenie z Internetem.

## Testy.
#### Testy.

<img src="https://i.ibb.co/JR2TWJk/Zrzut-ekranu-2020-05-18-o-12-46-26.png" alt="Zrzut-ekranu-2020-05-18-o-12-46-26" border="0">

#### Przypadki testowe.

<img src="https://i.ibb.co/1Zbg3hX/Zrzut-ekranu-2020-05-18-o-12-46-39.png" alt="Zrzut-ekranu-2020-05-18-o-12-46-39" border="0">
<img src="https://i.ibb.co/LpZwt8r/Zrzut-ekranu-2020-05-18-o-12-46-52.png" alt="Zrzut-ekranu-2020-05-18-o-12-46-52" border="0">
<img src="https://i.ibb.co/v476LnS/Zrzut-ekranu-2020-05-18-o-12-47-05.png" alt="Zrzut-ekranu-2020-05-18-o-12-47-05" border="0">
<img src="https://i.ibb.co/rtmr7dV/Zrzut-ekranu-2020-05-18-o-12-47-16.png" alt="Zrzut-ekranu-2020-05-18-o-12-47-16" border="0">
<img src="https://i.ibb.co/FKjhxvW/Zrzut-ekranu-2020-05-18-o-12-47-26.png" alt="Zrzut-ekranu-2020-05-18-o-12-47-26" border="0">

## Sprawozdanie z wykonania scenariuszy testów.

*Liczba godzin: 1h*\
*Nazwa testowanej aplikacji: DriveBetter*\
*Zostały przeprowadzone testy funkcjonalne.*

#### Założenia do testów.
* Data i godzina wykonania testów: 18.05.2020 od 13:00 do 14:00
* Środowisko: Android 10 One UI 2.0 

#### Ocena.

Logika aplikacji działa sprawnie. Aplikacja jest prosta w nawigacji oraz ma czytelny dla użytkownika interface. Zastosowano odpowiednie kontrasty i przyjemne dla oczu kolory. Poprawy wymaga wyszukiwanie lokalizacji przy pomocy search box oraz obsługa kilku wyjątków.


#### Elementy aplikacji poddane testom:
* Wysyłanie sms alarmowego – **działa** (z drobnym defektem)
* Wyszukanie trasy i obliczenie kosztów przejazdu – **działa** (z drobnym defektem)
* Wyszukiwanie lokalizacji – **działa** (z istotnym defektem)


#### Defekty:
* *ID – 01 –*

    Jeśli użytkownik nie zdefiniował numeru, a spróbuje wysłać sms alarmowy, otworzy się aplikacja obsługująca usługę sms, ale wyświetli ona błąd, że odbiorca jest nieprawidłowy.\
    **Oczekiwane działanie:** Aplikacja wyświetla komunikat o niezdefiniowanym numerze lub otwiera aplikację obsługującą sms zdefiniowanego odbiorcy.\
    **Waga:** mało ważny 
    
    <img src="https://i.ibb.co/jzMFvQ4/Zrzut-ekranu-2020-05-18-o-17-00-52.png" alt="Zrzut-ekranu-2020-05-18-o-17-00-52" border="0">

* *ID – 02 –*

    Gdy punkt początkowy lub końcowy zostanie ustawiony w lokalizacji niedostępnej dla ruchu samochodowego, aplikacja podejmie próbę wyszukania trasy. Ze względu na brak możliwości jej znalezienia, przez cały czas na ekranie będzie się wyświetlał widok ładowania. Podczas testu, po 5 minutach aplikacja wciąż ładowała trasę.\
    **Oczekiwane działanie:** Aplikacja wyświetla błąd związany z lokalizacją\
    **Waga:** trywialny
    
    <img src="https://i.ibb.co/j42DGXS/Zrzut-ekranu-2020-05-18-o-17-00-23.png" alt="Zrzut-ekranu-2020-05-18-o-17-00-23" border="0">
    <img src="https://i.ibb.co/rtmvGVk/Zrzut-ekranu-2020-05-18-o-17-00-48.png" alt="Zrzut-ekranu-2020-05-18-o-17-00-48" border="0">
    <img src="https://i.ibb.co/W07NKvP/Zrzut-ekranu-2020-05-18-o-17-00-43.png" alt="Zrzut-ekranu-2020-05-18-o-17-00-43" border="0">
    
* *ID – 03 –*

    Wyszukiwanie przy pomocy search box jest niemożliwe. Po wpisaniu nazwy lokalizacji lub współrzędnych geograficznych, aplikacja zawsze wskazuje brak rezultatów.\
    **Oczekiwane działanie:** Wyświetlenie lokalizacji zgodnych z danymi wpisanymi w search box.\
    **Waga:** poważny
    
    <img src="https://i.ibb.co/YPM0RN2/Zrzut-ekranu-2020-05-18-o-16-48-21.png" alt="Zrzut-ekranu-2020-05-18-o-16-48-21" border="0">
    <img src="https://i.ibb.co/0Fch49b/Zrzut-ekranu-2020-05-18-o-17-00-18.png" alt="Zrzut-ekranu-2020-05-18-o-17-00-18" border="0">
    
#### Podsumowanie.

W dalszym testach dodatkowej uwagi wymaga:
* Działanie wyszukiwarki.
* Obsługa wyjątków.
