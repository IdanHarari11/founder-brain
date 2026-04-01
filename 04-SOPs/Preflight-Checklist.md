# SOP: Preflight Checklist

Before any PR or merge, verify:

## Backend (NestJS)
- [ ] `npm run lint` — no errors
- [ ] `npm run build` — compiles
- [ ] `npm run test` — passes (if tests exist)
- [ ] No new `any` types
- [ ] Swagger decorators on new endpoints
- [ ] No secrets in code

## Frontend (Next.js)
- [ ] `pnpm run lint` — no errors (or `npm run lint`)
- [ ] `pnpm run build` — builds (or `npm run build`)
- [ ] RTL layout correct
- [ ] Design system followed
- [ ] No direct backend calls from client
- [ ] No secrets in client code

## General
- [ ] Branch is up to date with main
- [ ] PR description is clear
- [ ] Acceptance criteria from spec are met
- [ ] No breaking changes (or documented)
