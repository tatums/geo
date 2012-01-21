class Merchant
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  include Gmaps4rails::ActsAsGmappable
  
  
  field :name
  field :street
  field :city
  field :state
  field :zip
  field :phone
  field :coordinates, :type => Array
  field :gmaps, :type => Boolean
  field :user_id, :type => Integer
  #field :longitude, :type => Float
  #field :latitude, :type => Float
  
  
  validates :name, :presence => true
  
    
  has_many :services
  #belongs_to :user
  
  def longitude
    coordinates[0]
  end

  def latitude
    coordinates[1]
  end
  
  
  
  #acts_as_gmappable :lat => :latitude, :lng => :longitude
  acts_as_gmappable
  
  #acts_as_gmappable :lat => :lat, :lng => :lng
  
  #geocoder finds the lat & lng
  geocoded_by :full_address
  
  after_validation :geocode, :if => :city_changed? 
  
  def full_address
    street + ", " + city + "," + state + zip
  end
  
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.state} #{self.zip}"
  end

  def formatted_address
    "<p><em>#{name}</em><br />#{street}<br />#{city}, #{state} #{zip}"
  end
  
  def gmaps4rails_infowindow
    formatted_address
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
  end
  
  # def coordinates
  #   latitude.to_s + "," + longitude.to_s 
  # end
  
  
  #GOOD EXAMPLE FOR GMAPS FOR RAILS
  # acts_as_gmappable :lat => 'lat', :lng => 'lng', :check_process => :prevent_geocoding,
  #                   :address => "address", :normalized_address => "address",
  #                   :msg => "Sorry, not even Google could figure out where that is"
  # 
  # def prevent_geocoding
  #   address.blank? || (!lat.blank? && !lng.blank?) 
  # end
  
  
  # def is_user_authorized_merchant(user)
  #   if self.user_id == user.id
  #     return true
  #   end
  # end
  
  
end
