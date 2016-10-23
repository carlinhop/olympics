class Country
  attr_accessor :name, :gold, :silver, :bronze, :points, :athletes
  
  def initialize(name)
    @id = nil
    @name = name
    @athletes = []
    @gold = 0
    @silver = 0
    @bronze = 0
    @points = 0
  end

  def update_points
    @points = (@gold * 5) + (@silver * 3) + @bronze
    return @points
  end





end