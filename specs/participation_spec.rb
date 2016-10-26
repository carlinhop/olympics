require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/participation')
require_relative('../models/country')
require_relative('../models/sport')
require_relative('../models/athlete')
require_relative('../models/event')
require_relative('../models/game')

class TestParticipation < MiniTest::Test

  def setup()
  @game1 = Game.new('name'=>"Rio", 'year'=> 2016)
  @game1.save
  @colombia = Country.new('name' =>'Colombia')
  @colombia.save
  
  @swimming = Sport.new('name' => "Swimming")
  @swimming.save

  @athlete = Athlete.new('name' => "Bruce", 'sport_id' => 1, 'country_id'=> 1)
  @athlete.save

  @event1 = Event.new('sport_id'=> 1, 'event_date'=> '01/03/2016', 'event_time'=> '02:02:02')
  @event1.save

  @participation1 = Participation.new('athlete_id'=> 1, 'event_id'=> 1, 'athlete_position'=> 1, 'game_id' => 1)

  @participation1.save

  end

  def test_updating_medals
    assert_equal(1, Country.find(1).gold)
  end
  
end