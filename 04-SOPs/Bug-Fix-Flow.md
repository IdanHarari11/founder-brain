# SOP: Bug Fix Flow

## Steps

### 1. Report
- Document: what happened, expected behavior, steps to reproduce
- Check Known-Issues.md — is it already known?

### 2. Diagnose (Backend/Frontend Agent)
- Read error logs
- Identify root cause
- Check if it affects other areas

### 3. Fix
- Create branch
- Fix the issue
- Add test if possible
- Run preflight: lint, build, test

### 4. Review (QA Agent)
- Verify fix addresses root cause
- Check for regressions
- Run build/test

### 5. Merge & Close
- Merge PR
- Update Known-Issues.md
- Close issue

## Rules
- Never hotfix production without review
- Always add test for the bug if feasible
