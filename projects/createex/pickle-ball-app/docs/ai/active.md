# Active context

## Current focus
Ship mobile updates from client feedback + stable Android release builds.

## Recent changes (mobile — complete)
- **Start $12.50 Lesson**: backend-first pool lookup + branding pool fallback; client empty message.
- Meta App Events wired (Android/iOS).
- Overlay-safe snackbars on home / quick lesson / profile photo update.
- Android: Kotlin bumped to **2.3.20** (Gradle/AGP left at 8.14 / 8.11.1 — AGP 9 blocked by plugin deps).

## How to verify
1. Admin sets ordered fallback instructor pool on live branding.
2. Tap Start $12.50 Lesson → first open slot; all full → empty message.
3. Meta Test events on physical device.
4. `flutter build apk --release` succeeds.

## Blockers
- Full Gradle 9 / AGP 9 upgrade deferred (Stripe/file_picker compileSdk + tapandpay resolution on AGP 9).
- Live branding still needs pool IDs saved in admin.
