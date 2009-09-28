# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_apy_session_id'
  
  COLUMN_NAMES = {:name => 'Nombre', 
  		:etype => 'Situación profesional',
  		:university => 'Universidad',
  		:center => 'Centro de investigación / Lugar de trabajo'
  }
  
end
