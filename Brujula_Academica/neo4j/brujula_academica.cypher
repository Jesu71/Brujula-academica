// BRÚJULA ACADÉMICA - conjunto de datos sintéticos para Neo4j 5.x
// Ejecutar primero restricciones y semilla; después ejecutar cada consulta por separado.
// No contiene datos reales de estudiantes ni información del sistema académico institucional.

// -----------------------------------------------------------------------------
// 0. Restricciones e índices
// -----------------------------------------------------------------------------
CREATE CONSTRAINT student_id_unique IF NOT EXISTS
FOR (n:Student) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT resource_id_unique IF NOT EXISTS
FOR (n:Resource) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT competency_id_unique IF NOT EXISTS
FOR (n:Competency) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT topic_id_unique IF NOT EXISTS
FOR (n:Topic) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT recommendation_id_unique IF NOT EXISTS
FOR (n:Recommendation) REQUIRE n.id IS UNIQUE;

// -----------------------------------------------------------------------------
// 1. Nodos de demostración
// -----------------------------------------------------------------------------
MERGE (:Student {id:'STU-001', name:'Ana Torres', semester:3, role:'student'});
MERGE (:Student {id:'STU-002', name:'Luis Rojas', semester:5, role:'student'});
MERGE (:Student {id:'STU-003', name:'Maya Pérez', semester:2, role:'student'});
MERGE (:AcademicProfile {id:'PRO-001', goal:'Fortalecer programación y lógica'});
MERGE (:AcademicProfile {id:'PRO-002', goal:'Practicar datos y servicios web'});
MERGE (:AcademicProfile {id:'PRO-003', goal:'Construir bases de desarrollo web'});
MERGE (:Advisor {id:'ADV-001', name:'María Gómez'});
MERGE (:Advisor {id:'ADV-002', name:'Carlos Díaz'});
MERGE (:Topic {id:'TOP-PROG', name:'Programación'});
MERGE (:Topic {id:'TOP-ALG', name:'Algoritmos'});
MERGE (:Topic {id:'TOP-DATA', name:'Datos'});
MERGE (:Topic {id:'TOP-WEB', name:'Desarrollo web'});
MERGE (:Topic {id:'TOP-API', name:'Servicios web'});
MERGE (:Competency {id:'COM-PY', name:'Python', proficiency:0.45, family:'programming'});
MERGE (:Competency {id:'COM-LOG', name:'Lógica', proficiency:0.40, family:'programming'});
MERGE (:Competency {id:'COM-SQL', name:'SQL', proficiency:0.30, family:'data'});
MERGE (:Competency {id:'COM-REST', name:'Diseño REST', proficiency:0.50, family:'api'});
MERGE (:Competency {id:'COM-JS', name:'JavaScript', proficiency:0.35, family:'programming'});
MERGE (:Resource {id:'RES-PY-01', title:'Python desde cero', level:'Básico', hours:4, modality:'Virtual', url:'#python'});
MERGE (:Resource {id:'RES-SQL-01', title:'Laboratorio visual de SQL', level:'Intermedio', hours:3, modality:'Virtual', url:'#sql'});
MERGE (:Resource {id:'RES-REST-01', title:'Guía práctica de API REST', level:'Básico', hours:2, modality:'Virtual', url:'#rest'});
MERGE (:Resource {id:'RES-ALG-01', title:'Retos de lógica y algoritmos', level:'Básico', hours:5, modality:'Mixta', url:'#algoritmos'});
MERGE (:Resource {id:'RES-WEB-01', title:'HTML y CSS accesible', level:'Básico', hours:3, modality:'Virtual', url:'#web'});
MERGE (:Course {id:'CRS-ALG-01', name:'Algoritmos y estructuras de datos'});
MERGE (:Recommendation {id:'REC-001', score:0.92, reason:'Coincide con el interés en programación y aborda una competencia por fortalecer.'});
MERGE (:Recommendation {id:'REC-002', score:0.86, reason:'Refuerza consultas de datos y ofrece práctica guiada.'});
MERGE (:Feedback {id:'FDB-001', rating:5, comment:'Explicación clara; datos ficticios.'});

