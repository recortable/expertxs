class Expert < ActiveRecord::Base
	#acts_as_ferret
	has_and_belongs_to_many :materias
	has_many :extras, :dependent => :destroy
	
#	cattr_reader :per_page
#  	@@per_page = 50

	def prepare
			self.extras << Extra.new(:etype => 'academic', :value1 => 'Licenciatura')
			self.extras << Extra.new(:etype => 'academic', :value1 => 'Master')
			self.extras << Extra.new(:etype => 'academic', :value1 => 'Doctorado')
			self.extras << Extra.new(:etype => 'academic', :value1 => 'Otros')
	end

	def know?(materia)
		!materias.to_a.find {|m| m.id == materia.id}.nil?
	end 

	def extras_of(name)
		name = name.to_s
		extras.select {|extra| extra.etype == name}
	end
	
	

	
end
