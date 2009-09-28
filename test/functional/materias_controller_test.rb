require File.dirname(__FILE__) + '/../test_helper'
require 'materias_controller'

# Re-raise errors caught by the controller.
class MateriasController; def rescue_action(e) raise e end; end

class MateriasControllerTest < Test::Unit::TestCase
  def setup
    @controller = MateriasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
