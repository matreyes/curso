# coding: UTF-8

module Curso
  module Factories
    def new_user(attributes = {})
      attributes = attributes.dup
      user = User.new
      user.email = attributes[:email] || String.random(10).downcase + '@' + String.random(5).downcase + '.com'
      user.password = attributes[:password] || user.email.split('@').first
      user.password_confirmation = user.password
      user
    end

    def create_user(attributes = {})
      user = new_user(attributes)
      user.save
      user
    end

  end
end