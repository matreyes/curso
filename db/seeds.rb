# coding: UTF-8

levels = Level.create([
  { id: 1, sequence: 1, name: 'Apertura', tag: 'aper' },
  { id: 2, sequence: 2, name: 'Problematización', tag: 'prob' },
  { id: 3, sequence: 3, name: 'Información', tag: 'info' },
  { id: 4, sequence: 4, name: 'Aplicación', tag: 'aplic' },
  { id: 5, sequence: 5, name: 'Cierre', tag: 'cierr' },
  ])

quizes = Quiz.create([
  { level_id: 1, sequence: 1, question: '¿Qué dilema logra identificar en el título de la unidad? ¿Qué le sugiere?', instant_feedback: 'Felicitaciones, con este ejercicio hemos terminado el momento de Apertura, éste tiene como propósito que usted conozca el dilema sobre el que trabajaremos, el objetivo de la unidad y el método de trabajo. Ahora vamos a pasar al segundo momento de la unidad de aprendizaje, la Problematización.' },
  { level_id: 2, sequence: 2, question: '¿Porqué Isabel toma esta decisión en el acto 1?', instant_feedback: 'La idea de este ejercicio es que usted haya intentado comprender la decisión de Isabel en el acto uno sin juzgarla. Si lo hizo así ¡felicitaciones! Sino ¡felicitaciones también! Recuerde que estamos en el momento de problematización, no hay respuestas correctas.' },
  { level_id: 2, sequence: 3, question: '¿Porqué Isabel toma esta decisión en el acto 3?', instant_feedback: 'A veces tendemos a pensar que la decisión de Isabel en el acto tres es LA decisión correcta. Sin embargo es una posibilidad entre muchas. Recuerde, el acto tres no es un modelo único de comportamiento.' },
  { level_id: 2, sequence: 4, question: 'Comparando ambas respuestas. ¿Cuál es el cambio interno que experimenta Isabel?', instant_feedback: 'Preguntarnos por el cambio interno de Isabel nos ayudará a resolver el siguiente ejercicio' },
  { level_id: 2, sequence: 5, question: 'Desarrolle un acto 2 escrito en primera persona (como si usted fuera Isabel) que haga coherente su proceso de cambio', instant_feedback: '¡Felicitaciones! usted ha terminado exitosamente el segundo momento de la unidad de aprendizaje, la Problematización. En éste, ha resuelto el caso de aprendizaje de Isabel sobre la base de sus conocimientos previos. Ahora pasaremos al momento de Información, donde le entregaremos insumos que le permitirán comprender más profundamente las decisiones de Isabel.' },
  { level_id: 3, sequence: 6, question: 'Elija uno de los conceptos señalados para comprender los cambios en la sexualidad y la afectividad (autonomización de la sexualidad, diversificación de trayectorias afectivas y sexuales y diversidad sexual), explíquelo y de un ejemplo usando para ello alguno de los cambios operados que se enseñan en el video.', instant_feedback: 'Los cambios generacionales se han producido de manera paulatina y progresiva. Las sociedades han transitado de contextos de gran homogeneidad -en las cuales había mayor apego a la norma y a las instituciones-, a contextos de gran heterogeneidad -en las cuales las personas se apropian reflexivamente de las normas y las instituciones. La masificación de los métodos de prevención, así como la existencia de tecnologías que permiten la reproducción asisitida, han permitido que la sexualidad se haya autonomizado de la reproducción. En este contexto, la sexualidad adquiere nuevos significados, en los cuales la diversidad adquiere un rol importante, por ejemplo, la heterosexualidad ya no es la única norma para vivir la sexualidad, ni tampoco el matrimonio el único contexto debido para las relaciones sexuales' },
  { level_id: 3, sequence: 7, question: 'Considerando la noticia y la investigación analizada ¿Cuáles son los aspectos a los que usted atendería para evaluar la seriedad de una fuente de información relacionada con la sexualidad? ', instant_feedback: 'Al evaluar una fuente de información, es relevante preguntarse, por ejemplo, de donde viene la información que se presenta (cuál es la fuente), cuál es su base científica, si representa a un grupo importante de la población o se trata de un estudio de pocos casos, cuales son los sesgos religiosos, morales o políticos que se pueden identificar, de manera de dimensionar la información en su real magnitud.' },
  { level_id: 3, sequence: 8, question: 'Explique el concepto de sexualidad protegida y de un ejemplo basándose en los datos señalados en el video.', instant_feedback: 'La sexualidad protegida dice relación con una experiencia autónoma, consentida y libre de presiones y/o violencia, placentera y segura, es decir, que pueda prevenir en relación a los riesgos como los embarazos no previstos, el VIH y las ITS. Se vincula con la capacidad de autocuidado de las personas, pero también con la capacidad de proteger a quienes se encuentran en mayores condiciones de vulnerabilidad, como son los niños y niñas y las adolescentes, por parte del mundo adulto.' },
  { level_id: 3, sequence: 9, question: 'Considerando lo expuesto en relación a las políticas de educación sexual implementadas en diferentes países, ¿cuál debería ser el objetivo de la educación sexual? Fundamente su respuesta.', instant_feedback: 'Esperamos que en su respuesta haya podido reflexionar sobre los modos en que las políticas educacionales en sexualidad y afectividad se vinculan con la sexualidad protegida, para de ese modo formular sus objetivos.' },
  { level_id: 3, sequence: 10, question: '¿Qué elementos del momento informativo le han sido útiles para comprender mejor a Isabel? Fundamente su respuesta', instant_feedback: '¡Felicitaciones!, usted ha completado el tercer momento de la unidad de aprendizaje, el momento Informativo. Esperamos que haya sido interesante y útil para su práctica pedagógica, pero sobre todo, esperamos que le permita comprender mejor las decisiones que toma Isabel. Ahora vamos a pasar al cuarto momento de la unidad, la Aplicación. Se espera que en ella usted resuelva nuevamente el Caso de Aprendizaje cristalizando los conocimientos adquiridos en el momento Informativo.' },
  { level_id: 4, sequence: 11, question: '¿Porqué Isabel toma esta decisión en el acto 1?', instant_feedback: 'Hemos intentando comprender nuevamente las decisiones de Isabel, esta vez utilizando los conocimientos adquiridos en el momento informativo. Entre más información manejamos, más fácil es comprender a Isabel y evitar juzgarla.' },
  { level_id: 4, sequence: 12, question: '¿Porqué Isabel toma esta decisión en el acto 3?', instant_feedback: 'Recuerde, la decisión de Isabel en el acto tres no es un modelo, es una alternativa entre muchas posibles. Ahora le preguntaremos por el cambio interno de Isabel. Le daremos una pista: considere la percepción de nuestra protagonista.' },
  { level_id: 4, sequence: 13, question: 'Comparando ambas respuestas ¿Cuál es el cambio interno que experimenta Isabel?', instant_feedback: '¡Muy bien! Ya estamos en la recta final de este curso, el próximo ejercicio corresponde a la elaboración de un acto dos para el caso de aprendizaje de Isabel. Recuerde que el acto dos debe narrar una situación en la vida de Isabel que haga creíble el cambio que experimenta.' },
  { level_id: 4, sequence: 14, question: 'Desarrolle un acto 2 escrito en primera persona (como si usted fuera Isabel) que haga coherente su proceso de cambio', instant_feedback: '¡Felicitaciones! Usted ha resuelto por segunda vez el Caso de Aprendizaje de Isabel. Con esto ha completado el cuarto momento de la unidad, la Aplicación. Ahora, para terminar, pasaremos al momento de Cierre.' },
  { level_id: 5, sequence: 15, question: 'Comparando su primera y segunda resolución del Caso de Aprendizaje. ¿Qué aprendizajes personales identifica?', instant_feedback: 'Lo que usted acaba de responder corresponde al delta de aprendizaje, que en esta metodología es operativamente la diferencia entre su primera y segunda resolución del Caso de Aprendizaje. Con este ejercicio damos por terminada las actividades que corresponden a una Unidad de Aprendizaje para el aula. Las próximas dos preguntas tienen como propósito que usted demuestre su comprensión de la metodología y de cuenta de cómo la implementaría con sus estudiantes.' },
  { level_id: 5, sequence: 16, question: 'Explique cuál es el sentido de cada uno de los 5 momentos de la Unidad de Aprendizaje (puede apoyarse en el texto de Metodología).', instant_feedback: 'El método, en términos generales, constituye una herramienta para que cada persona aprenda de un modo que le resulte particularmente significativo para sí misma. La unidad de aprendizaje con metodología de caso de aprendizaje constituye propiamente un proceso de articulación entre lo conocido y lo no conocido, entre los mapas mentales previos y los nuevos conocimientos que los enriquecen, los complejizan y los hacen operacionalmente más efectivos en la práctica.' },
  { level_id: 5, sequence: 17, question: 'Visualice una situación de aula con sus estudiantes. Escoja una Unidad de Aprendizaje (<a href="http://www.pasa.cl/?page_id=895" target="_blank">http://www.pasa.cl/?page_id=895</a>) y justifique su elección.<br> Luego describa cómo implementaría la unidad.  Considere en qué instancia  la aplicaría, si utilizaría recursos o materiales adicionales, cuánto tiempo destinaría a cada momento de la unidad, cómo organizaría el trabajo de los y las estudiantes (individual o grupalmente), etc.', instant_feedback: '¡Felicitaciones!, usted ha terminado el Curso: Ejecución de Unidades de Aprendizaje para la educación en Sexualidad y Afectividad con Metodología de Caso de Aprendizaje. Esperamos que haya sido una experiencia gratificante para usted. Nos veremos próximamente en un taller presencial que complementa lo aprendido en este curso. Le informaremos oportunamente el día y lugar de realización del taller.' }
  ])
  
topics = Topic.create([
  { name: "Nuestro Curso", image_url: "house.png", abstract: "¡Bienvenido, bienvenida! Éste es el foro de Comunicaciones de la Comunidad que constituye Nuestro Curso. Aquí encontrará publicadas las últimas novedades, anuncios oficiales e informaciones que son de interés de todos los participantes. Además, es un espacio en el cual podemos conversar sobre sexualidad y las temáticas del curso en general." },
  { name: "Happy Hour", image_url: "beer.png", abstract: "El happy hour es un momento en que nos distendemos y relajamos conversando con nuestros compañeros, después de todo un día de trabajo. En este Happy Hour podremos conocernos mejor." },
  { name: "Soporte Técnico", image_url: "wrench.png", abstract: "¿Tiene algún problema tecnológico? ¿Hay algo que no comprende de la plataforma virtual? Si necesita asistencia técnica puede colocar su pregunta en este foro, escribir a <a href='mailto:soporte@pasa.cl'>soporte@pasa.cl</a> o llamar al (02) 9787857-(02) 9787859 entre 9:30 y 18:00 horas" }
  ])  
