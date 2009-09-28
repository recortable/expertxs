# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_expertxs_session_id'

  helper_method :logged_in?
  
  COLUMN_NAMES = {:name => 'Nombre', 
    :etype => 'Situación profesional',
    :university => 'Universidad',
    :center => 'Centro de investigación / Lugar de trabajo'
  }

  private
  def logged_in?
    return !session[:user].nil?
  end

  def login_required
    authenticate_or_request_with_http_basic("Documents Realm") do |username, password|
      if username == 'admin' && password == 'entrar'
        session[:user] = 'admin'
      else
        session[:user] = nil
      end
      session[:user] != nil
    end
  end
  
  
end
