# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Merchant.delete_all
Service.delete_all


# count = 1
# 10.times do
#
# end

count = 1
User.create(:email => "tatum#{count}@ashlandstudios.com", :password => "password", :password_confirmation => "password", :role => "admin")
user = User.where(email: "tatum#{count}@ashlandstudios.com").first
user.merchants.create(:name => "Merchant#{count}", street: "225 W Huron St", :city => "Chicago", :state => "IL", :zip => "60654", :phone => "3125551212", :gmaps => true)
  Service.create(:title => "Service_#{count}", :price => 50.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 150.00, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 49.99, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 39.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 69.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 149.99, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 65.00, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 29.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)


count+=1
user.merchants.create(:name => "Merchant#{count}", street: "226 West Ontario Street", :city => "Chicago", :state => "IL", :zip => "60654", :phone => "3125551212", :gmaps => true)
  Service.create(:title => "Service_#{count}", :price => 50.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 150.00, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 49.99, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 39.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 69.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 149.99, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 65.00, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
  Service.create(:title => "Service_#{count}", :price => 29.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)

count+=1
 user.merchants.create(:name => "Merchant#{count}", street: "16 W. Ontario Street", :city => "Chicago", :state => "IL", :zip => "60654", :phone => "3125551212", :gmaps => true)
   Service.create(:title => "Service_#{count}", :price => 50.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 150.00, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 49.99, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 39.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 69.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 149.99, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 65.00, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
   Service.create(:title => "Service_#{count}", :price => 29.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)

#   Service.create(:title => "Service_#{count}", :category => 'hair_cut', :price => 50.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'massage', :price => 150.00, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'facial', :price => 49.99, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'hair_style', :price => 39.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'hair_cut', :price => 69.00, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'massage', :price => 149.99, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'facial', :price => 65.00, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)
#   Service.create(:title => "Service_#{count}", :category => 'hair_removal', :price => 29.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
#
