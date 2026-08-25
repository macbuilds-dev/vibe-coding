# Progress

## Works (mobile)
- $12.50 quick lesson via backend pool only (`GET /sessions/default` → book).
- Branding paddle overlay (initials/color from `/branding`).
- Address privacy: public session location = city.
- Meta SDK init + activate/app open.
- TPI home paddle asset.
- Version **1.1.7+28**.
- Overlay-safe snackbars (critical paths).
- Signed Play **AAB** builds on Gradle 8.14 / AGP 8.11.1 / Kotlin 2.3.20.

## Left to do (ops)
- Play Console: upload `app-release.aab` (1.1.7 / 28) + release notes → review/rollout.
- iOS: recreate signing certs (private key missing) → Archive → Distribute.
- Admin: confirm live default instructor pool is configured.
- Meta Events Manager verification on device.
- Future: Gradle 9 + AGP 9 when Flutter plugins (Stripe, file_picker) are compatible.

## Known issues
- Flutter may still warn Gradle 8.14 / AGP 8.11.1 “will soon be dropped” — safe to ignore until plugin ecosystem catches up.
- Some modules still use `Get.snackbar` outside home flow.
- Command-line iOS archive fails until Development/Distribution certs with private keys exist in Keychain.
