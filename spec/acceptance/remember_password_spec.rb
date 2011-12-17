# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Remember password'do

  scenario 'Remember password' do
    user = create_user
    
    visit '/'
    
    click "¿Olvidó su contraseña?"
    
    fill_in "Correo electrónico:", :with => "nonexisting@gmail.com"
    click "Enviar instrucciones de cambio de contraseña"
    
    page.should have_content "Email no se encontró"
    
    fill_in "Correo electrónico:", :with => user.email
    click "Enviar instrucciones de cambio de contraseña"
    
    page.should have_content "Vas a recibir un correo con instrucciones sobre cómo resetear tu contraseña en unos pocos minutos."
    
    open_email_for user.email
    click_email_link_matching /password/
    
    page.should have_content "Cambiar contraseña"
    
    fill_in "Nueva contraseña", :with => 'usuario123'
    fill_in "Confirmar nueva contraseña", :with => 'usuario123'
    click "Cambiar mi contraseña e ingresar"
    
    page.should have_content user.email
    page.should have_content "Salir"
  end

end