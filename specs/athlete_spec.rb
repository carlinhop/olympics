require('minitest/autorun')
require('minitest/rg')
require_relative('../models/athlete')
require_relative('../models/sport')
require_relative('../models/country')

class TestAthlete < MiniTest::Test

  def setup()
    @colombia = Country.new('name' =>'Colombia')
    @colombia.save
  
    @swimming = Sport.new('name' => "Swimming")
    @swimming.save

    @athlete = Athlete.new('name' => "Bruce", 'sport_id' => 1, 'country_id'=> 1)
    @athlete.save
  end

  def test_athlete_exist
    assert_equal(true, @athlete != nil)
  end

  def test_athlete_has_name
    assert_equal("Bruce", @athlete.name)
  end

  def test_athlete_has_sport
    assert_equal("Swimming", @athlete.sport.name)
  end

  def test_athlete_has_nation
    assert_equal("Colombia", @athlete.country.name)
  end
  
end