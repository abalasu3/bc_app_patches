require 'spec_helper'

describe Reply do
  
    before(:each) do
    @attr = {
      :response => "value for content",
      :post_id => 1
      :user_id => 2
    }
   end

   it "should create a new instance given valid attributes" do
    Reply.create!(@attr)
   end

   
end
