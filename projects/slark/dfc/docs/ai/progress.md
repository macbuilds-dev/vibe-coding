# Progress

## Works (in code) — updated 2026-08-26

- **Payment confirmation email** sends immediately after Stripe fulfill with LabCorp donor registration #
- Post-book Email 1 still sends QR + appointment pass + reg #
- Scheduling sends `patient.phone`; OTS register SOAP must **not** include phone (LabCorp schema rejects it)
- Frontend normalizes/validates 10-digit NANP phone on donor step
- Incomplete-test + appointment reminder crons: default **on** unless env `=false`
- Veriport SNS → results email recovers recipient from DFC when XML omits `DonorEmail` (reg # / client id / name match)
- **False CANCELLED fix:** LabCorp GET 404 / missing after appointment start → `COMPLETED` (not cancel); portal sync can heal prior false cancels
- **My reports dedupe:** single user fetch + dedupe by `veriportReportId` (frontend)

## Shipped / push status (2026-08-26)

- Client status email archived: `jacob-client-update-2026-08-26.md` (boss → Jacob)
- Backend false-cancel + related sync fixes: commit + push with this session
- Frontend reports dedupe + COMPLETED badge: commit + push with this session

## Left / verify live with Jacob

- [ ] Redeploy API (false-cancel fix + Veriport email recovery if not already on image)
- [ ] Redeploy frontend (My reports dedupe)
- [ ] Re-heal ORD-280 / ORD-281 after cancel fix is live (else Appointments poll can flip again)
- [ ] Resend results notification for report 586078
- [ ] Confirm phone on next physical CoC
- [ ] After E2E success on 5-panel THC: configure remaining panels

## Known notes

- Jacob 08/18 + 08/21 showed CANCELLED because DFC treated LabCorp post-collection 404 as cancel
- Report 586078 linked manually (Missing DonorEmail from Veriport); not client/LabCorp fault for blank email — link fail was missing DFC fallback at receive time
