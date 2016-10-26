require_relative('../db/sql_runner')
require_relative('athlete')
require_relative('country')
require_relative('event')
require_relative('sport')




class Participation
 
  attr_accessor :id, :athlete_id, :event_id,:athlete_position, :game_id

 def initialize(options)
  @id = options['id'].to_i
  @athlete_id = options['athlete_id'].to_i
  @event_id = options['event_id'].to_i
  @athlete_position = options['athlete_position'].to_i
  @game_id = options['game_id'].to_i
 end


 def save()

   sql = "INSERT INTO participations (athlete_id, event_id, athlete_position, game_id) VALUES ( #{@athlete_id}, #{ @event_id }, #{ @athlete_position }, #{ @game_id }) RETURNING *"
   participation = SqlRunner.run( sql ).first
   @id = participation['id']
   update_medals
 end

 def self.all()
   sql = "SELECT * FROM participations"
   participations = SqlRunner.run( sql )
   result = participations.map { |p| Participation.new( p ) }
   return result
 end

 def update(options)
    update_medals()
   sql = "UPDATE participations SET athlete_id = #{options['athlete_id']}, event_id = '#{options['event_id']}', athlete_position = #{options['athlete_position']}, game_id = #{options['game_id']} WHERE id = #{@id}"
   SqlRunner.run(sql)
   
  
 end

 def self.destroy(id)
   sql = "delete from participations where id = #{id}"
   SqlRunner.run(sql)
   puts "Participation #: #{id} was destroyed"
   
 end

 def self.find(id)
   sql = "select * from participations where id = #{id}"
   participation = SqlRunner.run(sql).first
   result = Participation.new(participation)
   return result
 end

 def update_medals
  athlete = Athlete.find(@athlete_id)
  athlete_country = Country.find(athlete.country_id)

  case @athlete_position
   when 1 then 
    athlete_country.gold += 1
    athlete_country.update 
    when 2 then 
     athlete_country.silver +=1
     athlete_country.update
   when 3 then 
      athlete_country.bronze +=1

      athlete_country.update
  end 
 end

def athlete
  athlete = Athlete.find(@athlete_id)
  return athlete
end


end









