require 'rails_helper'

def new_user
  User.new(name:"Maria",email:"maria@maria.com",password:"4321",password_confirmation:"4321")
end

def user_signup(name=nil,email=nil,password=nil)
  name ||= "Alfredo"
  email ||= "email@mail.com"
  password ||= "1234"
  User.create!(name: name,email: email,
                  password: password,password_confirmation: password)
end

def user_signin(email=nil,password=nil)
  email ||= "email@mail.com"
  password ||= "1234"
  visit login_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_on 'Acessar'
end
