require 'rails_helper'

def new_user
  User.new(email:"maria@maria.com",password:"87654321",password_confirmation:"87654321")
end

def user_signup(email=nil,password=nil)
  email ||= "email@mail.com"
  password ||= "12345678"
  User.create!(email: email,
                  password: password,password_confirmation: password)
end

def user_signin(email=nil,password=nil)
  email ||= "email@mail.com"
  password ||= "12345678"
  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_on 'Log in'
end
