# Migración segura a Vercel — Estancia Sol & Luna

Fecha de inicio: 2026-10-11
Rama de trabajo: feature/vercel-migration
Respaldo del código: backup/pre-vercel-2026-10-11
Producción: SIN CAMBIOS

## Hallazgos verificados
- Aplicación Next.js 16 con Vinext y adaptador Cloudflare Workers.
- Base de datos D1 (binding DB), archivos R2 (binding BUCKET).
- El API /api/records lee y escribe registros por owner (ID de usuario ChatGPT).
- La autenticación actual depende de encabezados oai-authenticated-user-id/email suministrados por el hosting original.
- La interfaz llama a /api/initialize y muestra importes de alquiler predeterminados.
- Los comprobantes se comparten mediante Web Share o portapapeles y se imprimen desde el navegador.
- No hay vercel.json en main.

## Bloqueadores antes de desplegar
1. Exportar y verificar copia completa de D1 (esquema y datos) y R2 (objetos y metadatos); el respaldo de Git NO contiene estos datos.
2. Definir proveedor de autenticación seguro para Vercel. Nunca confiar en encabezados oai-* enviados directamente por clientes.
3. Diseñar traslado de D1 a base SQL compatible (por ejemplo PostgreSQL) y de R2 a almacenamiento de objetos; preservar los IDs de owner y asociaciones.
4. Inspeccionar /api/initialize para evitar inserciones duplicadas o datos de ejemplo al arrancar.
5. Revisar validación y escape HTML de comprobantes antes de publicar una URL accesible.
6. Probar restauración desde respaldos en entorno aislado.
7. Solo entonces configurar despliegue Preview en Vercel, sin tocar producción.

## Reglas de protección
- No modificar main ni la rama backup.
- No borrar ni migrar datos reales antes de contar con copias verificadas.
- No registrar credenciales ni datos de inquilinos en el repositorio.
- Validar lectura, escritura, archivos, autenticación, recibos y totales financieros en Preview.
- Solicitar aprobación explícita antes de promover a producción.

## Próximo paso
Identificar y obtener respaldos verificables de los recursos Cloudflare D1/R2 mediante el entorno propietario; preparar después una adaptación de autenticación y persistencia en esta rama.
