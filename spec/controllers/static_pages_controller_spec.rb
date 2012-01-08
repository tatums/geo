require 'spec_helper'

describe StaticPagesController do

  describe "GET 'categories'" do
    it "returns http success" do
      get 'categories'
      response.should be_success
    end
  end

end
