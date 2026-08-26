# Progress

## Works (mobile)
- $12.50 quick lesson via backend pool only (`GET /sessions/default` → book).
- Address privacy: public session location = city.
- Meta SDK init + activate/app open + ATT (iOS); `AD_ID` in Android manifest.
- Home paddle asset without initials overlay.
- Version **1.1.8+29**.
- Edge-to-edge (Android MainActivity + Flutter SystemChrome).
- Store artifacts built: APK, AAB, IPA, Xcode archive (Organizer).
- Overlay-safe snackbars (critical paths).
- Signed Play builds on Gradle 8.14 / AGP 8.11.1 / Kotlin 2.3.20.

## Left to do (ops / console)
- Play: finish Advertising ID declaration; roll out 29; retire old artifacts without `AD_ID`.
- App Store: submit with privacy “Used for Tracking” (Device ID) matching ATT.
- Admin: open $12.50 pool slots (Lahore 404 `DEFAULT_LESSON_POOL_FULL` is data, not app).
- Meta Events Manager verification on real device.
- Future: Gradle 9 + AGP 9 when Flutter plugins are compatible.

## Known issues
- Play may warn AD_ID while an older **active** artifact lacks the permission — not missing from 1.1.8+29 AAB.
- Flutter may still warn Gradle 8.14 / AGP 8.11.1 “will soon be dropped”.
- Stripe/Material still call deprecated status/nav bar color APIs (third-party).
- Some modules still use `Get.snackbar` outside home flow.
