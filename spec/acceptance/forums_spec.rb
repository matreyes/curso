# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Forums' do

  scenario %q{
    As a user, I visit the forums 
    and answer a topic
  } do
    user = create_user
    
    topic = create_topic :name => "Sobre los animales de granja", :abstract => "Aquí se habla de animales"
    
    login_as user
    
    click 'Foros'
    
    page.should have_content "Sobre los animales de granja"
    page.should have_content "Aquí se habla de animales"
    
    click "Sobre los animales de granja"
    
    page.should have_content "Foro: Sobre los animales de granja"
    
    click "Enviar"
    
    page.should have_content "Ha ocurrido un error al enviar el comentario"
    
    fill_in "comment_text", :with => "Me gustaría saber qué animales entran en el examen"
    click "Enviar"
    
    page.should have_content "Comentario enviado"
    page.should have_content "Foro: Sobre los animales de granja"
    page.should have_css("div.well p", :text => "Me gustaría saber qué animales entran en el examen")

    fill_in "comment_text", :with => "Y los que no, claro está"
    click "Enviar"
    
    page.should have_content "Comentario enviado"
    page.should have_content "Foro: Sobre los animales de granja"

    page.should have_css("div.well:eq(1) p", :text => "Y los que no, claro está")

    page.should have_css("div.well:eq(2) p", :text => "Me gustaría saber qué animales entran en el examen")    
  end

end
