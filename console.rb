require_relative('models/sport')
require_relative('models/athlete')
require_relative('models/country')
require_relative('models/event')
require_relative('models/participation')
require_relative('models/game')



colombia = Country.new('name' =>'Colombia')
colombia.save
# puts Country.all

swimming = Sport.new('name' => "Swimming")
swimming.save

italy = Country.new('name' => "Italy")
italy.save

denmark = Country.new('name' => "Denmark")
denmark.save
# denmark.name = "Kingdom of Denmark"
# denmark.update

# football = Sport.new('name' => "Futbol")
# football.save
# football.name = "Football"
# football.update

bruce = Athlete.new('name' => "Bruce", 'sport_id' => 1, 'country_id'=> 1)
bruce.save

# bruce.sport_id = 2
# bruce.update

event1 = Event.new('sport_id'=> 1, 'date'=> '01/03/2016', 'time'=> '02:02:02')
event1.save

# event1.sport_id = 2
# event1.update

game1 = Game.new('name'=>"Rio", 'year'=> 2016)
game1.save

# game1.year = 2020
# game1.update

participation1 = Participation.new('athlete_id'=> 1, 'event_id'=> 1, 'athlete_position'=> 1, 'game_id' => 1)
participation1.save

# participation1.athlete_id = 2
# participation1.update


puts Sport.find(1)
puts Participation.find(1)
puts Athlete.find(1)
puts Country.find(1)
puts Event.find(1)
puts Game.find(1)

#Sport.destroy(19)
#Participation.destroy(19)
#Athlete.destroy(18)
#Country.destroy(6)
#Event.destroy(19)
#Game.destroy(17)
# puts Sport.all
# puts Country.all
# puts Athlete.all
# puts Event.all
# puts Game.all
#puts Participation.all