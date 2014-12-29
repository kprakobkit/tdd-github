require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "#current" do
    it "should return the current user" do
      expect(User.current).to eq "kprakobkit"
    end
  end
end
