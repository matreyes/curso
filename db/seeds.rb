# coding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
levels = Level.create([
  { id: 1, name: 'Apertura', tag: 'aper' },
  { id: 2, name: 'Problematización', tag: 'prob' },
  { id: 3, name: 'Información', tag: 'info' }
  ])

quizes = Quiz.create([
  { level_id: 1, question: '¿Qué te parece todo esto?', instant_feedback: 'recuerda que te tienes que portar bien' },
  { level_id: 1, question: 'Aquí hay algo más...', instant_feedback: 'súper' },
  { level_id: 2, question: '¿y esto que tal?', instant_feedback: 'Muy bien' }
  ])
  
users = User.create([
  { id: 1, name: 'Administrador', email: 'admin@mail.com', password: '1234', password_confirmation: '1234'},
  { id: 1, name: 'Usuario', email: 'user@mail.com', password: '1234', password_confirmation: '1234'},
  ])