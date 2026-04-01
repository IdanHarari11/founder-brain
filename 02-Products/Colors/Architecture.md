# Colors — Architecture

## System Overview
```
Browser → colors-frontend (Vercel) → /api/* → colors-backend (Azure)
```

## Backend (27 NestJS Modules)
- auth, users, recruiters, businesses, freelancers, companies
- matching (3-stage AI pipeline + BullMQ processor)
- marketplace (search, social, activities, analytics)
- subscription (Stripe, 4 role schemas)
- team, campaign, avatars, send-email, otp, twilio-otp
- ai-model-gateway, cloudinary, waitlist, version

## Matching Pipeline (Core Value)
1. **Stage 1** — Hard gates: location, experience, languages, must-have skills
2. **Stage 2** — Scoring: coreSkillsFit, careerQuality, redFlagsPenalty
3. **Stage 3** — AI deep analysis: Claude/GPT structured insights

Config:
- MATCHING_STAGE_1_2_CONCURRENCY=10
- MATCHING_STAGE_3_CONCURRENCY=3
- MATCHING_TIMEOUT_MS=120000

## Auth
- JWT access token (Authorization header)
- Refresh token (httpOnly cookie, argon2 hashed)
- 4 roles: recruiter, user (candidate), business, freelancer
- Guards: JwtAuthGuard + RolesGuard + @Roles() decorator

## Frontend
- Next.js 15 App Router, Server Components by default
- Shadcn/Radix UI, Tailwind 4
- Neon/glassmorphism design system
- No global state store — React hooks + localStorage
- API proxy: all backend calls via /api/* route handlers
