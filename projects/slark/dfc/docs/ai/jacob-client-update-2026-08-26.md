# Jacob client update (sent by boss) — 2026-08-26

Status email shared with Jacob Webb covering Aug 21 outstanding items plus Aug 25 follow-ups (false CANCELLED, My reports, MRO email gap).

---

Hi Jacob, here’s a simple update on everything:

1. Order confirmation emails — FIXED  
   After a customer pays, they now immediately receive an order confirmation with their LabCorp registration number. The emails from 08/18 and 08/21 followed the old process, which is why you didn’t receive them.

2. Order information — WORKING  
   The payment confirmation includes the LabCorp registration number. Once the appointment is booked, the appointment details/pass and QR code are also provided.

3. LabCorp registration number — WORKING  
   We are receiving and storing the LabCorp registration number correctly. Your orders have the numbers on file, including 607590514 and 608128957.

4. Phone number — BEING VERIFIED  
   The customer’s phone number is being sent to LabCorp when scheduling. We’ve confirmed it is present in our system. We’ll also verify it on the next physical Chain of Custody to make sure everything is being carried through correctly.

5. Test/reminder emails — WORKING  
   The reminders for incomplete tests and upcoming appointments are active. They were temporarily not being sent because the system incorrectly thought the appointments were cancelled. Once the permanent status fix is deployed, reminders will work normally.

6. Test results — RECEIVED  
   The MRO result for Jacob Webb was successfully received and stored in our system. It is now linked to the account and can be viewed under My Reports.

7. Why the 08/21 result didn’t appear automatically  
   The result did arrive on August 25. The problem was that the MRO report did not include the customer’s email address, so our system couldn’t automatically match it to the account. We’ve now linked the report manually and are updating the process so this won’t happen again.

8. Why the completed tests showed as “Cancelled”  
   This was a system issue, not an actual cancellation. After a test was completed, LabCorp returned an “appointment unknown” response, and our system incorrectly interpreted that as a cancellation. The statuses have been corrected, and the permanent fix is being deployed.

9. Duplicate report — FIX IN PROGRESS  
   There is only one actual report. It was showing multiple times because the system was displaying the same report for each related order. A fix is ready so it will appear only once.

10. Going forward  
    We will no longer depend on the MRO to provide the customer’s email address. If the MRO leaves the email blank, we’ll match the result using the LabCorp registration number/order information and send the notification to the email already stored in your system.

## Current status

The main order flow is now working. The remaining items are:

* Final deployment of the cancellation-status fix
* Results email resend
* Duplicate report display fix

Once those are deployed, we should have the full end-to-end flow working reliably.

---

## Internal notes (not in client email)

- Report: VP-RPT-2026-586078 / Veriport id ~586078; accession 0218821260; userId 5 (Jacob).
- MRO payload had empty DonorEmail; DFC recovery (`resolveDonorEmailForResults`) is in backend code; confirm prod deploy for future files.
- False cancel: LabCorp GET 404 after collection → was cancel; fix maps past missing → COMPLETED.
- Phone: scheduling `patient.phone` yes; OTS register SOAP must not send phone (schema rejects it).
- Client later asked for a written checklist so every inbound MRO result lands correctly when email is missing.
