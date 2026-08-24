# AGENTS.md — pickle-ball-app

> Local AI hub only (under `~/mac/ai/vibe-coding/projects`). App code lives at `~/mac/createex/pickle-ball-app`.

## Product

- Name: Pickle Ball Institute
- One-liner: Community app to find courts, connect players, organize matches, track scores, and shop.
- Related repos: `github.com/createex/pickle-ball-app` (private)
- Bundle id: `com.createex.pickleballinstitute`

## Stack

- Language / framework: Flutter 3.35.6 / Dart SDK ^3.9.0 (GetX)
- Package manager: pub
- iOS: CocoaPods, platform 14.0
- Android: Gradle Kotlin DSL, compileSdk from Flutter, Java 11
- Key packages: google_maps_flutter, geolocator, flutter_stripe, google_sign_in, sign_in_with_apple, socket_io_client

## Commands

```bash
export PATH="$HOME/development/flutter/bin:$PATH"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"

cd ~/mac/createex/pickle-ball-app
flutter pub get
cd ios && pod install && cd ..
flutter build ios --debug --no-codesign
flutter build apk --debug
```

## Layout

```
lib/       # Dart app
ios/       # Xcode + Podfile
android/   # Gradle
assets/    # pngs, svgs, fonts, video, pdf
```

## Do not

- Commit secrets (`.env`, `key.properties`, `google-services.json`)
- Drive-by refactors unrelated to the task
- Push this vibe-coding `projects/` hub (local only)

## Memory

- Before non-trivial work: read `docs/ai/active.md` and this file
- After meaningful work: update `docs/ai/active.md` and `docs/ai/progress.md`
