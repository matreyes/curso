# coding: UTF-8

module Curso
  module Factories
    def new_user(attributes = {})
      attributes = attributes.dup
      user = User.new
      user.name = attributes[:name] || String.random(5)
      user.surname = attributes[:surname] || String.random(5)
      user.email = attributes[:email] || String.random(10).downcase + '@' + String.random(5).downcase + '.com'
      user.password = attributes[:password] || user.email.split('@').first
      user.password_confirmation = user.password
      user.is_admin = attributes[:is_admin] || false
      user
    end

    def create_user(attributes = {})
      user = new_user(attributes)
      user.save
      user
    end
    
    def create_admin(attributes = {})
      create_user(attributes.merge(:is_admin => true))
    end

  end
end