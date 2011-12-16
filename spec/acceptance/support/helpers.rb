module HelperMethods

  def current_path
    URI.parse(current_url).path
  end

  def click(*args)
    click_link_or_button(*args)
  end

  def login_as(shop)
    visit login_path
    fill_in "shop_email", :with => shop.email
    fill_in "shop_password", :with => shop.email.split('@').first
    click 'Entrar'
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance