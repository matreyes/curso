# coding: UTF-8

require 'acceptance/acceptance_helper'

feature 'Login' do

  scenario 'Login and logout' do
    
    user = create_user :email => 'usuario@email.com'

    visit '/'
    
    fill_in 'email', :with => 'usuario@email.com'
    fill_in 'password', :with => 'usuario'
    click "Ingresar"
    
    page.should have_content "usuario@email.com"
    
    click "Salir"

    page.should_not have_content "usuario@email.com"
  end

end
