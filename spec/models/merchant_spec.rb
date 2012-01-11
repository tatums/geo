require 'spec_helper'

describe Merchant do
  it "address must validate with Google Maps" do
      Merchant.create.should have(1).error_on(:gmaps4rails_address)
  end

  it "cannot save without name" do
      Merchant.create.should have(1).error_on(:name)
  end

  it "be valid" do
      m = Merchant.create(:name => "Tatum Szymczak", :street => "1151 W 14th PL", :city => "Chicago", :state => "IN", :zip => "60608")
      m.should be_valid
  end

  it "should have latitude" do
      m = Merchant.create(:name => "Tatum Szymczak", :street => "1151 W 14th PL", :city => "Chicago", :state => "IN", :zip => "60608")
      m.latitude.should_not == nil
  end

  it "should have longitude" do
      m = Merchant.create(:name => "Tatum Szymczak", :street => "1151 W 14th PL", :city => "Chicago", :state => "IN", :zip => "60608")
      m.longitude.should_not == nil
  end

end
