#!/bin/bash
# load-env.sh — Export .env vars into the shell for Terraform (the S3/Spaces backend reads
# AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY from the environment).
#
# Usage: source devops/scripts/load-env.sh [path/to/.env]
#
# Docker Compose / Next.js-only internals are skipped so they don't pollute the shell.

_LOAD_ENV_FILE="${1:-.env}"

if [[ ! -f "$_LOAD_ENV_FILE" ]]; then
  echo "load-env.sh: file not found: $_LOAD_ENV_FILE" >&2
  return 1 2>/dev/null || exit 1
fi

while IFS= read -r _line || [[ -n "$_line" ]]; do
  # Skip comments and blank lines
  [[ -z "$_line" || "$_line" == \#* ]] && continue
  _key="${_line%%=*}"
  # Skip Docker Compose internals
  [[ "$_key" == "COMPOSE_PROJECT_NAME" || "$_key" == "COMPOSE_PROFILES" ]] && continue
  export "$_key=${_line#*=}"
done < "$_LOAD_ENV_FILE"

unset _LOAD_ENV_FILE _line _key
