require 'spec_helper'

describe "services/edit" do
  before(:each) do
    @service = assign(:service, stub_model(Service,
      :title => "MyString",
      :type => "",
      :price => "9.99"
    ))
  end

  it "renders the edit service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path(@service), :method => "post" do
      assert_select "input#service_title", :name => "service[title]"
      assert_select "input#service_type", :name => "service[type]"
      assert_select "input#service_price", :name => "service[price]"
    end
  end
end
