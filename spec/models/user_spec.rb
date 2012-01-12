require 'spec_helper'

describe User do
  it "cannot save empty user" do
      User.create.should_not be_valid
  end

  it "be valid" do
      user = User.create(:email => "test@test.com", :password => "pa88word", :password_confirmation => "pa88word", :role => "admin")
      user.should be_valid
  end
end
