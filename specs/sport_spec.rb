require('minitest/autorun')
require('minitest/rg')
require_relative('../models/sport')

class TestSport < MiniTest::Test

  def setup()
  @sport = Sport.new("Judo")
  end

  def test_sport_exist
    assert_equal(true, @sport != nil)
  end

  def test_sport_has_name
    assert_equal("Judo", @sport.name)
  end
  
end