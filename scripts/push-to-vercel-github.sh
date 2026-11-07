#!/usr/bin/env bash
# Copia admin-panel.html al repo que Vercel despliega (nuevahabitat-ai/nuevahabitat) y hace push a main.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROD_REPO="${NH_VERCEL_GITHUB_REPO:-nuevahabitat-ai/nuevahabitat}"
BRANCH="${NH_VERCEL_GITHUB_BRANCH:-main}"
WORKDIR="${TMPDIR:-/tmp}/nh-prod-push"
rm -rf "$WORKDIR"
git clone --depth 1 -b "$BRANCH" "https://github.com/${PROD_REPO}.git" "$WORKDIR"
cp "$ROOT/admin-panel.html" "$WORKDIR/admin-panel.html"
cd "$WORKDIR"
if git diff --quiet admin-panel.html; then
  echo "[nh-deploy] Sin cambios en admin-panel.html respecto a ${PROD_REPO}@${BRANCH}"
  exit 0
fi
git add admin-panel.html
git commit -m "${NH_COMMIT_MSG:-fix(admin): panel CRM desde agente Cloud}"
git push origin "HEAD:${BRANCH}"
echo "[nh-deploy] Push a https://github.com/${PROD_REPO} (${BRANCH}). Vercel desplegará en ~1-2 min."
