#!/usr/bin/env bash
# Deploy Production en Vercel con CLI (requiere NH_VERCEL_TOKEN en el entorno del agente).
set -euo pipefail
cd "$(dirname "$0")/.."
TOKEN="${NH_VERCEL_TOKEN:-${VERCEL_TOKEN:-}}"
if [[ -z "$TOKEN" ]]; then
  echo "[vercel-deploy] Falta NH_VERCEL_TOKEN (Cursor → Environment → Secrets)." >&2
  exit 1
fi
export VERCEL_ORG_ID="${NH_VERCEL_ORG_ID:-${VERCEL_ORG_ID:-}}"
export VERCEL_PROJECT_ID="${NH_VERCEL_PROJECT_ID:-${VERCEL_PROJECT_ID:-}}"
if [[ ! -d .vercel ]]; then
  npx vercel@39 link --yes --token "$TOKEN" --project nuevahabitat 2>/dev/null \
    || npx vercel@39 link --yes --token "$TOKEN"
fi
npx vercel@39 pull --yes --environment=production --token "$TOKEN"
npx vercel@39 deploy --prod --yes --token "$TOKEN"
