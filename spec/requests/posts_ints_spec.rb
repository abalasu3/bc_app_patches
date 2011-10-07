require "spec_helper"

describe "create post" do
  it "allows create posts" do
    visit "signin"
   
    fill_in "email",    :with => "abc@email.com"
    fill_in "password", :with => "123456"
    click_button "Sign in"
    end
   
end
