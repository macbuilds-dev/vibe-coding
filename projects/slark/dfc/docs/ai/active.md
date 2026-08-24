# Active

## Current focus (Jacob 2026-08-21)

Prove **one** test end-to-end (5-panel with THC): order → LabCorp → MRO → DFC emails + required donor data.

### Priority bugs / gaps

1. **DFC emails not received** after Jacob’s recent live orders — diagnose Resend/from/spam + whether book path actually fired Email 1 (payment-only path is retired SKIPPED).
2. **LabCorp donor registration #** — confirm present in Email 1 + appointment pass; Jacob says LabCorp desk needed it and LabCorp’s own notifications lacked it.
3. **Donor phone on CoC** — collected in order UI; sent as scheduling `patient.phone` only; **not** on OTS registerDonor SOAP. Confirm with LabCorp which field populates CoC; add if registration-side.
4. **Incomplete-test reminder emails** — stub/retired; Jacob still wants reminders if test not completed.
5. **Results path** — verify Veriport → Email 3 → portal access on a real completed result.
6. **Other panels** — defer until #1–5 work for 5-panel THC.

## Source brief

See `jacob-outstanding-2026-08-21.md`.
