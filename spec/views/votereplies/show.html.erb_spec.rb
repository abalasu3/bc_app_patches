require 'spec_helper'

describe "votereplies/show.html.erb" do
  before(:each) do
    @votereply = assign(:votereply, stub_model(Votereply,
      :rcount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
