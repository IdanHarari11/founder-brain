# CV.Ai — Vision

## Mission

AI-powered resume platform that helps job seekers build world-class CVs and reach recruiters faster.

## Target Users

- **B2C**: Job seekers who want better CVs, faster iteration, and export-ready documents (PDF, templates, optional video/avatar).
- **B2B**: Recruiters / HR teams who want structured candidate data, consistent formats, and scalable intake (white-label and B2B paths).

## Revenue Model

Subscription tiers: **Plan1** (free) / **Plan2** (paid) / **Plan3** (premium), implemented via the plans/plan-gateway stack on the backend.

Upsell surfaces: AI section upgrades, video CVs, avatar generation, and higher-tier automation.

## Key Differentiators

- **Conversational AI agent** (LangGraph ReAct) guides users through CV creation with tool-backed saves and verification gates.
- **Per-section AI upgrade** with **SSE streaming** so the editor reflects progress without blocking the UI.
- **Multilingual** experience with Hebrew + English (RTL/LTR, locale-aware content).
- **Template system** (multiple templates) with **PDF export** aligned with backend rendering.
- **Video CV** and **avatar generation** as premium media differentiators.

## Stage

Live product. Active users. Ongoing feature development (courses, white-label polish, test hardening).

## Repos (source of truth)

| GitHub | Role |
|--------|------|
| [CV-AI-Group/cv.ai](https://github.com/CV-AI-Group/cv.ai) | NestJS API, jobs, PDF, media |
| [CV-AI-Group/cvai-group](https://github.com/CV-AI-Group/cvai-group) | Next.js app, editor, payments proxy |
| [CV-AI-Group/cv_ai_agent](https://github.com/CV-AI-Group/cv_ai_agent) | LangGraph agent server |
