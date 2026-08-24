# Progress

## Works (mobile)
- $12.50 quick lesson pool flow (`QuickLessonService`, branding pool parsers).
- Meta SDK init + activate/app open.
- TPI home paddle branding.
- Version 1.1.6+27.
- Overlay-safe snackbars (critical paths).
- Release APK builds on Gradle 8.14 / AGP 8.11.1 / Kotlin 2.3.20.

## Left to do (ops)
- Admin: save fallback instructor pool on live branding.
- Meta Events Manager verification on device.
- Play Console production status.
- Future: Gradle 9 + AGP 9 when Flutter plugins (Stripe, file_picker) are compatible.

## Known issues
- Flutter may still warn Gradle 8.14 / AGP 8.11.1 “will soon be dropped” — safe to ignore until plugin ecosystem catches up.
- Some modules still use `Get.snackbar` outside home flow.
