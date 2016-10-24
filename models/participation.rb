require_relative('../db/sql_runner')
require_relative('athlete')
require_relative('country')
require_relative('event')
require_relative('sport')




class Participation
 
  attr_accessor :id, :athlete_id, :event_id,:athlete_position, :game_id

 def initialize(options)
  @id = options['id'].to_i
  @athlete_id = options['athlete_id']
  @event_id = options['event_id']
  @athlete_position = options['athlete_position']
  @game_id = options['game_id']
 end


 def save()
   sql = "INSERT INTO participations (athlete_id, event_id, athlete_position, game_id) VALUES ( #{@athlete_id}, #{ @event_id }, #{ @athlete_position }, #{ @game_id }) RETURNING *"
   participation = SqlRunner.run( sql ).first
   @id = participation['id']
 end

 def self.all()
   sql = "SELECT * FROM participations"
   participations = SqlRunner.run( sql )
   result = participations.map { |p| Participation.new( p ) }
   return result
 end

 def update()
   sql = "UPDATE participations SET athlete_id = #{@athlete_id}, event_id = '#{@event_id}', athlete_position = '#{@athlete_position}', game_id = #{@game_id} WHERE id = #{@id}"
   SqlRunner.run(sql)
 end

 def self.destroy(id)
   sql = "delete from participations where id = #{id}"
   SqlRunner.run(sql)
   puts "Participation #: #{id} was destroyed"
   
 end

end









