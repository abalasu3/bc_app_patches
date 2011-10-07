require 'spec_helper'

describe "votereplies/edit.html.erb" do
  before(:each) do
    @votereply = assign(:votereply, stub_model(Votereply,
      :rcount => 1
    ))
  end

  it "renders the edit votereply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votereplies_path(@votereply), :method => "post" do
      assert_select "input#votereply_rcount", :name => "votereply[rcount]"
    end
  end
end
