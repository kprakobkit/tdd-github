require 'rails_helper'

RSpec.describe "repos/show", :type => :view do
  let(:repo) { { "name" => "name", "owner" => { "login" => "login" } } }
  before :each do
    assign(:repo, repo)
    render
  end

  it "should display the correct repo information" do
    assert_select ".repo-name", :text => repo["name"]
    assert_select ".owner", :text => repo["owner"]["login"]
  end
end
