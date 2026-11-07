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

### Desde el agente (VM)

Si existe la variable `NH_VERCEL_DEPLOY_HOOK` en los secretos del entorno Cursor, ejecutar:

```bash
bash scripts/trigger-vercel-production.sh
```

Tras cada push a `main`.
