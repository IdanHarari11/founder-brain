# CV.Ai — Agent Playbook

Rules for AI coding agents (and humans) working across **cv.ai**, **cvai-group**, and **cv_ai_agent**.

## DO

- Follow existing **NestJS** module layout: `module` / `controller` / `service` / `schema` / `dto`.
- Use **class-validator** (and **class-transformer** where already used) on DTOs; keep validation at the boundary.
- Add **`@ApiOperation`** and **`@ApiResponse`** on new **cv.ai** HTTP endpoints (Swagger in non-prod).
- Prefer **`.lean()`** on Mongoose read queries that return plain objects to callers.
- Keep **controllers thin** — orchestration only; business logic in **services**.
- Use **BullMQ** for AI, parsing, PDF, or any work that can exceed HTTP timeouts.
- Respect the **frontend proxy pattern**: no new “call cv.ai from the browser with secrets” flows.
- For **cv_ai_agent**: preserve **phone verification** before saves; batch section saves when the prompt allows.
- Run verification per repo:
  - **cv.ai**: `npm test`, `npm run typecheck`, `npm run build`, `npm run lint`
  - **cvai-group**: `pnpm test` (if scoped), `pnpm run typecheck`, `pnpm build`, `pnpm lint`
  - **cv_ai_agent**: `pnpm lint` and per-app checks from repo root (see repo `CLAUDE.md`)
- Honor the **SSE contract**: `upgrade_started` → `progress` → `upgrade_completed` | `upgrade_error` (+ `snapshot` where emitted).

## DON'T

- **Break** the resume **section schema** contracts consumed by the agent and templates without a coordinated migration.
- **Change auth** (JWT shape, refresh rotation, OAuth callbacks, OTP) without explicit approval and cross-repo updates.
- Add new AI vendors **outside** **`ai-model-gateway`** on cv.ai.
- **Rename** SSE event types or payloads without updating **cvai-group** proxy and **Zustand** handlers.
- **Skip** phone verification in **production** (no global bypass flags).
- **Ship** without PR review for anything touching payments, auth, or PII.
- Use **`any`** when a precise type or generic is available; prefer shared types or DTO classes.

## Definition of Done

- Build passes (`npm run build` / `pnpm build` as appropriate).
- Tests pass (`npm test` / Playwright where relevant).
- No new linter errors (`npm run lint` / `pnpm lint`).
- API contracts **unchanged** or **documented** (Swagger + frontend types if applicable).
- New endpoints have Swagger decorators and sensible error mapping via global filters.

## Escalation (founder / tech lead)

- **MongoDB schema** migrations or backward-incompatible JSON shapes → escalate.
- **Auth / security** changes → escalate.
- **Payments / Tranzila / plan entitlements** → escalate.
- **Agent prompt or tool schema** changes that affect user-facing behavior → review with product owner.

## Repo-specific reminders

- **cv_ai_agent**: PostgreSQL optional locally; checkpoint fallback changes behavior — document in PR if touched.
- **cvai-group**: never expose `API_SECRET` to the client; keep keys in server routes only.
