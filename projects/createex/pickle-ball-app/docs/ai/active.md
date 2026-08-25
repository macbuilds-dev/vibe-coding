# Active context

## Current focus
Ship **1.1.7+28** store builds (Play AAB ready; iOS archive blocked on missing signing private key until certs recreated in Xcode).

## Recent changes (mobile — complete)
- **Start $12.50 Lesson**: backend owns instructor pool — mobile only calls `GET /sessions/default` (no client-side pool walk). Exact 404 copy; generic message for 400/ops errors.
- **Paddle branding**: `GET /branding` → overlay `paddleInitials` / `paddleTextColor` on home nearby paddle (`BrandedPaddleImage`).
- **Address privacy**: session cards/models show **city** only (no street) for public session location.
- Version bumped to **1.1.7+28**.
- Android: Kotlin `compilerOptions` DSL (`JvmTarget.JVM_11`); signed **AAB** built at `build/app/outputs/bundle/release/app-release.aab`.

## How to verify
1. Admin has ordered default instructor pool on live branding.
2. Tap Start $12.50 Lesson → open slot books; full pool → exact empty message.
3. Home paddle shows admin initials/color (defaults TPI/green).
4. Browse/session cards show city, not street.
5. Upload AAB to Play Console; iOS: recreate Apple Development (+ Distribution) certs in Xcode → Archive.

## Blockers
- iOS archive: Apple Development cert exists for this Mac but **private key missing** — revoke/recreate in Xcode Manage Certificates, then Archive.
- Live branding pool must be configured by admin or CTA returns 400/404.
