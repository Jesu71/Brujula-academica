# Brújula Académica — Proyecto Final de Ingeniería Web

**Versión:** 1.0 · **Periodo:** 2620 · **Estado del tema:** propuesta pendiente de aprobación docente.

## Qué es este paquete

Brújula Académica es una propuesta de plataforma web semántica que recomienda recursos académicos a partir de intereses, competencias por fortalecer, nivel, modalidad y tiempo estimado. Las personas, perfiles, puntuaciones y recursos de ejemplo son sintéticos.

La propuesta no es un sistema institucional productivo: no autentica usuarios, no consulta calificaciones y no toma decisiones académicas de alto impacto.

## Archivos principales

- `documento/Documento_Tecnico_Brujula_Academica.docx` — documento técnico editable.
- `documento/Documento_Tecnico_Brujula_Academica.pdf` — versión para lectura/impresión.
- `presentacion/Presentacion_Brujula_Academica.pptx` — presentación para sustentación.
- `prototipo/index.html` — prototipo navegable sin dependencias, abrirlo en el navegador.
- `ontologia/BrujulaAcademica.owl` — ontología OWL en RDF/XML para Protégé.
- `neo4j/brujula_academica.cypher` — restricciones, datos sintéticos y consultas Cypher.
- `api/openapi.yaml` — contrato REST de referencia.
- `api/brujula-academica.wsdl` — ejemplo conceptual de SOAP/WSDL.
- `api/soap-request-example.xml` — solicitud SOAP de ejemplo.
- `diagramas/` — diagramas en PNG, DOT y Mermaid.
- `guias/` — checklist de evidencias y guía de sustentación.

## Orden de trabajo sugerido antes de entregar

1. Solicitar aprobación del tema al docente. La guía institucional señala que debe aprobarse antes de iniciar el desarrollo detallado.
2. Completar los nombres de integrantes y docente, y revisar con el equipo el alcance planteado.
3. Abrir y probar `prototipo/index.html` localmente.
4. Abrir el OWL en Protégé, ejecutar un razonador y guardar evidencia real de consistencia e inferencias.
5. Ejecutar el script Cypher en una instancia de Neo4j, revisar las consultas y guardar las capturas reales.
6. Validar los contratos OpenAPI/WSDL con herramientas compatibles antes de afirmar que se ejecutan como servicios.
7. Crear o actualizar el repositorio del equipo y registrar aportes reales de cada persona.
8. Ajustar y ensayar la presentación para no superar 20 minutos.

## Importante sobre la evidencia

Las evidencias de ejecución en Protégé y Neo4j **no están falsificadas ni se presentan como ya realizadas**. Se incluyen instrucciones y artefactos preparados; el equipo debe ejecutar las herramientas y adjuntar capturas auténticas. La evaluación heurística del prototipo es una inspección inicial del diseño, no una prueba con participantes.

## Dependencias externas de demostración

El prototipo HTML funciona sin internet. Protégé y Neo4j son aplicaciones aparte. Las rutas `https://example.org/...` de OpenAPI y WSDL son marcadores documentales, no endpoints productivos.
