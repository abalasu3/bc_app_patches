require 'spec_helper'

describe "vote_posts/index.html.erb" do
  before(:each) do
    assign(:vote_posts, [
      stub_model(VotePost,
        :count => 1,
        :pid => 1,
        :uid => 1
      ),
      stub_model(VotePost,
        :count => 1,
        :pid => 1,
        :uid => 1
      )
    ])
  end

  it "renders a list of vote_posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
