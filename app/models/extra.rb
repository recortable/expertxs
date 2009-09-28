class Extra < ActiveRecord::Base
  acts_as_ferret :fields => [:value1, :value2, :value3, :value4]
	belongs_to :expert
end
