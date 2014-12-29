require 'rails_helper'

RSpec.describe ReposController, :type => :controller do
  let(:repo) { { "owner" => { "login" => "kprakobkit" } } }

  before :each do
    allow(Util).to receive(:post_repo).and_return(repo)
    post :create, { repo: { name: "reponame" } }
  end

  describe "#create" do
    it "assigns @repo" do
      expect(assigns(:repo)).to eq repo
    end
  end

  describe "#show" do
    before :each do
      allow(Repo).to receive(:find).and_return(repo)
      get :show, { username: "kprakobkit", repo: "repo" }
    end

    it "should render the show template" do
      expect(response).to render_template('show')
    end

    it "assigns @repo" do
      expect(assigns(:repo)).to eq repo
    end
  end
end
