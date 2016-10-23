require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('../db/helper')
class Sport < Helper
  attr_accessor :name
  
  def initialize(name)
    @id = nil
    @name = name
  end

end
