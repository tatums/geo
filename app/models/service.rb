class Service 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :category
  field :price, :type => BigDecimal
  field :start_at, :type  => DateTime
  field :end_at, :type  => DateTime
  
    
  belongs_to :merchant
  
  CATEGORIES = ['facial', 'hair_cut', 'hair_style', 'hair_color', 'massage', 'nail_service', 'hair_removal']
  
end
