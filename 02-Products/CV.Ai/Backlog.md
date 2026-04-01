# CV.Ai — Backlog

## High Priority

- [ ] **Course board completion**: catalog, enrollment, progress tracking, and clear empty/loading/error states.
- [ ] **Template consolidation**: reduce overlapping PDF/react-pdf/puppeteer paths; document the single source of truth for template HTML vs PDF.
- [ ] **E2E test coverage**: expand Playwright scenarios for chat → save → SSE → editor refresh; reduce flakes.
- [ ] **White-label production hardening**: dev-only UI gated, theme QA per tenant, asset and SEO checks.

## Medium Priority

- [ ] **Resume comparison** (versions or “before/after AI”) for job seekers.
- [ ] **Batch resume generation** or structured export for recruiter/B2B workflows (with clear data contracts).
- [ ] **Advanced analytics** for users (conversion funnels, section completion, upgrade success).
- [ ] **Multi-language template support** beyond current en/he split where templates lag.

## Low Priority

- [ ] **WhatsApp integration** revival or explicit removal from codebase if permanently retired.
- [ ] **Firebase Functions** cleanup / docs clarifying Azure as primary deploy path.
- [ ] **BullBoard** UI: document exact path and secure/disable in production appropriately.
- [ ] **Dependency hygiene**: prune unused vector-store-related packages in agent if still unused.

## Technical debt (cross-cutting)

- [ ] Align **`.env.sample`** with all required keys (e.g. **ANTHROPIC_API_KEY** documented).
- [ ] Verify **AzureBlobModule** registration story in `app.module.ts` (lazy vs explicit import).
