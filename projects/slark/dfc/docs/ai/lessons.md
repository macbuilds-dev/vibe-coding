# Lessons

- “Order confirmation” in Jacob’s language ≈ Email 1 after **LabCorp book**, not Stripe payment. Asking “why no email after order” must check whether an appointment was booked and whether Resend delivered.
- LabCorp CoC phone may require a **registration** SOAP field, not only scheduling `patient.phone` — verify with LabCorp docs before assuming book payload is enough.
- Silent `console.warn` on email send after book hides production failures; surface status to ops/admin.
