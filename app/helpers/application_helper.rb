# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_materia(materia)
    link_to materia.name, :controller => 'expertos', :action => 'materias', :id => materia
  end
        
  def clear
    '<div class="spacer">&nbsp;</div>'
  end
	
  def link_to_column(value, col)
    link_to value, :controller => 'expertos', :action => 'muestra', :column => col.to_s, :query => value
  end
end
