# Colors — Known Issues

## Backend
- Business leads API missing — frontend shows stub UI
- Stripe webhook handling incomplete for business role
- Activities hub has no API endpoint
- Twilio OTP only wired for candidate, not freelancer

## Frontend
- /marketplace/hr/professional uses hardcoded mock data
- Candidate registration has only SMS OTP entry, no full onboarding
- Business billing page stubs exist but no Stripe integration
- FreelancerCard uses mock data in some places

## Infrastructure
- API + workers in single process — no horizontal scaling
- Port conflicts: colors-backend uses 8001 (conflicts with Paperclip)