// -----------------------------------------------------------------------------
// 2. Relaciones: perfiles, intereses, recursos, recomendaciones y retroalimentación
// -----------------------------------------------------------------------------
MATCH (s:Student {id:'STU-001'}), (p:AcademicProfile {id:'PRO-001'}) MERGE (s)-[:HAS_PROFILE]->(p);
MATCH (s:Student {id:'STU-002'}), (p:AcademicProfile {id:'PRO-002'}) MERGE (s)-[:HAS_PROFILE]->(p);
MATCH (s:Student {id:'STU-003'}), (p:AcademicProfile {id:'PRO-003'}) MERGE (s)-[:HAS_PROFILE]->(p);
MATCH (s:Student {id:'STU-001'}), (a:Advisor {id:'ADV-001'}) MERGE (s)-[:ASSIGNED_TO]->(a);
MATCH (s:Student {id:'STU-002'}), (a:Advisor {id:'ADV-002'}) MERGE (s)-[:ASSIGNED_TO]->(a);
MATCH (s:Student {id:'STU-003'}), (a:Advisor {id:'ADV-001'}) MERGE (s)-[:ASSIGNED_TO]->(a);
MATCH (p:AcademicProfile {id:'PRO-001'}), (t:Topic {id:'TOP-PROG'}) MERGE (p)-[:INTERESTED_IN]->(t);
MATCH (p:AcademicProfile {id:'PRO-001'}), (t:Topic {id:'TOP-ALG'}) MERGE (p)-[:INTERESTED_IN]->(t);
MATCH (p:AcademicProfile {id:'PRO-002'}), (t:Topic {id:'TOP-DATA'}) MERGE (p)-[:INTERESTED_IN]->(t);
MATCH (p:AcademicProfile {id:'PRO-002'}), (t:Topic {id:'TOP-API'}) MERGE (p)-[:INTERESTED_IN]->(t);
MATCH (p:AcademicProfile {id:'PRO-003'}), (t:Topic {id:'TOP-WEB'}) MERGE (p)-[:INTERESTED_IN]->(t);
MATCH (p:AcademicProfile {id:'PRO-001'}), (c:Competency {id:'COM-PY'}) MERGE (p)-[:HAS_COMPETENCY]->(c);
MATCH (p:AcademicProfile {id:'PRO-001'}), (c:Competency {id:'COM-LOG'}) MERGE (p)-[:HAS_COMPETENCY]->(c);
MATCH (p:AcademicProfile {id:'PRO-002'}), (c:Competency {id:'COM-SQL'}) MERGE (p)-[:HAS_COMPETENCY]->(c);
MATCH (p:AcademicProfile {id:'PRO-002'}), (c:Competency {id:'COM-REST'}) MERGE (p)-[:HAS_COMPETENCY]->(c);
MATCH (p:AcademicProfile {id:'PRO-003'}), (c:Competency {id:'COM-JS'}) MERGE (p)-[:HAS_COMPETENCY]->(c);
MATCH (r:Resource {id:'RES-PY-01'}), (t:Topic {id:'TOP-PROG'}) MERGE (r)-[:COVERS_TOPIC]->(t);
MATCH (r:Resource {id:'RES-PY-01'}), (c:Competency {id:'COM-PY'}) MERGE (r)-[:ADDRESSES_COMPETENCY]->(c);
MATCH (r:Resource {id:'RES-SQL-01'}), (t:Topic {id:'TOP-DATA'}) MERGE (r)-[:COVERS_TOPIC]->(t);
MATCH (r:Resource {id:'RES-SQL-01'}), (c:Competency {id:'COM-SQL'}) MERGE (r)-[:ADDRESSES_COMPETENCY]->(c);
MATCH (r:Resource {id:'RES-REST-01'}), (t:Topic {id:'TOP-API'}) MERGE (r)-[:COVERS_TOPIC]->(t);
MATCH (r:Resource {id:'RES-REST-01'}), (c:Competency {id:'COM-REST'}) MERGE (r)-[:ADDRESSES_COMPETENCY]->(c);
MATCH (r:Resource {id:'RES-ALG-01'}), (t:Topic {id:'TOP-ALG'}) MERGE (r)-[:COVERS_TOPIC]->(t);
MATCH (r:Resource {id:'RES-ALG-01'}), (c:Competency {id:'COM-LOG'}) MERGE (r)-[:ADDRESSES_COMPETENCY]->(c);
MATCH (r:Resource {id:'RES-WEB-01'}), (t:Topic {id:'TOP-WEB'}) MERGE (r)-[:COVERS_TOPIC]->(t);
MATCH (r:Resource {id:'RES-WEB-01'}), (c:Competency {id:'COM-JS'}) MERGE (r)-[:ADDRESSES_COMPETENCY]->(c);
MATCH (c:Course {id:'CRS-ALG-01'}), (skill:Competency {id:'COM-PY'}) MERGE (c)-[:REQUIRES_COMPETENCY]->(skill);
MATCH (r:Resource {id:'RES-PY-01'}), (c:Course {id:'CRS-ALG-01'}) MERGE (r)-[:SUPPLEMENTS]->(c);
MATCH (r:Resource {id:'RES-ALG-01'}), (c:Course {id:'CRS-ALG-01'}) MERGE (r)-[:SUPPLEMENTS]->(c);
MATCH (s:Student {id:'STU-001'}), (rec:Recommendation {id:'REC-001'}) MERGE (s)-[:RECEIVED]->(rec);
MATCH (rec:Recommendation {id:'REC-001'}), (r:Resource {id:'RES-PY-01'}) MERGE (rec)-[:SUGGESTS]->(r);
MATCH (rec:Recommendation {id:'REC-001'}), (c:Competency {id:'COM-PY'}) MERGE (rec)-[:BASED_ON]->(c);
MATCH (s:Student {id:'STU-002'}), (rec:Recommendation {id:'REC-002'}) MERGE (s)-[:RECEIVED]->(rec);
MATCH (rec:Recommendation {id:'REC-002'}), (r:Resource {id:'RES-SQL-01'}) MERGE (rec)-[:SUGGESTS]->(r);
MATCH (rec:Recommendation {id:'REC-002'}), (c:Competency {id:'COM-SQL'}) MERGE (rec)-[:BASED_ON]->(c);
MATCH (s:Student {id:'STU-001'}), (f:Feedback {id:'FDB-001'}) MERGE (s)-[:GAVE_FEEDBACK]->(f);
MATCH (f:Feedback {id:'FDB-001'}), (rec:Recommendation {id:'REC-001'}) MERGE (f)-[:ABOUT]->(rec);

