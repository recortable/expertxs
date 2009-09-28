require File.dirname(__FILE__) + '/../test_helper'
require 'expertos_controller'

# Re-raise errors caught by the controller.
class ExpertosController; def rescue_action(e) raise e end; end

class ExpertosControllerTest < Test::Unit::TestCase
  def setup
    @controller = ExpertosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
