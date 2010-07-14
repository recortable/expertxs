class AboutController < ApplicationController
  layout 'apyweb'
  before_filter :login_required, :only => [ :admin ]

  caches_page :info, :admin

  def info

  end

  def admin
    
  end
end
