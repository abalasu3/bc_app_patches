require 'spec_helper'

describe "votereplies/index.html.erb" do
  before(:each) do
    assign(:votereplies, [
      stub_model(Votereply,
        :rcount => 1
      ),
      stub_model(Votereply,
        :rcount => 1
      )
    ])
  end

  it "renders a list of votereplies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
