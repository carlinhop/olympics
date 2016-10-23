require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/athlete')
require_relative('../models/sport')
require_relative('../models/country')

class TestGame < MiniTest::Test

  def setup()
  @judo = Sport.new("Judo")
  @haiti = Country.new("Haiti")
  @henry = Athlete.new(name: "Henry", sport: @judo, country: @haiti)
  @game = Game.new(name: "Rio",year: 2016,athletes: [@henry] )
  @game.countries << @haiti
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

  def test_game_has_athletes
    assert_equal(true, @game.athletes != nil)
  end

  def test_country_ranking
    
    assert_equal("Haiti", @game.country_ranking.first.name)
    @japan = Country.new("Japan")
    @japan.gold += 1
    @game.countries << @japan
    @korea = Country.new("Korea")
    @korea.gold += 5
    @game.countries << @korea
    assert_equal("Korea", @game.country_ranking.last.name)    
  end

end
