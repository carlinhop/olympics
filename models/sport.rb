require_relative('../db/helper')
class Sport < Helper
  attr_accessor :name
  
  def initialize(name)
    @id = nil
    @name = name
  end

end
