# CV.Ai — Release Plan

Living document for near-term product and engineering focus across **cv.ai**, **cvai-group**, and **cv_ai_agent**.

## Current Sprint Focus

1. **Course board MVP**: minimal catalog + enrollment/progress happy path; align API with frontend routes.
2. **Zustand store sync**: verify editor state after agent saves and SSE completion; add regression tests where feasible.
3. **Template system stability**: fewer surprises between preview HTML, react-pdf, and Puppeteer PDF output.

## Next Sprint

1. **E2E coverage expansion**: critical flows (login, upgrade stream, payment smoke in test mode only).
2. **White-label production readiness**: tenant-specific QA, remove dev artifacts, document rollout.
3. **Performance**: SSE connection lifecycle, large resume payloads, and BullMQ job concurrency tuning.

## Release Checklist (each train)

- [ ] **All tests pass** (unit + targeted E2E per change).
- [ ] **Build succeeds** (cv.ai + cvai-group + agent if agent changed).
- [ ] **No new linter errors** (or waived with ticket reference).
- [ ] **API contracts** unchanged or **versioned** / documented (Swagger + frontend).
- [ ] **Environment variables** documented in `.env.sample` / deployment notes.
- [ ] **Staging** verified: resume upgrade SSE, PDF download, auth refresh, payments in test mode.
- [ ] **Observability**: check logs for new noisy errors; Sentry (if enabled) clean on smoke path.

## Deployment notes

- **cv.ai**: Azure App Service; ensure **Redis** and **Mongo** connectivity after config changes.
- **cvai-group**: Vercel; confirm **`API_URL`**, **`API_SECRET`**, and **`LANGGRAPH_API_URL`** for the target environment.
- **cv_ai_agent**: LangGraph/Azure endpoint must match frontend **`NEXT_PUBLIC_`** / server proxy configuration.

## Post-release

- Monitor **BullMQ** failed jobs and **SSE** error rates for 24–48h after deploy.
- Capture **user-reported** template/PDF mismatches as tickets with sample UUID (redacted PII).
