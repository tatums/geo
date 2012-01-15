class Session
  attr_accessor :items
  
  def initialize 
    @items = []
  end
  
  def add(item) 
    @items << item
  end 
  
end