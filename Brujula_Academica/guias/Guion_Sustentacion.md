# Guion sugerido para la sustentación (20 minutos máximo)

Adaptar los nombres y distribuirlo según cuántos integrantes tenga el equipo. Si hay menos de cuatro, combinar secciones. Todos deben comprender el proyecto completo.

## Distribución sugerida

| Tiempo | Responsable | Contenido |
|---|---|---|
| 0:00–2:30 | Integrante 1 | Contexto, problema, pregunta orientadora, objetivo y alcance. Aclarar que la solución apoya la orientación, pero no califica ni decide por el estudiante. |
| 2:30–5:00 | Integrante 1 o 2 | Usuarios y funcionalidades principales; por qué una solución web y por qué se necesita modelado semántico. |
| 5:00–8:00 | Integrante 2 | Arquitectura por capas, REST, persistencia y papel distinto de OWL y Neo4j. Mostrar los diagramas. |
| 8:00–10:30 | Integrante 2 o 3 | Metodología UWE, modelo conceptual y navegacional; recorrido corto del prototipo local. |
| 10:30–14:00 | Integrante 3 | Ontología: clases, propiedades, restricciones, preguntas de competencia e inferencias que se verificaron en Protégé. Mostrar evidencia real. |
| 14:00–17:00 | Integrante 4 | Grafo de Neo4j, Cypher 1-3 y ejemplo de recomendación inferida. Mostrar evidencia real. |
| 17:00–19:00 | Integrante 4 o 1 | Usabilidad, privacidad, límites, métricas y trabajo futuro. |
| 19:00–20:00 | Equipo | Conclusión y transición a preguntas. |

## Preguntas probables del docente

**¿Por qué no basta una base de datos relacional?**
Una base relacional puede almacenar las entidades, pero la ontología hace explícito un vocabulario formal y permite restricciones/clasificación semántica. El grafo facilita consultas por relaciones y caminos, como hallar un recurso que cubre un tema que interesa al estudiante aunque no se haya asociado directamente a una recomendación guardada.

**¿Cuál es la diferencia entre ontología y grafo de conocimiento?**
La ontología define las clases, propiedades, rangos, restricciones y semántica del dominio. El grafo Neo4j representa instancias y relaciones en una estructura consultable mediante Cypher. Se complementan; no son el mismo artefacto ni hacen exactamente la misma tarea.

**¿Qué significa una recomendación inferida?**
En esta propuesta, Cypher busca candidatos mediante una ruta entre el perfil del estudiante, un tema de interés y recursos que cubren ese tema; puede ponderar competencias por fortalecer y excluir recursos ya recomendados. Es una asociación derivada de un patrón, no una recomendación validada pedagógicamente ni una inferencia OWL.

**¿Cómo se verifica la consistencia de la ontología?**
Abrir el OWL en Protégé, ejecutar un razonador como HermiT y revisar el estado de consistencia y los tipos inferidos. La sustentación debe usar capturas reales obtenidas por el equipo.

**¿Por qué UWE?**
Porque obliga a separar requisitos, modelo conceptual, modelo navegacional y presentación, que son productos explícitos de la guía. Así es posible revisar coherencia antes de construir una aplicación completa.

**¿Por qué usar REST y mostrar SOAP?**
REST queda como interfaz principal para clientes web con recursos y JSON. SOAP/WSDL se incluye como ejercicio de interoperabilidad para un sistema legado que necesite mensajes XML y contrato formal de operaciones.

**¿Qué limitaciones tiene el recomendador?**
Las reglas iniciales son transparentes y heurísticas; no han sido entrenadas ni evaluadas con datos reales. Hay que evaluar pertinencia con expertos, cobertura, diversidad, sesgos, accesibilidad y resultados con usuarios antes de una puesta en producción.

**¿Cómo se protege la privacidad?**
La demostración solo usa datos sintéticos. En producción se necesitarían consentimiento, minimización, control de acceso por rol, retención limitada y agregación con umbrales para reducir reidentificación.

**¿Qué significa el puntaje 0.92 del prototipo?**
Es un valor ilustrativo del conjunto sintético, no una probabilidad calibrada ni una precisión observada. En producción se documentaría cómo se calcula y cómo se valida.

## Frase de cierre sugerida

“Brújula Académica no busca decidir por el estudiante, sino ayudarle a encontrar una siguiente actividad de aprendizaje y mostrar de manera transparente por qué esa actividad puede ser pertinente. La propuesta conecta el modelo conceptual, la navegación, los servicios web, la ontología OWL y el grafo Neo4j para representar y consultar ese conocimiento.”
