class Service < ActiveRecord::Base
  belongs_to :merchant
  
  TYPES = ['facial', 'hair cut', 'hair style', 'hair color', 'massage', 'nail service', 'hair removal']
  
end
