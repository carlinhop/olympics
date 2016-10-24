require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/athlete')
require_relative('../models/sport')
require_relative('../models/country')

class TestGame < MiniTest::Test

  def setup()
  @italy = Country.new('name' => "Italy")
  @italy.gold = 10
  @italy.save

  @denmark = Country.new('name' => "Denmark")
  @denmark.silver = 10
  @denmark.save

  @game = Game.new('name'=>"Rio", 'year'=> 2016)
  @game.save
  end

  def test_game_exists
    assert_equal(true, @game != nil)
  end

  def test_game_has_name
    assert_equal("Rio", @game.name)
  end

  def test_game_has_year
    assert_equal(2016, @game.year)
  end


  def test_country_ranking
    
    assert_equal("Italy", @game.country_ranking.first.name)
  
  end

end
