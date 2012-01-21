class Service 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Geocoder::Model::Mongoid
  
  field :title
  field :category
  field :price, :type => BigDecimal
  field :start_at, :type  => DateTime
  field :end_at, :type  => DateTime
  field :coordinates, :type => Array
  index "coordinates"
  
  geocoded_by :full_address
  after_validation :geocode
  
  #after_validation :geocode, :if => :city_changed? 
  
  def full_address
    merchant.street + ", " + merchant.city + ", " + merchant.state + " " + merchant.zip
  end
  
  def longitude
    coordinates[0]
  end

  def latitude
    coordinates[1]
  end
  
    
  belongs_to :merchant
  
  CATEGORIES = ['facial', 'hair_cut', 'hair_style', 'hair_color', 'massage', 'nail_service', 'hair_removal']
  
end
