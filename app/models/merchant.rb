class Merchant < ActiveRecord::Base
  has_many :services
  
  acts_as_gmappable  
  geocoded_by :full_address
  after_validation :geocode, :if => :city_changed? 
  
  def full_address
    street + ", " + city + "," + state + zip
  end
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.state} #{self.zip}"
  end
  
end
