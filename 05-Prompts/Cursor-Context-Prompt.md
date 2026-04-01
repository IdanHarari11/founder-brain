# Cursor Context Prompt

When working with Cursor on a specific product, start with this:

---

## For CV.Ai:
```
Use context from the founder-brain knowledge base:
- 02-Products/CV.Ai/Architecture.md
- 02-Products/CV.Ai/Current-State.md
- 02-Products/CV.Ai/Agent-Playbook.md

Goal: [describe the feature/fix]

Constraints:
- Follow existing NestJS patterns
- Use BullMQ for heavy processing
- Don't break SSE event contracts
- Run lint + build + test before PR
```

## For Colors:
```
Use context from the founder-brain knowledge base:
- 02-Products/Colors/Architecture.md
- 02-Products/Colors/Current-State.md
- 02-Products/Colors/Agent-Playbook.md

Goal: [describe the feature/fix]

Constraints:
- Matching must be async (BullMQ)
- Never call LLM in request handlers
- Use shadcn/ui only
- Proxy all API calls via /api/*
- Run lint + build + test before PR
```
