require 'spec_helper'

describe "replies/index.html.erb" do
  before(:each) do
    assign(:replies, [
      stub_model(Reply,
        :response => "MyText",
        :post_id => 1
      ),
      stub_model(Reply,
        :response => "MyText",
        :post_id => 1
      )
    ])
  end

  it "renders a list of replies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
