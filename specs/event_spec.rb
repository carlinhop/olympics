require('minitest/autorun')
require('minitest/rg')
require_relative('../models/event')
require_relative('../models/sport')
require_relative('../models/game')

class TestEvent < MiniTest::Test

  def setup()
  @judo = Sport.new("Judo")  
  @event = Event.new(@judo,'01/01/2016','00:00')
  end

  def test_event_exist
    assert_equal(true, @event != nil)
  end

  def test_event_has_sport
    assert_equal("Judo", @event.sport.name)
  end

  def test_event_has_date
    assert_equal('01/01/2016', @event.date)
  end

  def test_event_has_time
    assert_equal('00:00', @event.time)
  end

  
end
