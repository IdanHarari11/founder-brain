# Colors — Current State

## Repos
| Repo | Tech | Purpose |
|------|------|---------|
| colors-backend | NestJS 11, MongoDB, BullMQ | API + workers (single Azure App Service) |
| colors-frontend (Marketplace-CV) | Next.js 15.5, React 19, Tailwind 4 | Marketplace UI on Vercel |

## Roles & Status
| Role | Backend | Frontend | Status |
|------|---------|----------|--------|
| Recruiter | ✅ Complete | ✅ Mostly complete | Production ready |
| Candidate | ✅ Complete | ⚠️ Almost complete | Missing: delete account polish, preferences |
| Business | ✅ Complete | ⚠️ Mostly complete | Missing: leads API, billing |
| Freelancer | ⚠️ Schema exists | ⚠️ Partial pages | Major gap — needs full implementation |

## What Works
- Recruiter search creation and management
- 3-stage AI matching pipeline (async BullMQ)
- SSE streaming of matching progress
- JWT + refresh token auth (all roles)
- Google OAuth (recruiter)
- Twilio OTP (candidate)
- Stripe subscription schemas (4 roles)
- Candidate profile, resume upload, preferences
- Business dashboard, activities, social posts
- Marketplace social feed, outings
- Team invitations

## Architecture
- Single Azure App Service runs BOTH HTTP API + BullMQ workers
- Frontend on Vercel, proxies all API calls via Next.js /api/* routes
- MongoDB with Mongoose, Redis for BullMQ
- AI: Anthropic Claude + OpenAI via ai-model-gateway module
