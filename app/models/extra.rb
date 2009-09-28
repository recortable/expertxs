class Extra < ActiveRecord::Base
	acts_as_ferret
	belongs_to :expert
	
end
