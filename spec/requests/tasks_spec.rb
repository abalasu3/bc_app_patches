require 'spec_helper'
require 'webrat'

describe "Tasks" do
  describe "GET /tasks" do
    test "logging in with valid username and password" do
    User.create!(:name => "rbates", :email => "ryan@example.com", :password =>  "secret", :password_confirmation => "secret")
    visit signup_url
    fill_in "name", :with => "rbates"
    fill_in "email", :with => "ryan@example.com"
    fill_in "password", :with => "secret"
    fill_in "Password Confirmation", :with => "secret"
    click_button "Sign Up"
    assert_contain "Logged in successfully."
  end
  
  test "logging in with invalid username and password" do
      User.create!(:name => "rbates", :email => "ryan@example.com", :password => "secret", :password_confirmation => "secret")
    visit signup_url
    fill_in "name", :with => "rbates"
    fill_in "email", :with => "ryan@example.com"
    fill_in "password", :with => "secret"
    fill_in "Password Confirmation", :with => "seret"
    click_button "Sign Up"
    assert_contain "Invalid Login."
  end
  end  
end
