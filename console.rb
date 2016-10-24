require_relative('models/sport')
require_relative('models/athlete')
require_relative('models/country')
require_relative('models/event')
require_relative('models/participation')
require_relative('models/game')



# colombia = Country.new('name' =>'Colombia')
# colombia.save
# puts Country.all

# swimming = Sport.new('name' => "Swimming")
# swimming.save

italy = Country.new('name' => "Italy")
italy.save

denmark = Country.new('name' => "Denmark")
denmark.save

football = Sport.new('name' => "Futbol")
football.save

bruce = Athlete.new('name' => "Bruce", 'sport_id' => 1, 'country_id'=> 1)
bruce.save





event1 = Event.new('sport_id'=> 1, 'date'=> '01/03/2016', 'time'=> '02:02:02')
event1.save

game1 = Game.new('name'=>"Rio", 'year'=> 2016)
game1.save

participation1 = Participation.new('athlete_id'=> 1, 'event_id'=> 1, 'athlete_position'=> 1, 'game_id' => 1)
participation1.save


# puts Sport.all
# puts Country.all
# puts Athlete.all
# puts Event.all
# puts Game.all
puts Participation.all