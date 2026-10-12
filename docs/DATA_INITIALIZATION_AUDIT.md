# Auditoría de inicialización de datos

## Comportamiento observado
El dashboard ejecuta POST /api/initialize al abrirse. Esa ruta inserta registros predeterminados con INSERT OR IGNORE para cada usuario autenticado:
- Mano de obra del 10 y 11 de septiembre de 2026.
- Nombres de inquilinos de apartamentos 1, 2, 4, 5 y 9.

Aunque INSERT OR IGNORE evita repetir claves existentes, puede añadir movimientos faltantes automáticamente y alterar totales al abrir la aplicación. La migración no debe reproducir este comportamiento sin una decisión explícita y sin respaldos.

## Corrección planificada (no aplicada aún)
1. Separar creación de esquema, importación histórica y uso cotidiano del dashboard.
2. Convertir la importación inicial en una operación administrativa única, auditada e idempotente.
3. Hacer que la pantalla inicial únicamente consulte los registros; nunca que genere movimientos financieros.
4. Verificar el total histórico antes y después de migrar.
5. Mantener compatibilidad de los identificadores existentes y relaciones con adjuntos.

## Seguridad
No copiar datos de producción a repositorios ni registros públicos. Validar copia D1/R2 antes de modificar endpoints productivos.
