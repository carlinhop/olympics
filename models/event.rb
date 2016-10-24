require_relative('../db/sql_runner')
require_relative('sport')
require_relative('athlete')
require_relative('country')

class Event
  attr_accessor :id ,:sport, :date, :time
  
  def initialize(options)
    @id = options['id'].to_i
    @sport_id = options['sport_id']
    @event_date = options['date']
    @event_time = options['time']

  end

  def save()
    sql = "INSERT INTO events (sport_id, event_date, event_time) VALUES (#{ @sport_id }, '#{ @event_date }', '#{ @event_time }') RETURNING *"
    event = SqlRunner.run( sql ).first
    @id = event['id']
  end

  def self.all()
    sql = "SELECT * FROM events"
    events = SqlRunner.run( sql )
    result = events.map { |e| Event.new( e) }
    return result
  end

  #knows its athletes
  #knows its results

  
end
