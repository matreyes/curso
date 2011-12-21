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

  scenario %q{
    A user creates two comments in a topic
    And then removes one of them
    And then the administrator removes the other one
  } do
    user = create_user

    topic = create_topic :name => "Sobre los animales de granja", :abstract => "Aquí se habla de animales"

    login_as user

    click 'Foros'

    click "Sobre los animales de granja"

    page.should have_content "Foro: Sobre los animales de granja"

    fill_in "comment_text", :with => "Me gustaría saber qué animales entran en el examen"
    click "Enviar"

    page.should have_content "Comentario enviado"
    page.should have_content "Foro: Sobre los animales de granja"
    page.should have_css("div.well p", :text => "Me gustaría saber qué animales entran en el examen")

    fill_in "comment_text", :with => "Y los que no, claro está"
    click "Enviar"

    page.should have_css("div.well:eq(1) p", :text => "Y los que no, claro está")

    page.should have_css("div.well:eq(2) p", :text => "Me gustaría saber qué animales entran en el examen")

    page.all("a.remove_comment").last.click
    page.driver.browser.switch_to.alert.accept

    page.should have_content "Comentario eliminado correctamente"

    page.should_not have_css("div.well:eq(2) p", :text => "Me gustaría saber qué animales entran en el examen")

    click "Salir"

    admin = create_admin

    login_as admin

    click 'Foros'

    click "Sobre los animales de granja"

    click "Eliminar"
    page.driver.browser.switch_to.alert.accept
    page.should have_content "Comentario eliminado correctamente"

    page.all("div.well").size.should == 0
  end

end
