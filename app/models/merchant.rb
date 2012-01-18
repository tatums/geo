class Merchant
  include Mongoid::Document
  
  field :name
  field :street
  field :city
  field :state
  field :zip
  field :phone
  field :longitude, :type => Float
  field :latitude, :type => Float
  field :gmaps, :type => Boolean
  field :created_at
  field :updated_at
  field :user_id, :type => Integer
  
  has_many :services
  belongs_to :user
  
  #acts_as_gmappable  
  #geocoded_by :full_address
  after_validation :geocode, :if => :city_changed? 
  validates :name, :presence => true
  
  def full_address
    street + ", " + city + "," + state + zip
  end
  
  def formatted_address
    "<p><em>#{name}</em><br />#{street}<br />#{city}, #{state} #{zip}"
  end
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.state} #{self.zip}"
  end
  
  def gmaps4rails_infowindow
    formatted_address
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
  end
  
  def cordinates
    latitude.to_s + "," + longitude.to_s 
  end
  
  # def is_user_authorized_merchant(user)
  #   if self.user_id == user.id
  #     return true
  #   end
  # end
  
  
end
