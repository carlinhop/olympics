class Athlete
  attr_accessor :name, :sport, :nation
  
  def initialize(name, sport, nation)
    @id = nil
    @name = name
    @sport = sport
    @nation = nation
  end
end