# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Signup' do

  scenario 'Signup in the application' do
    visit '/'
    
    click "¿Usuario nuevo?"
    
    page.should have_content "Registro"
    
    fill_in "Email", :with => "usuario@example.com"
    fill_in "Contraseña", :with => "usuario321"
    fill_in "Confirmación de contraseña", :with => "usuario123"
    
    click "Sign up"
    
    page.should have_content "Ocurrió un error:"
    page.should have_content "Contraseña no coincide con la confirmación"
    
    fill_in "Contraseña", :with => "usuario123"
    fill_in "Confirmación de contraseña", :with => "usuario123"
    
    click "Sign up"
    
    page.should have_content "Bienvenido. Tu cuenta fue creada."
    page.should have_content "Ejecución de Unidades de Aprendizaje"
    page.should have_content "usuario@example.com"
    
    click "Salir"
    
    fill_in "email", :with => "usuario@example.com"
    fill_in "password", :with => "usuario123"
    click "Ingresar"
    
    page.should have_content "usuario@example.com"
    page.should have_content "Salir"
  end

end
