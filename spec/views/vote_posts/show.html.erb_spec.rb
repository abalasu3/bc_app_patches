require 'spec_helper'

describe "vote_posts/show.html.erb" do
  before(:each) do
    @vote_post = assign(:vote_post, stub_model(VotePost,
      :count => 1,
      :pid => 1,
      :uid => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
