# CV.Ai — Current State

## Repos

| Repo | Tech | Purpose |
|------|------|---------|
| **cv.ai** | NestJS 10, MongoDB (Mongoose), BullMQ, Redis, Firebase config | Backend API: resume CRUD, per-section AI upgrades, PDF, video/voice/avatar pipelines, auth, plans |
| **cvai-group** | Next.js 15, React 18, Zustand, Tailwind, shadcn | Frontend: chat/editor UX, templates, SSE proxy, Tranzila payments proxy, white-label |
| **cv_ai_agent** | LangGraph, TypeScript ESM, PostgreSQL checkpointer | Conversational agent: **11 tools** (resume, OTP, templates, API helpers) |

## What Works

- **Full resume CRUD** across standard sections (personal info, profile, experience, education, skills, etc.).
- **Per-section AI upgrade** via **BullMQ** jobs; processors per section type.
- **SSE streaming** of upgrade progress (`upgrade_started` → `progress` → `upgrade_completed` / errors) into the frontend store.
- **PDF generation** (Puppeteer on backend; react-pdf and related tooling on frontend for previews/exports).
- **Auth**: JWT + refresh patterns, **Google OAuth**, **Twilio OTP** (phone verification before agent saves).
- **LangGraph agent**: phone verification → structured section collection → `resume_update_section` → backend enqueue.
- **Template system**: template1–template6 registry on backend; preview/list tools from agent where applicable.
- **Video CV** and related media flows (backend services + frontend proxies).
- **Avatar generation** (e.g. fal.ai from frontend env; server-side keys only in routes).
- **Tranzila** payment integration (Israeli gateway) via Next.js API routes.
- **i18n** (nestjs-i18n on backend; `LanguageContext` on frontend).

## What Needs Work

- **Course board**: new surface; catalog, enrollment, and progress flows partially implemented.
- **Template / PDF stack consolidation**: several PDF-related libraries on frontend; reduce duplication and single-source HTML/PDF where possible.
- **Zustand sync after saves**: improved recently; keep monitoring race conditions between agent saves and editor state.
- **White-label**: theming works; production hardening (hiding dev-only UI, consistent assets) still in progress.
- **E2E coverage**: Playwright suites exist; breadth and flake resistance still a gap vs. ideal.

## Environments

| Layer | Typical hosting / port |
|-------|-------------------------|
| Backend (cv.ai) | **Azure App Service**; local dev often **8000** |
| Frontend (cvai-group) | **Vercel**; local **3000** |
| Agent (cv_ai_agent) | **Azure** LangGraph deployment; local **2024** (CLI) |
| Database | **MongoDB** (Atlas in prod) |
| Queue | **Redis** + **BullMQ** |
| Agent checkpoints | **PostgreSQL** (optional; MemorySaver fallback) |

## Integration rule (non-negotiable)

The browser **never** calls cv.ai directly for privileged operations: **Next.js `/api/*`** proxies add server-side secrets (`API_SECRET` / user JWT as designed per route).
