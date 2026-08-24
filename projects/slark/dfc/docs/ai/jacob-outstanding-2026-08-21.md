# Jacob Webb — Outstanding Development Items

**Date:** Fri, 21 Aug 2026  
**From:** Jacob Webb \<jwebb@drugfreecompliance.com\> (COO)  
**To:** Fahad Sajid, Abdul Rehman  
**Forwarded:** Fahad → team, 21 Aug 2026 11:30 PM  

## Context

Jacob ordered two DFC tests in the last week (including morning of 21 Aug). On both, he received **no emails from Drug-Free Compliance**. He wants the full email + notification + LabCorp data flow working. Concentrate on current test E2E before other panels.

## Outstanding items

### 1. Order Confirmation Email
Immediately after order: professional DFC confirmation with everything needed for the test.

### 2. LabCorp Donor Registration Number / QR Code
LabCorp desk needed his LabCorp donor registration number; it was not in LabCorp’s own notifications.  
Determine if DFC receives that number via API; if so, include in DFC confirmation.  
Ideal: simple form/pass to bring to LabCorp with reg #, QR, test info, anything LabCorp needs.

### 3. Donor Phone Number on Chain of Custody
Collect phone during ordering and pass through LabCorp API so it populates the **LabCorp chain-of-custody** form (MRO contact).  
Not enough to store phone only in DFC DB — must transmit and appear on CoC. Confirm which API field with docs/LabCorp.

### 4. Reminder Emails
Reminders after order if customer has not completed the test.

### 5. Results Emails / Notifications
Customer notification when results available + how they access them. Jacob has not seen a completed-results flow yet.

### 6. Additional Tests
Only 5-panel with THC changed for now. Once E2E (LabCorp → MRO → DFC) works, add/configure remaining tests (incl. 10-panel) one-by-one.

## Questions Jacob asked

1. Why no DFC emails when he places an order?
2. Are we receiving LabCorp donor registration number through the API?
3. Is donor phone currently sent through the LabCorp API?
4. Which API field controls donor phone?
5. Is that phone appearing on the chain-of-custody form?
6. What still needs to be completed for the full process?

## Code answers (2026-08-24 audit) — draft for reply

| Question | Code answer |
|----------|-------------|
| Why no emails? | Email 1 sends **after LabCorp appointment book**, not after payment (`orderConfirmationEmailService` = SKIPPED). Also check Resend/`EMAIL_FROM`, spam, and swallowed send errors on book. If he paid but never booked, no DFC email by design. |
| Reg # from API? | **Yes** — SOAP `registerDonor` → `labcorpRegistrationNumber` stored on `DonorRegistration`; included in Email 1 + appointment pass. |
| Phone via API? | **Partial** — collected in UI; sent on scheduling as `patient.phone`. **Not** on OTS registerDonor SOAP. |
| Which field? | Scheduling: `patient.phone` (10-digit NANP). Registration SOAP: no phone field today. CoC field TBD with LabCorp. |
| On CoC? | **Unknown from our side** — must verify on a live LabCorp CoC; likely gap if CoC reads registration, not schedule patient. |
| Still needed? | Diagnose live email delivery; confirm pass/reg # UX; wire phone to correct CoC field; restore incomplete-test reminders; prove Veriport results email; then other panels. |
