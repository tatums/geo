require 'spec_helper'

describe "services/new" do
  before(:each) do
    assign(:service, stub_model(Service,
      :title => "MyString",
      :type => "",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path, :method => "post" do
      assert_select "input#service_title", :name => "service[title]"
      assert_select "input#service_type", :name => "service[type]"
      assert_select "input#service_price", :name => "service[price]"
    end
  end
end
