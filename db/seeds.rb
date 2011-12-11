# coding: UTF-8

levels = Level.create([
  { id: 1, name: 'Apertura', tag: 'aper' },
  { id: 2, name: 'Problematización', tag: 'prob' },
  { id: 3, name: 'Información', tag: 'info' },
  { id: 4, name: 'Aplicación', tag: 'aplic' },
  { id: 5, name: 'Cierre', tag: 'cierr' },
  ])

quizes = Quiz.create([
  { level_id: 1, question: '¿Qué te parece todo esto?', instant_feedback: 'recuerda que te tienes que portar bien' },
  { level_id: 1, question: 'Aquí hay algo más...', instant_feedback: 'súper' },
  { level_id: 2, question: '¿y esto que tal?', instant_feedback: 'Muy bien' }
  ])
  
topics = Topic.create([
  { name: "tema1", abstract: "este es el tema 1"},
  { name: "tema2", abstract: "este es el tema 2"}
  ])  
comments = Comment.create([
  { topic_id: 1, user_id: 1, text: "texto 1 del tema 1"},
  { topic_id: 1, user_id: 2, text: "texto 2 del tema 1"},
  { topic_id: 1, user_id: 1, text: "texto 3 del tema 1"},
  { topic_id: 2, user_id: 2, text: "texto 1 del tema 2"},
  { topic_id: 2, user_id: 2, text: "texto 2 del tema 1"}
  ])

  
  
admin = User.new(id:1, name: 'Administrador', email: 'admin@mail.com', password: '1234', password_confirmation: '1234')
admin.is_admin = true
admin.save

user = User.create(id: 2, name: 'Usuario', email: 'user@mail.com', password: '1234', password_confirmation: '1234', tutor_id: 1)
