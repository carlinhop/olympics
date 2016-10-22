class Event
  attr_accessor :sport, :date, :time
  
  def initialize(sport, date, time)
    @id = nil
    @sport = sport
    @date = date
    @time = time
  end
  
end