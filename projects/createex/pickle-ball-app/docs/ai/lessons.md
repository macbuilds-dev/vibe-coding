# Lessons

## Do not repeat
- Do not call `Get.snackbar` when Overlay may be missing — use `showCustomSnackbar`.
- Do not rely on a single Georgia default instructor for $12.50 CTA — backend owns the pool.
- AGP 9 + Gradle 9 upgrade breaks this project today (plugin JVM target + file_picker compileSdk) — stay on AGP 8.11.1 until plugins catch up.
- Play AD_ID warning with Meta: declaration=Yes requires `com.google.android.gms.permission.AD_ID` in **every active** artifact; checking only the new AAB is not enough if an older track build is still active.
- Do not treat `DEFAULT_LESSON_POOL_FULL` as a Flutter bug — show API `error` exactly; fix is ops/slots.
- Paddle initials overlay was removed by product request — keep asset-only unless branding overlay is asked again.
