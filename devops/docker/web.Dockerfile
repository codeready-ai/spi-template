# syntax=docker/dockerfile:1
#
# gym-up web (Next.js 15) production image.
# Multi-stage (base -> deps -> build -> production), pinned to the repo's Node version, and built
# from the MONOREPO ROOT (this is a pnpm workspace). Build it with the repo root as context:
#
#   docker build -f devops/docker/web.Dockerfile \
#     --build-arg NEXT_PUBLIC_SUPABASE_URL=... \
#     --build-arg NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=... \
#     --build-arg NEXT_PUBLIC_APP_URL=https://gym-up.honeycombstudio.io \
#     -t gym-up-web .
#
# NEXT_PUBLIC_* are build-time only (Next inlines them into the client bundle). Server-only secrets
# (SUPABASE_SECRET_KEY, VAPID_*, DO_SPACES_*, OAuth secrets) are injected at RUNTIME via the k8s
# Secret/ConfigMap (see devops/terraform/modules/gym-up-environment) — never baked into the image.

# --- base: pinned Node + pnpm, shared by deps and build ----------------------------------------
FROM node:20.18.1-alpine AS base
WORKDIR /app
USER nextjs
EXPOSE 3000
CMD ["node", "apps/web/server.js"]