// -----------------------------------------------------------------------------
// 3. CONSULTA 1: recomendaciones ya registradas para un estudiante
// Parámetro: :param studentId => 'STU-001'
// -----------------------------------------------------------------------------
MATCH (s:Student {id:$studentId})-[:RECEIVED]->(rec:Recommendation)-[:SUGGESTS]->(r:Resource)
OPTIONAL MATCH (rec)-[:BASED_ON]->(c:Competency)
RETURN s.name AS estudiante, r.title AS recurso, r.level AS nivel,
       r.hours AS horas_estimadas, rec.score AS puntaje,
       rec.reason AS explicacion, collect(c.name) AS competencias
ORDER BY puntaje DESC;

// -----------------------------------------------------------------------------
// 4. CONSULTA 2: recomendación inferida por interés temático y brecha de competencia
// Genera una asociación candidato-estudiante-recurso que NO está guardada previamente.
// Parámetro: :param studentId => 'STU-001'
// -----------------------------------------------------------------------------
MATCH (s:Student {id:$studentId})-[:HAS_PROFILE]->(p:AcademicProfile)-[:INTERESTED_IN]->(t:Topic)<-[:COVERS_TOPIC]-(r:Resource)
OPTIONAL MATCH (p)-[:HAS_COMPETENCY]->(c:Competency)<-[:ADDRESSES_COMPETENCY]-(r)
WITH s, p, r, collect(DISTINCT t.name) AS temas_coincidentes,
     collect(DISTINCT CASE WHEN c.proficiency < 0.60 THEN c.name ELSE null END) AS competencias_por_reforzar
WHERE NOT EXISTS {
  MATCH (s)-[:RECEIVED]->(:Recommendation)-[:SUGGESTS]->(r)
}
WITH s, r, temas_coincidentes, competencias_por_reforzar,
     (3.0 * size(temas_coincidentes) + 2.0 * size([x IN competencias_por_reforzar WHERE x IS NOT NULL])) AS scoreCalculado
RETURN s.name AS estudiante, r.title AS recomendacion_inferida,
       temas_coincidentes, [x IN competencias_por_reforzar WHERE x IS NOT NULL] AS competencias_por_reforzar,
       round(scoreCalculado / 10.0, 2) AS puntaje_relativo,
       'Coincide con intereses y puede reforzar una competencia por debajo de 0.60' AS explicacion
ORDER BY scoreCalculado DESC, r.hours ASC
LIMIT 5;

// -----------------------------------------------------------------------------
// 5. CONSULTA 3: resumen agregado para asesoría académica (no es un ranking personal)
// En un despliegue real se aplicará umbral mínimo de agregación para evitar reidentificación.
// Parámetro: :param advisorId => 'ADV-001'
// -----------------------------------------------------------------------------
MATCH (a:Advisor {id:$advisorId})<-[:ASSIGNED_TO]-(s:Student)-[:HAS_PROFILE]->(p:AcademicProfile)
MATCH (p)-[:INTERESTED_IN]->(t:Topic)
OPTIONAL MATCH (p)-[:HAS_COMPETENCY]->(c:Competency)
WITH a, t, count(DISTINCT s) AS estudiantesInteresados,
     avg(c.proficiency) AS dominioPromedio
RETURN a.name AS asesor, t.name AS tema,
       estudiantesInteresados, round(coalesce(dominioPromedio,0.0),2) AS dominioPromedio
ORDER BY estudiantesInteresados DESC, dominioPromedio ASC;

// -----------------------------------------------------------------------------
// 6. CONSULTA ADICIONAL: explicar relación entre un recurso, un curso y prerrequisitos
// -----------------------------------------------------------------------------
MATCH (r:Resource)-[:SUPPLEMENTS]->(c:Course)-[:REQUIRES_COMPETENCY]->(skill:Competency)
RETURN c.name AS curso, r.title AS recurso_preparatorio,
       skill.name AS competencia_requerida, r.level AS nivel_recurso
ORDER BY curso, recurso_preparatorio;

// -----------------------------------------------------------------------------
// 7. CONSULTAS DE VERIFICACIÓN PARA EVIDENCIAS
// -----------------------------------------------------------------------------
MATCH (n) RETURN labels(n) AS tipo, count(*) AS cantidad ORDER BY tipo;
MATCH ()-[r]->() RETURN type(r) AS relacion, count(*) AS cantidad ORDER BY cantidad DESC;
