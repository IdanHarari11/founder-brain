# Security Rules (All Products)

## Authentication
- Never bypass OTP/SMS verification in production
- Never expose JWT secrets to client
- Never store tokens in component state or context
- Refresh tokens must be httpOnly cookies only
- Access tokens in localStorage (client) + httpOnly cookie (middleware)

## Agent Security
- Agents must NOT have production deploy access
- Agents must NOT merge to main without human review
- Agents must NOT modify secrets or environment variables
- Agents must NOT bypass authentication flows
- E2E test mode (OTP bypass) is ONLY for test environments

## Code Security
- Never commit .env files
- Never log secrets, tokens, or passwords
- Never expose internal error details to clients
- Always validate input at API boundaries (DTOs)
- Use parameterized queries (Mongoose handles this)

## Escalation
- Any security-related code change → founder review required
