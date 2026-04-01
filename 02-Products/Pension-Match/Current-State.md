# Pension Match — Current State

## Repo
pension-agent (Next.js 15, React 18, JavaScript)

## What Works
- Dashboard, client list, pension view
- Mislaka API integration (create transaction, poll, fetch policies)
- Government fund data API
- AI chat with tool calls (fund comparison)
- Supabase auth (phone OTP)
- Waitlist (Google Sheets)

## What Needs Work
- Production is waitlist-only (middleware blocks all routes)
- No multi-advisor/SaaS model (no per-advisor data isolation)
- No payment/billing flow
- JavaScript, not TypeScript
- No meaningful test coverage
- Service role key exposed as NEXT_PUBLIC

## Tech
- Next.js 15, React 18, JavaScript
- Supabase (PostgreSQL + auth)
- OpenAI + Gemini
- Tailwind 3, shadcn/ui
- Vercel deployment
