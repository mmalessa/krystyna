# Krystyna
```shell
flutter pub get
flutter build apk --release
```


## Zainstaluj wymagane narzędzia (jeśli jeszcze nie masz)

- Flutter SDK (flutter --version)
- Android Studio (wraz z Android SDK i NDK)
- Dart SDK (jeśli nie jest częścią Fluttera)
- Java JDK 17+ (zalecane do Android Studio i Gradle)

## Uruchom flutter pub get

W katalogu głównym projektu (tam, gdzie jest pubspec.yaml) uruchom w terminalu:
```
flutter pub get
```
To pobierze wszystkie zależności projektu.

## Uruchom flutter doctor

Dla pewności uruchom:
```
flutter doctor
```
Sprawdź, czy wszystkie składniki mają zielone „✓”.

Jeśli pojawią się błędy np. z Android licenses, napraw to według wskazówek (flutter doctor --android-licenses).

## Uruchom aplikację z Android Studio

- Otwórz katalog projektu w Android Studio.
- Poczekaj, aż załadują się zależności (Gradle + pubspec).
- Być może:
    - wyłącz Android Studio
    - usuń katalogi (jeśli są) '.idea' i 'android/gradle'
- Wybierz emulator lub podłączony telefon.
- Kliknij Run ▶️ lub użyj skrótu Shift + F10.

## Jeśli pojawią się błędy typu:
🔸 NDK version mismatch:
Sprawdź plik android/local.properties i upewnij się, że masz taką linię:
`ndkVersion=27.0.12077973`
Upewnij się, że w Android Studio masz zainstalowaną właśnie tę wersję NDK:

'Android Studio → SDK Manager → SDK Tools → NDK (zaznacz i wybierz konkretną wersję)'

