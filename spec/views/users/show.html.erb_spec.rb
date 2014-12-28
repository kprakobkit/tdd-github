require 'rails_helper'

RSpec.describe "users/show.html.erb", :type => :view do
  let(:user) { double(login: "mattbaker", name: "Matt Baker", location: "Bay Area") }
  let(:repo1) { double(name: "Repo 1", watchers: 10) }
  let(:repo2) { double(name: "Repo 2", watchers: 5) }
  let(:repo3) { double(name: "Repo 3", watchers: 4) }
  let(:repos) { [repo1, repo2, repo3] }

  before :each do
    assign(:user, user)
    assign(:repos, repos)
    render
  end

  it "should display the correct title" do
    assert_select "h1", "#{user.login} Profile"
  end

  it "should display the user's information" do
    assert_select ".username", text: user.name
    assert_select ".location", text: user.location
  end

  it "should display the correct number of the user's repos" do
    assert_select "li.repo", 3
  end

  it "should display all repos with the correct name" do
    assert_select "li.repo", text: repo1.name
    assert_select "li.repo", text: repo2.name
    assert_select "li.repo", text: repo3.name
  end

  it "should display watchcount with each repo" do
    assert_select "li.watcher-count", text: repo1.watchers
    assert_select "li.watcher-count", text: repo2.watchers
    assert_select "li.watcher-count", text: repo3.watchers
  end
end
