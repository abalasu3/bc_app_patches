require 'spec_helper'

describe "votereplies/new.html.erb" do
  before(:each) do
    assign(:votereply, stub_model(Votereply,
      :rcount => 1
    ).as_new_record)
  end

  it "renders new votereply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votereplies_path, :method => "post" do
      assert_select "input#votereply_rcount", :name => "votereply[rcount]"
    end
  end
end
