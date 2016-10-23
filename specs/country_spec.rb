require('minitest/autorun')
require('minitest/rg')
require_relative('../models/country')

class TestCountry < MiniTest::Test

  def setup()
  @country = Country.new("Haiti")
  end

  def test_country_exist
    assert_equal(true, @country != nil)
  end

  def test_country_has_name
    assert_equal("Haiti", @country.name)
  end
  
end