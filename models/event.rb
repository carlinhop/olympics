class Event
  attr_accessor :sport, :date, :time, :athletes, :results
  
  def initialize(options)
    @id = nil
    @sport = options['sport']
    @date = options['date']
    @time = options['time']
    @athletes = options['athletes']
    @results = {}
  end
  
end