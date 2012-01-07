require 'spec_helper'

describe "merchants/new" do
  before(:each) do
    assign(:merchant, stub_model(Merchant,
      :name => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new merchant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => merchants_path, :method => "post" do
      assert_select "input#merchant_name", :name => "merchant[name]"
      assert_select "input#merchant_city", :name => "merchant[city]"
      assert_select "input#merchant_state", :name => "merchant[state]"
      assert_select "input#merchant_zip", :name => "merchant[zip]"
      assert_select "input#merchant_phone", :name => "merchant[phone]"
    end
  end
end
