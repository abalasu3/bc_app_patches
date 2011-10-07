require 'spec_helper'

describe "replies/new.html.erb" do
  before(:each) do
    assign(:reply, stub_model(Reply,
      :response => "MyText",
      :post_id => 1
    ).as_new_record)
  end

  it "renders new reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path, :method => "post" do
      assert_select "textarea#reply_response", :name => "reply[response]"
      assert_select "input#reply_post_id", :name => "reply[post_id]"
    end
  end
end
