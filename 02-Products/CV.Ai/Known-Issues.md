# CV.Ai — Known Issues

Cross-repo reminders; confirm in code before treating as “fixed.”

## cv.ai (backend)

- **`AzureBlobModule`** may not be listed in `app.module.ts` imports — verify whether registration is lazy or via another import path before assuming blob features are wired.
- **`ANTHROPIC_API_KEY`** is used in code but has been **missing from `.env.sample`** — add and document for new devs.
- **Firebase Functions** deployment exists in repo but **Azure App Service** is the primary production path; avoid double-maintenance without a decision.
- **`whatsapp` module** appears **legacy / unused** — either remove or document if revived.
- **SSE**: a comment in `resumes.module.ts` once claimed SSE was removed; **SSE lives in the `sse` module** — comment may be outdated; fix when touching that file.
- **BullBoard** UI: exact public path and production lockdown **undocumented** — treat as ops debt.
- **`E2E_TEST_MODE`**: OTP bypass for tests only — **must never be enabled in production**.

## cvai-group (frontend)

- **Multiple PDF libraries** (`react-pdf`, `jspdf`, `pdfjs-dist`, `puppeteer-core`, etc.) — consolidation and bundle-size impact.
- **Editor auth**: verify **middleware / server session** coverage for `/users/[slug]/edit` on an ongoing basis.
- **White-label**: ensure **WhiteLabelTester** and similar dev tools are **not** visible in production builds.

## cv_ai_agent

- **Phone verification** is a **hard gate** — misconfigured Twilio or wrong **`RESUME_API_KEY`** blocks all saves; first check when debugging “agent won’t save.”
- **Lint / tsc**: run from **repo root** with **pnpm** per docs; **`npx tsc` at monorepo root** is not the supported path.
- **Unused heavy deps** (vector DB clients, etc.) may still be installed — periodic cleanup.

## Security / config hygiene

- Rotate and scope **API secrets** per environment; never commit real `.env` files.
- Keep **CORS** and **ALLOWED_ORIGINS** aligned between cv.ai and cvai-group deployments.
