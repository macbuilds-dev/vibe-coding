# Product

## What

Drug-Free Compliance sells employer/donor drug tests online. Customer pays, registers as a LabCorp donor, books a collection appointment, then receives MRO results via Veriport into their DFC portal.

## Who

- Client: Drug-Free Compliance (Jacob Webb, COO)
- Dev: Fahad / team under Slark → `webmaster-dfc` GitHub

## Core flows

1. Browse panels / pricing → order form (donor info + phone)
2. LabCorp donor registration (OTS SOAP) → `labcorpRegistrationNumber`
3. Stripe checkout
4. LabCorp appointment book → Email 1 (Order & Appointment Confirmation) + DFC appointment pass / QR
5. Appointment reminder (~1h before) if cron enabled
6. Collection at LabCorp (needs donor reg # on CoC)
7. Veriport SNS webhook → Email 3 (results available, portal link only)
8. Customer views reports in account portal

## Current focus panel

Jacob wants **5-panel with THC** proven end-to-end before configuring other panels.
