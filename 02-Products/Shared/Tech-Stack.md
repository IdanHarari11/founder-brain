# Shared Tech Stack

## Frontend
- Next.js 15 (App Router)
- React 18/19
- TypeScript
- Tailwind CSS
- shadcn/ui (Radix UI)
- Framer Motion
- react-hook-form + Zod
- Zustand (cvai-group) / hooks (colors-frontend)

## Backend
- NestJS 10/11
- TypeScript
- MongoDB (Mongoose)
- Redis + BullMQ
- JWT + refresh tokens
- class-validator / class-transformer

## AI
- Anthropic Claude (primary)
- OpenAI GPT-4o
- Vercel AI SDK
- LangGraph (cv_ai_agent)

## Infrastructure
- GitHub (CV-AI-Group org)
- Azure App Service (backends)
- Vercel (frontends)
- MongoDB Atlas
- Redis Cloud
- Cloudinary (images)

## Shared Patterns
- API proxy: Frontend never calls backend directly — all via /api/* routes
- Auth: JWT access + httpOnly refresh token
- Hebrew (RTL) as primary UI language
- Guards: JwtAuthGuard + RolesGuard
- Swagger documentation on all endpoints
