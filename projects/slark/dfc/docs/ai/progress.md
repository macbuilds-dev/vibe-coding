# Progress

## Works (in code)

- LabCorp `registerDonor` returns and stores `labcorpRegistrationNumber`
- Reg # + DFC appointment-pass QR in Email 1 / pass page (after book)
- Phone collected on order form; sent on book as `patient.phone`
- Jacob’s 5 email templates wired; payment-only confirmation retired
- Appointment reminder service (needs `ENABLE_APPOINTMENT_REMINDER_CRON`)
- Veriport SNS → results-available email (portal link)
- Admin panel matrix (DOT, 5 THC / no THC, 9, 12) via Pricing Structure

## Left to do (Jacob)

- [ ] Diagnose why live orders got **no DFC emails**
- [ ] Confirm reg # reaches customer before LabCorp visit (email + printable pass)
- [ ] Confirm phone appears on LabCorp **chain of custody** (API field + live CoC check)
- [ ] Incomplete-test / post-order reminder emails (currently stub)
- [ ] Live results notification walkthrough with Jacob
- [ ] After E2E success: configure remaining panels one-by-one

## Known issues / blockers

- Email 1 only sends **after appointment book**, not after Stripe payment — if Jacob stopped before booking, he would see no DFC email by design
- Book-path email failures are swallowed (warn only) → silent miss
- Admin “resend order confirmation” hits retired payment email stub
- Phone not on SOAP registration → may explain CoC gap
- `gh` auth on this Mac may be stale for private ops; code is already local
