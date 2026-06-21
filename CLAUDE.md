# CLAUDE.md

## Project Overview

Name: PROJECT NAME HERE
Main purpose: DESCRIPTION HERE

## Version Control

- Git repository with `.gitignore` excluding `.env`, build artifacts, and other non-source files.
- **Never merge directly to `main`, `develop`, or `stage`.** Always open a PR to those branches.
- Verify `gh` CLI is available before beginning any new project work.

## Containers

- Every service is containerized.
- A `docker-compose.yml` defines the full local stack.
- All local operations run through `docker compose up`.
- All tests, experiments, spikes run inside a container

## Secrets Management

- All API keys and tokens go in a `.env` file that is **never committed to git**.
- `.env` is listed in `.gitignore`.

## Infrastructure

- Non-local environments are managed on **k8s via Terraform**. These do not yet exist and will be created in a later Phase.

## Development Workflow

- **TDD red/green**: Write a failing test first, then make it pass, then refactor.
- **Plan mode**: When in plan mode, save accepted plans to `docs/<appropriate-name>.md`.
  - Only execute a plan after verifying it has been saved.
  - Read the plan from the in-repo `docs/` location before executing.

## Quality Standards

We value **thoughtfulness, accuracy, and thoroughness** over speed. In the long run, getting it right the first time saves more time than fixing mistakes.

### Verify before committing

- **Test commands locally first.** When you can, test things with common linux utilities. Example: Writing an API call? `curl` first.
- **Review the diff.** Read through `git diff` carefully before every commit — look for typos, wrong variable names, and unintended changes.
- **Validate YAML/config syntax.** For core code, SQL queries, GitHub Actions workflows, Terraform files, nginx configs, and other domain specific languages: validate syntax (lint) before pushing.

### Research before implementing

- **Check official docs for APIs, permissions, and CLI flags.** Do not assume behavior — verify it. Use `WebSearch`/`WebFetch` to confirm before writing code that depends on external tool behavior.
- **Understand the full execution path.** Before writing a CI/CD step, think through: What triggers it? What state exists at that point? What happens on success and failure? What are the edge cases (first run, concurrent runs, failed prior steps)?

### Logging

- use a standard log library for the language
- use common log levels: `info`, `warn`, `error`
  - DEBUG (diagnostic info)
  - INFO (normal operational milestones)
  - WARN (unexpected behavior)
  - ERROR (failed operations)
  - FATAL (severe failures)

### Documentation

- as developers on this project, it is our job to update documentation as we complete work
- include with PRs any relevant updates to README.md, CLAUDE.md, and memory

## Memory

- Claude Code memories for this project are stored **in-repo** at `memory/`.
- The `MEMORY.md` index and all memory files live under `memory/`.

## Project Structure

Basic structure at repo root:

- `.env` — local secrets (gitignored)
- `docker-compose.yml` — stack definition for local
- `data/` — local data files
- `devops/` — infrastructure, deployment, CI/CD configs
- `docs/` — project planning and other reference docs
- `src/` — application source code
- `tmp/` — scratch space (gitignored)
