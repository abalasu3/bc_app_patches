require 'spec_helper'

describe "vote_posts/new.html.erb" do
  before(:each) do
    assign(:vote_post, stub_model(VotePost,
      :count => 1,
      :pid => 1,
      :uid => 1
    ).as_new_record)
  end

  it "renders new vote_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vote_posts_path, :method => "post" do
      assert_select "input#vote_post_count", :name => "vote_post[count]"
      assert_select "input#vote_post_pid", :name => "vote_post[pid]"
      assert_select "input#vote_post_uid", :name => "vote_post[uid]"
    end
  end
end
