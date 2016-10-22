require('minitest/autorun')
require('minitest/rg')
require_relative('../models/athlete')
require_relative('../models/sport')
require_relative('../models/nation')

class TestAthlete < MiniTest::Test

  def setup()
  @judo = Sport.new("Judo")
  @haiti = Nation.new("Haiti")
  @athlete = Athlete.new("Henry", @judo, @haiti)
  end

  def test_athlete_exist
    assert_equal(true, @athlete != nil)
  end

  def test_athlete_has_name
    assert_equal("Henry", @athlete.name)
  end

  def test_athlete_has_sport
    assert_equal("Judo", @athlete.sport.name)
  end

  def test_athlete_has_nation
    assert_equal("Haiti", @athlete.nation.name)
  end
  
end