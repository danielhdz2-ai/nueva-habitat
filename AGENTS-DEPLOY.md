# Despliegue NuevaHabitat (agentes Cloud)

## Repositorio que importa para Vercel

| Dónde | Repo | Rol |
|-------|------|-----|
| **Producción (Vercel)** | [nuevahabitat-ai/nuevahabitat](https://github.com/nuevahabitat-ai/nuevahabitat) rama `main` | Lo que ves en el dashboard (p. ej. commit `43c41d2` / `536a00b`) |
| **Este agente (Cursor)** | `danielhdz2-ai/nueva-habitat` | Mirror parcial; **push aquí no actualiza www.nuevahabitat.com** |

Los commits del agente **sí se hacen** en `danielhdz2-ai/nueva-habitat` (`main`/`master`). Vercel no los ve porque el proyecto **nuevahabitat** en Vercel está enlazado al otro GitHub.

### Para que sea automático como en tus otros proyectos

Una de estas dos (recomendada la 1):

1. **En Cursor**: lanzar el Cloud Agent sobre el repo `nuevahabitat-ai/nuevahabitat` (no el mirror `danielhdz2-ai/nueva-habitat`).
2. **En GitHub**: en `nuevahabitat-ai/nuevahabitat` → Settings → Collaborators, dar permiso **Write** a la app de Cursor / `cursor[bot]` (la misma que ya pushea en tus otros repos).

Tras eso, commit + push a `main` en ese repo = deploy Production en Vercel (como en tu captura).

### Sincronizar solo el panel desde este workspace

Si el agente sigue en el mirror pero ya hay permiso de push al repo de producción:

```bash
bash scripts/push-to-vercel-github.sh
```

## Git en el mirror (siempre)

1. Commit en `cursor/...-067f`.
2. `git push origin <rama>`.
3. `git push origin master:main` (mantiene el mirror al día).

## Hook Vercel (opcional)

Si no usas Git directo: GitHub secret `VERCEL_DEPLOY_HOOK` en el repo que Vercel construye, workflow `.github/workflows/vercel-production.yml`.
