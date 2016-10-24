require_relative('../db/sql_runner')
require_relative('athlete')
require_relative('country')
require_relative('event')
require_relative('sport')




class Participation
 
  attr_accessor :id, :athlete_id, :event_id,:athlete_position, :game_id

 def initialize(options)
  @id = options['id'].to_i
  @athlete_id = options['athlete'].id
  @event_id = options['event'].id
  @athlete_position = options['athlete_position']
  @game_id = options['game_id'].id
 end


 def save()
   sql = "INSERT INTO participations (athlete_id, event_id, athlete_position, game_id) VALUES ( #{@athlete_id}, #{ @event_id }, #{ @athlete_position }, #{ @game_id }) RETURNING *"
   participation = SqlRunner.run( sql ).first
   @id = participation['id']
 end

end









