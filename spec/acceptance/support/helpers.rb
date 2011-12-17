module HelperMethods

  def current_path
    URI.parse(current_url).path
  end

  def click(*args)
    click_link_or_button(*args)
  end

  def login_as(user)
    visit '/'
    
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.email.split('@').first
    click "Ingresar"
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance