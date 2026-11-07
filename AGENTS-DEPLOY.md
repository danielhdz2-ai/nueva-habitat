# Despliegue NuevaHabitat (agentes Cloud)

## GitHub (siempre)

Tras cambios en `admin-panel.html` o el sitio Vercel:

1. Commit en rama `cursor/...-067f`.
2. `git push origin <rama>`.
3. Fusionar en `master` y `main`: `git push origin master:main`.

## Vercel Production

El proyecto **nuevahabitat** en Vercel despliega desde la rama **`main`** del repositorio que tenga enlazado en Vercel (hoy suele ser un `main` distinto al mirror `danielhdz2-ai/nueva-habitat` en GitHub hasta que se unifiquen).

Para que los commits del agente lleguen a Production, el proyecto Vercel debe usar **este** repositorio y la rama `main`, con el árbol completo del sitio (landings, `api/`, `scripts/`, etc.), no solo el mirror antiguo de Firebase.

### Automático vía GitHub Actions

Configurar **una vez** en GitHub → Settings → Secrets → Actions:

- `VERCEL_DEPLOY_HOOK`: URL del Deploy Hook (Vercel → Project → Settings → Git → Deploy Hooks → Production).

Cada push a `main` dispara el hook.

### Desde el agente (VM) — CLI

Secretos en Cursor (formulario seguro, no en el chat): `NH_VERCEL_TOKEN` (obligatorio), opcional `NH_VERCEL_ORG_ID`, `NH_VERCEL_PROJECT_ID`, `NH_VERCEL_DEPLOY_HOOK`.

```bash
bash scripts/vercel-deploy-production.sh   # vercel deploy --prod
bash scripts/trigger-vercel-production.sh  # solo hook
```

`vercel login` por OAuth no se completa solo en el agente (falta autorizar GitHub en el navegador).
