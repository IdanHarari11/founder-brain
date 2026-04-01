# SOP: Feature Development Flow

## Overview
Standard flow from idea to merged PR.

## Steps

### 1. Define (Founder)
- Write feature note in Obsidian (use Feature Template)
- Include: goal, why, scope, non-goals, acceptance criteria

### 2. Plan (Planner Agent)
- Read feature note + product context
- Break into tasks
- Assign to agents
- Create issues in Paperclip

### 3. Implement (Backend/Frontend Agent)
- Pick up assigned task
- Read Agent Playbook for the product
- Create branch
- Write code following conventions
- Run preflight: lint, build, test
- Create PR

### 4. Review (QA Agent)
- Review PR against spec
- Verify build/test pass
- Check for breaking changes
- Approve or request changes

### 5. Merge (Founder)
- Final review
- Merge to main
- Verify deployment

### 6. Document (Planner or Founder)
- Update Current-State.md
- Update Backlog.md
- Close Paperclip issue
- Write postmortem if issues arose

## Rules
- Never skip Step 1 (define)
- Never merge without Step 4 (review)
- Always run preflight before PR
