# coding: UTF-8

levels = Level.create([
  { id: 1, name: 'Apertura', tag: 'aper' },
  { id: 2, name: 'Problematización', tag: 'prob' },
  { id: 3, name: 'Información', tag: 'info' },
  { id: 4, name: 'Aplicación', tag: 'aplic' },
  { id: 5, name: 'Cierre', tag: 'cierr' },
  ])

quizes = Quiz.create([
  { level_id: 1, 
    question: 'Comente libremente cuáles son sus expectativas con respecto al curso.', 
    instant_feedback: '' },
  { level_id: 2, 
    question: '¿Porqué Isabel toma esta decisión en el acto 1?', 
    instant_feedback: '' },
  { level_id: 2, 
    question: '¿Porqué Isabel toma esta decisión en el acto 3?', 
    instant_feedback: '' },
  { level_id: 2, 
    question: 'Comparando ambas respuestas. ¿Cuál es el cambio interno que experimenta Isabel?', 
    instant_feedback: '' },
  { level_id: 2, 
    question: 'Desarrolle un acto 2 escrito en primera persona (como si usted fuera Isabel) que haga coherente su proceso de cambio', 
    instant_feedback: '' },
  { level_id: 3, 
    question: 'En términos generales ¿Qué concluye sobre los cambios generacionales que se han producido en torno a la sexualidad y afectividad?', 
    instant_feedback: '' },
  { level_id: 3, 
    question: '¿Qué puede decir sobre las fuentes con que las personas nos informamos sobre fenómenos relacionados a la sexualidad y afectividad?', 
    instant_feedback: '' },
  { level_id: 3, 
    question: '¿En qué consiste el concepto de Sexualidad Protegida?', 
    instant_feedback: '' },
  { level_id: 3, 
    question: '¿Cuál es su opinión sobre la abstinencia como objetivo para la educación sexual?', 
    instant_feedback: '' },
  { level_id: 3, 
    question: '¿Qué elementos del momento informativo le han sido útiles para comprender mejor a Isabel?', 
    instant_feedback: '' },
  { level_id: 4, 
    question: '¿Porqué Isabel toma esta decisión en el acto 1?', 
    instant_feedback: '' },
  { level_id: 4, 
    question: '¿Porqué Isabel toma esta decisión en el acto 3?', 
    instant_feedback: '' },
  { level_id: 4, 
    question: 'Comparando ambas respuestas ¿Cuál es el cambio interno que experimenta Isabel?', 
    instant_feedback: '' },
  { level_id: 4, 
    question: 'Desarrolle un acto 2 escrito en primera persona (como si usted fuera Isabel) que haga coherente su proceso de cambio', 
    instant_feedback: '' },
  { level_id: 5, 
    question: 'Comparando su primera y segunda resolución del Caso de Aprendizaje. ¿Qué aprendizajes personales identifica?', 
    instant_feedback: '' },
  { level_id: 5, 
    question: 'Comente libremente como evalúa la experiencia de haber realizado este curso.', 
    instant_feedback: '' }
  ])
  
topics = Topic.create([
  { name: "Hablemos de cualquier cosa", abstract: "En este foro se puede conversar de los temas que le interese con sus compañeros(as)." },
  { name: "Hablemos de sexualidad y afectividad", abstract: "Este foro es para conversar sobre sexualidad, afectividad y temas relacionados con el curso." },
  { name: "Soporte Técnico", abstract: "¿Problemas con el curso? Coméntelas aquí y buscaremos una solución." }
  ])  
