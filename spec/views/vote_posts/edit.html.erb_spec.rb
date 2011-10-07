require 'spec_helper'

describe "vote_posts/edit.html.erb" do
  before(:each) do
    @vote_post = assign(:vote_post, stub_model(VotePost,
      :count => 1,
      :pid => 1,
      :uid => 1
    ))
  end

  it "renders the edit vote_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vote_posts_path(@vote_post), :method => "post" do
      assert_select "input#vote_post_count", :name => "vote_post[count]"
      assert_select "input#vote_post_pid", :name => "vote_post[pid]"
      assert_select "input#vote_post_uid", :name => "vote_post[uid]"
    end
  end
end
