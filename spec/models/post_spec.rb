require 'spec_helper'

describe Post do

   before(:each) do
    @attr = {
      :title => "Test value 1mo" 
      :content => "value for content",
      :user_id => 1
    }
   end

   it "should create a new instance given valid attributes" do
    Post.create!(@attr)
   end
  
end
