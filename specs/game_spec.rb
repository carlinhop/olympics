require('minitest/autorun')
require('minitest/rg')
require_relative('../models/game')

class TestGame < MiniTest::Test

  def setup()
  @game = Game.new("Rio", 2016)
  end

  def test_game_exist
    assert_equal(true, @game != nil)
  end

  def test_game_has_name
    assert_equal("Rio", @game.name)
  end

  def test_game_has_year
    assert_equal(2016, @game.year)
  end
  
end
