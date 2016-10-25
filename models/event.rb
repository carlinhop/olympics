require_relative('../db/sql_runner')
require_relative('sport')
require_relative('athlete')
require_relative('country')

class Event
  attr_accessor :id ,:sport_id, :event_date, :event_time
  
  def initialize(options)
    @id = options['id'].to_i
    @sport_id = options['sport_id']
    @event_date = options['event_date']
    @event_time = options['event_time']

  end

  def save()
    sql = "INSERT INTO events (sport_id, event_date, event_time) VALUES (#{ @sport_id }, '#{ @event_date }', '#{ @event_time }') RETURNING *"
    event = SqlRunner.run( sql ).first
    @id = event['id']
  end

  def self.all()
    sql = "SELECT * FROM events"
    events = SqlRunner.run( sql )
    result = events.map { |e| Event.new(e) }
    return result
  end

  def update()
    sql = "UPDATE events SET sport_id = #{@sport_id}, event_date = '#{@event_date}', event_time = '#{@event_time}' WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "delete from events where id = #{id}"
    SqlRunner.run(sql)
    puts "Event #: #{id} was destroyed"
    
  end

  def self.find(id)
    sql = "select * from events where id = #{id}"
    event = SqlRunner.run(sql).first
    result = Event.new(event)
    return result
  end
  #knows its athletes
  #knows its results

  
end
