require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET show" do
    let(:user) { { name: "Matt Baker" } }

    before :each do
      allow(User).to receive(:find).and_return(user)
      get :show, { username: 'mattbaker' }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should render the show template" do
      expect(response).to render_template('show')
    end

    it "assigns @user" do
      expect(assigns(:user)).to eq user
    end
  end

end
