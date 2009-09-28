ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'expertos', :action => 'lista'
  map.create '/nueva', :controller => 'expertos', :action => 'nuevo'
  map.admin '/admin', :controller => 'about', :action => 'admin'
  map.info '/info', :controller => 'about', :action => 'info'
  map.search '/buscar', :controller => 'expertos', :action => 'search'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
