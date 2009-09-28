require File.dirname(__FILE__) + '/../test_helper'

class ExpertTest < Test::Unit::TestCase
#  fixtures :experts

  # Replace this with your real tests.
  def test_prepare
    	expert = Expert.new
			expert.prepare
			assert_equal 4, expert.extras_of(:academic).length
  end
end
