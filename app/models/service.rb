class Service < ActiveRecord::Base
  belongs_to :merchant
  
  CATEGORIES = ['facial', 'hair_cut', 'hair_style', 'hair_color', 'massage', 'nail_service', 'hair_removal']
  
end
