#!/usr/bin/env bash
# Dispara deploy Production en Vercel vía Deploy Hook (Settings → Git → Deploy Hooks).
set -euo pipefail
HOOK="${NH_VERCEL_DEPLOY_HOOK:-${VERCEL_DEPLOY_HOOK:-}}"
if [[ -z "$HOOK" ]]; then
  echo "[nh-deploy] Sin hook de Vercel (NH_VERCEL_DEPLOY_HOOK). No se dispara deploy." >&2
  exit 0
fi
curl -fsS -X POST "$HOOK"
echo "[nh-deploy] Hook Vercel enviado."
