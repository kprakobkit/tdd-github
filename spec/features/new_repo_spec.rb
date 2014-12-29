require 'rails_helper'

describe "new_repo", :type => :feature do
  let(:repo) { { "name" => "repo1", "watchers" => "0", "owner" => { "login" => "kprakobkit" } } }

  it "should add the new repo to the profile page", :js => true do
    allow(Util).to receive(:post_repo).and_return(repo)
    current_user = User.current
    visit "/users/#{current_user}"
    fill_in("repo[name]", :with => repo["name"])
    click_button('Submit')

    expect(page).to have_content(repo["name"])
    expect(page).to have_content(repo["watchers"])
  end
end
