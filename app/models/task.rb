class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :completed, :type => Boolean
  field :title
  
end
