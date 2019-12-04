
require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(username: "ZelligBoGoss", email: "zelig@yopmail.com", description: "Le bogoss de la team bogoss")

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end
end
end
