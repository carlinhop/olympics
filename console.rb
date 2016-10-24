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

football = Sport.new('name' => "Futbol")
football.save

bruce = Athlete.new('name' => "Bruce", 'sport' => football, 'country'=> italy)
bruce.save

# puts Athlete.all



event1 = Event.new('sport'=> football, 'date'=> '01/03/2016', 'time'=> '02:02:02')
event1.save

game1 = Game.new('name'=>"Rio", 'year'=> 2016)
game1.save

participation1 = Participation.new('athlete'=> bruce, 'event'=> event1, 'athlete_position'=> 1, 'game_id' => game1)
participation1.save

