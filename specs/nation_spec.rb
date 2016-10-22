require('minitest/autorun')
require('minitest/rg')
require_relative('../models/nation')

class TestNation < MiniTest::Test

  def setup()
  @nation = Nation.new("Haiti")
  end

  def test_nation_exist
    assert_equal(true, @nation != nil)
  end

  def test_nation_has_name
    assert_equal("Haiti", @nation.name)
  end
  
end