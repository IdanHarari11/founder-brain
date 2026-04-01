# Colors — Agent Playbook

## Rules for AI Agents Working on Colors

### CRITICAL RULES
- Matching is ASYNC via BullMQ — NEVER compute matching synchronously
- HTTP endpoints: validate → persist → enqueue → return quickly
- UI reads from persisted MatchingResult — never call LLM in real time
- API + workers run in the SAME Azure App Service process

### Terminology (Strict)
- ✅ MarketplaceSearch, MatchingResult, compatibility, match, searchResults
- ❌ globalScore, bestCandidatesOverall, candidateRank, jobPosting

### DO
- Keep controllers thin, logic in services
- Use @UseGuards(JwtAuthGuard, RolesGuard) + @Roles() on protected routes
- Use @Public() for public routes
- Add @ApiOperation, @ApiResponse, @ApiTags to all endpoints
- Use routeLog(req, 'route/name', data) at start of controller methods
- Keep queue jobs idempotent (dedupe keys)
- Use .lean() on Mongoose read queries
- Run preflight: lint, test, build

### DON'T
- Call LLM in request handlers for matching results
- Show blocking spinners for matching — use progress stages
- Call backend directly from client components (always proxy via /api/*)
- Store tokens in component state (use localStorage for access, httpOnly cookie for refresh)
- Add endpoints that trigger expensive work per request
- Use any UI library other than shadcn/ui + Radix
- Mix icon libraries (Lucide React only)

### Definition of Done
- Build passes (both backend and frontend)
- Tests pass
- No linter errors
- Matching remains async
- API prefix: /api/v1
- Swagger decorators present

### Escalation
- Changing matching pipeline logic → founder
- Auth/security changes → founder
- Stripe/billing changes → founder
- New role creation → founder
