class CreateMaterias < ActiveRecord::Migration
  def self.up
    create_table :materias do |t|
    	t.column "name", :string
    end
    
    # note: when making implicit mapping tables such as this, it must be named
    # tablea_tableb where a is first in alphabetical order.
    create_table :experts_materias do |t|
    	t.column "expert_id", :integer
    	t.column "materia_id", :integer
    end
  end

  def self.down
    drop_table :materias
    dtop_table :experts_materias
  end
end
