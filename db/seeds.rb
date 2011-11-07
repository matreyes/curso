# coding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
levels = Level.create([{ name: 'Apertura', tag: 'aper' }, { name: 'Problematización', tag: 'prob' }, { name: 'Información', tag: 'info' }])