# Active context

## Current focus
Ship / monitor **1.1.8+29** on Play + App Store. Edge-to-edge + Meta AD_ID are in the binary; Play AD_ID warning is about older **active** artifacts until 29 fully replaces them.

## Recent changes (mobile — complete)
- Version **1.1.8+29** (APK, AAB, IPA, Xcode archive).
- **Edge-to-edge**: `enableEdgeToEdge()` in `MainActivity` + Flutter `SystemUiMode.edgeToEdge`.
- **Paddle**: removed TPI initials overlay — image asset only.
- **Diagnostics**: QuickLesson / Meta / auth restore / splash token logs for device QA.
- **AD_ID**: `com.google.android.gms.permission.AD_ID` present in manifest + merged AAB (Meta).
- $12.50 CTA still backend pool only (`GET /sessions/default`).

## How to verify
1. Play: upload AAB 29; Advertising ID = Yes (Analytics + Advertising/marketing); uncheck “turn off release errors”.
2. Confirm App bundle explorer for v29 lists `AD_ID`.
3. Replace/deactivate older active builds (e.g. 28) that lack `AD_ID`.
4. CTA with Georgia test city if Lahore pool is full (`DEFAULT_LESSON_POOL_FULL` = ops).
5. Meta Events Manager → Test Events after ATT authorize.

## Blockers
- Ops: default lesson pool slots for Lahore/Punjab (or test Georgia).
- Play warning may linger until only AD_ID-capable artifacts are active.
- AGP 9 / Gradle 9 still blocked by Flutter plugins (Stripe, file_picker JVM/compileSdk).
