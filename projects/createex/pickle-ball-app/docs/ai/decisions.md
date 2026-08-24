# Decisions

## Default $12.50 instructor fallback
- **Decision:** Use an ordered instructor **pool** (3–5), not a single default ID.
- **Flow:** On “Start $12.50 Lesson”, try pool in priority order; first with a real open slot wins; if none → “No $12.50 lessons available right now — please check back soon.”
- **Rules:** No fake availability; no double-booking.
- **Branding (mobile accepts):**
  1. `defaultInstructorIds: string[]` (preferred, order = priority)
  2. `defaultInstructorPool: [{ instructorId, priority }]`
  3. Legacy `defaultInstructorId: string`
- **Admin:** must be able to add/remove pool members and set order.
