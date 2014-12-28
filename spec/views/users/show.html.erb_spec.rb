require 'rails_helper'

RSpec.describe "users/show.html.erb", :type => :view do
  let(:user) { double(name: "Matt Baker", location: "Bay Area") }

  before :each do
    assign(:user, user)
    render
  end

  it "should display the correct title" do
    assert_select "h1", "Profile"
  end

  it "should display the user's information" do
    assert_select ".username", text: user.name
    assert_select ".location", text: user.location
  end
end
