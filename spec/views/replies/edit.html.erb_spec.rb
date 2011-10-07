require 'spec_helper'

describe "replies/edit.html.erb" do
  before(:each) do
    @reply = assign(:reply, stub_model(Reply,
      :response => "MyText",
      :post_id => 1
    ))
  end

  it "renders the edit reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path(@reply), :method => "post" do
      assert_select "textarea#reply_response", :name => "reply[response]"
      assert_select "input#reply_post_id", :name => "reply[post_id]"
    end
  end
end
