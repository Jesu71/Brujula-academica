# Checklist de evidencias que el equipo debe capturar

Esta lista evita presentar como ejecutadas herramientas o pruebas que solo están diseñadas.

## Tema y repositorio
- [ ] Aprobación del tema por el docente (correo, acta o evidencia solicitada en clase).
- [ ] Portada completada con integrantes y docente.
- [ ] Repositorio Git o carpeta con historial de cambios real y aportes individuales.

## Protégé / OWL
- [ ] Captura de la ontología `BrujulaAcademica.owl` abierta en Protégé.
- [ ] Captura del árbol de clases y de las propiedades de objeto/datos.
- [ ] Captura donde se vean dominios y rangos de propiedades seleccionadas.
- [ ] Captura de las restricciones de cardinalidad y existencia.
- [ ] Ejecutar HermiT u otro razonador compatible: capturar el resultado de consistencia.
- [ ] Capturar inferencias: `resourcePythonBasics` como `ProgrammingResource` y `BasicResource`, y `resourceSQLLab` como `ResourceForData`.
- [ ] Registrar la versión del editor y razonador.

## Neo4j / Cypher
- [ ] Captura del bloque de semilla ejecutado sin errores.
- [ ] Captura del grafo de nodos y relaciones.
- [ ] Captura de consulta 1 con `studentId = STU-001`.
- [ ] Captura de consulta 2 (recomendación no guardada directamente) con `studentId = STU-001`.
- [ ] Captura de consulta 3 con `advisorId = ADV-001`.
- [ ] Captura de conteos de nodos y relaciones.
- [ ] Registrar la versión de Neo4j y cualquier cambio de compatibilidad.

## Prototipo y servicios
- [ ] Abrir `prototipo/index.html` y recorrer panel, perfil, catálogo y vista de asesoría.
- [ ] Probar búsqueda, filtro, guardar y ocultar; capturar pantallas del prototipo.
- [ ] Validar `api/openapi.yaml` con un validador OpenAPI.
- [ ] Validar `api/brujula-academica.wsdl` en una herramienta WSDL/SOAP si se presenta como ejecutable.
- [ ] No describir rutas `example.org` como endpoints reales.

## Documento y presentación
- [ ] Documento revisado por el equipo y con citas de fuentes.
- [ ] Diagramas coherentes con la ontología y el grafo.
- [ ] Presentación ensayada dentro de los 20 minutos máximos.
- [ ] Todos los integrantes pueden explicar las decisiones principales.
