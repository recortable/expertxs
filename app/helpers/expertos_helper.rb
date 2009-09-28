module ExpertosHelper
	OPTIONS = ['investigador(a)', 'profesional', 'investigador(a) y profesional']

	def options_for(expert)
		options = ''
		OPTIONS.each {|o| options += expert.etype == o ? "<option selected=\"selected\">#{o}</option>" : "<option>#{o}</option>"}
		options		
	end
	
end
