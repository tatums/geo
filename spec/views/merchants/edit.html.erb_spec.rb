require 'spec_helper'

describe "merchants/edit" do
  before(:each) do
    @merchant = assign(:merchant, stub_model(Merchant,
      :name => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit merchant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => merchants_path(@merchant), :method => "post" do
      assert_select "input#merchant_name", :name => "merchant[name]"
      assert_select "input#merchant_city", :name => "merchant[city]"
      assert_select "input#merchant_state", :name => "merchant[state]"
      assert_select "input#merchant_zip", :name => "merchant[zip]"
      assert_select "input#merchant_phone", :name => "merchant[phone]"
    end
  end
end
