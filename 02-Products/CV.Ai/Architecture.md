# CV.Ai — Architecture

## System Overview

```text
User → cvai-group (Next.js)
         ├─ /api/*           → proxy → cv.ai (NestJS)     [resume, auth, media, plans…]
         └─ /api/langgraph/* → proxy → cv_ai_agent (LangGraph server)
```

Optional: **cv_ai_agent** calls **cv.ai** with **Bearer `RESUME_API_KEY`** for resume tools (server-to-server).

## Backend (cv.ai)

- **~36 NestJS modules** (feature-sliced: resumes, queue, sse, plans, auth, media, etc.).
- **MongoDB** via **Mongoose**; schemas use **`timestamps: true`** consistently.
- **BullMQ + Redis** for async AI upgrades, PDF, and heavy jobs.
- **AI**: Vercel AI SDK and related providers; unified access via **`ai-model-gateway`** (Anthropic, OpenAI, Gemini).
- **PDF**: **Puppeteer** (server-side generation paths).
- **Storage**: **Azure Blob** for assets (verify module wiring in `app.module` when changing storage).
- **Auth**: JWT + Google OAuth + Twilio OTP; rate limits on sensitive routes (e.g. SSE).
- **SSE**: dedicated module exposing upgrade streams consumed by the frontend proxy.

## Frontend (cvai-group)

- **Next.js 15** App Router.
- **Zustand** (`resume-store`): sections map (raw / en / he), per-section upgrade progress, `userUuid`, `threadId`.
- **SSE client** via Next route **`/api/resumes/upgrade-content/stream`** → backend stream.
- **react-pdf** and additional PDF utilities (consolidation opportunity).
- **White-label**: `WhiteLabelContext` + domain/param detection for B2B themes.
- **Payments**: Tranzila routes under `app/api/payments/*`.

## Agent (cv_ai_agent)

- **LangGraph** `StateGraph` with **`CVBuilderAnnotation`** (stage, phone verification, saved sections, messages).
- **11 tools**: resume update/evaluate/upgrade/upload/snapshot, Twilio OTP send/verify, template list/preview APIs, local template list, etc. (see repo `TOOLS` export).
- **PostgreSQL** checkpointing with **MemorySaver** fallback if DB unavailable.
- **System prompt** encodes stage machine: greeting → phone verification → section collection → completion.

## Data Flow (Section Upgrade)

1. User speaks with agent; agent collects validated section payload.
2. Agent calls **`resume_update_section`** (phone must be verified) → **cv.ai** `POST` section management.
3. Backend **persists** to MongoDB and **enqueues** BullMQ job for that section processor.
4. Processor runs **AI upgrade**; emits events through **SSE service**.
5. Frontend **SSE** receives events and updates **Zustand** `sectionProgress` / snapshot.
6. User sees live preview progress without blocking the main thread on long model calls.

## Plans / monetization (technical)

- **plans** / **plan-gateway** gate features by subscription tier (Plan1 / Plan2 / Plan3).
- Payment UX lives primarily on **cvai-group**; backend enforces entitlements on protected operations.
