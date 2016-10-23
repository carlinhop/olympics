require('pry-byebug')
require_relative('../db/helper')


class Country < Helper
  attr_accessor :name, :gold, :silver, :bronze, :points, :athletes
  
  def initialize(name)
    @id = nil
    @name = name
    @gold = 0
    @silver = 0
    @bronze = 0
    @points = 0
  end

  def update_points
    @points = (@gold * 5) + (@silver * 3) + @bronze
    return @points
  end

  def all_athletes
    #returns all athletes of the country
    
  end
end

angola = Country.new("Angola")
angola.save("countries")