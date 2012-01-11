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

User.create(:email => "tatum@ashlandstudios.com", :password => "pa88word", :password_confirmation => "pa88word", :role => "admin")
Merchant.create(:name => "Salon Salon", street: "225 W Huron St", :city => "Chicago", :state => "IL", :zip => "60654", :phone => "3125551212", :gmaps => true, :user_id => User.last.id)
Service.create(:title => "Hair Cut", :category => 'hair cut', :price => 49.99, :start_at => Time.now + 1.day, :end_at => Time.now + 1.day, :merchant_id => Merchant.last.id)


User.create(:email => "user@example.com", :password => "pa88word", :password_confirmation => "pa88word", :role => "user")
Merchant.create(:name => "4 Elements Salon", street: "544 N Milwaukee Ave", :city => "Chicago", :state => "IL", :zip => "60642", :phone => "3125551212", :gmaps => true, :user_id => User.last.id)
Service.create(:title => "Hair Cut", :category => 'hair cut', :price => 49.99, :start_at => Time.now + 2.day, :end_at => Time.now + 2.day, :merchant_id => Merchant.last.id)

User.create(:email => "user+1@example.com", :password => "pa88word", :password_confirmation => "pa88word", :role => "user")
Merchant.create(:name => "Salon Buzz - GoldCoast", street: "1 E Delaware Pl", :city => "Chicago", :state => "IL", :zip => "60611", :phone => "3125551212", :gmaps => true, :user_id => User.last.id)
Service.create(:title => "Hair Cut", :category => 'hair cut', :price => 49.99, :start_at => Time.now + 3.day, :end_at => Time.now + 3.day, :merchant_id => Merchant.last.id)

User.create(:email => "user+2@example.com", :password => "pa88word", :password_confirmation => "pa88word", :role => "user")
Merchant.create(:name => "RED 7 SALON", street: "210 W Kinzie St", :city => "Chicago", :state => "IL", :zip => "60654", :phone => "3125551212", :gmaps => true, :user_id => User.last.id)
Service.create(:title => "Hair Cut", :category => 'hair cut', :price => 49.99, :start_at => Time.now + 4.day, :end_at => Time.now + 4.day, :merchant_id => Merchant.last.id)
