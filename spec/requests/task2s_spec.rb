require "spec_helper"

describe "user sign in" do
  it "allows users to sign in after they have registered" do
    user = User.create(:email    => "abc@email.com",
                       :password => "123456")

    visit "signin"
   
    fill_in "email",    :with => "abc@email.com"
    fill_in "password", :with => "123456"

    click_button "Sign in"
    page.has_no_content?("New User")

    end
   
     it "doesnot allows users to sign in after they have registered" do
    user = User.create(:email    => "abc@email.com",
                       :password => "123456")

    visit "signin"
   
    fill_in "email",    :with => "abc@email.com"
    fill_in "password", :with => "123456"

    click_button "Sign in"
    page.has_no_content?("Signed in")
    
    end
 

end
