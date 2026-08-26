# Decisions

## Default $12.50 instructor fallback
- **Decision:** Use an ordered instructor **pool** (3–5), not a single default ID.
- **Flow:** On “Start $12.50 Lesson”, try pool in priority order; first with a real open slot wins; if none → “No $12.50 lessons available right now — please check back soon.”
- **Owner:** Backend walks the pool via `GET /sessions/default`; mobile does not hardcode fallback instructors.
- **Rules:** No fake availability; no double-booking.
- **Branding (mobile accepts):**
  1. `defaultInstructorIds: string[]` (preferred, order = priority)
  2. `defaultInstructorPool: [{ instructorId, priority }]`
  3. Legacy `defaultInstructorId: string`
- **Admin:** must be able to add/remove pool members and set order.

## Android 15 edge-to-edge (1.1.8)
- **Decision:** Embrace edge-to-edge (`enableEdgeToEdge` + Flutter `SystemUiMode.edgeToEdge`); rely on existing `SafeArea`s. Do not opt out (disabled on API 36).

## Meta / Advertising ID
- **Decision:** Declare Advertising ID = Yes (Analytics + Advertising/marketing). Keep `AD_ID` in app manifest. Play warnings about missing AD_ID usually mean an older active artifact, not the current AAB.

## Store version
- **Current ship:** **1.1.8+29** (Play AAB + App Store IPA/archive).
