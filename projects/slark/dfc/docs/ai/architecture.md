# Architecture

## Repos

| Piece | Role |
|-------|------|
| `dfc-frontend` | Order UX, donor form, appointment pass `/appointment/pass`, portal, Veriport report pages |
| `dfc-backend` | Prisma, Stripe, LabCorp SOAP register/modify + scheduling JSON, Resend emails, Veriport SNS + LabCorp appointment webhooks |
| `dfc-admin` | Panels/pricing (account #, test code, Profile ID), donors, payments, subscriptions, reports resend |

## LabCorp

- **Register/modify donor:** OTS SOAP (`donorRegistrationService.ts`). Returns `labcorpRegistrationNumber`. **No phone field** on registration SOAP today.
- **Schedule/book:** JSON scheduling API. Patient phone sent as `patient.phone` (10 US digits) on book path only.
- **Panel config:** Admin Pricing Structure → `panelTestCode`, `accountNo`, optional `labcorpProfileId` (SOAP panelId).

## Email (Jacob’s 5 only)

| # | Template | Trigger |
|---|----------|---------|
| 1 | Order & Appointment Confirmation | After LabCorp book (`schedulingFollowUpService`) |
| 2 | Appointment Reminder | ~1h before (`ENABLE_APPOINTMENT_REMINDER_CRON`) |
| 3 | Test Results Available | Veriport SNS |
| 4 | Appointment Cancellation | Cancel path |
| 5 | Password Reset OTP | Auth |

- Transport: Resend (`RESEND_API_KEY`) in prod; Mailpit locally.
- From: `Drug-Free Compliance <webmaster@drugfreecompliance.com>` (env-overridable).
- **Retired:** payment-time order confirmation, incomplete-test reminders, PDF-in-email results.

## Results

AWS SNS → `/webhooks/veriport/sns` → store report → email portal link (no values/PDF in email).
