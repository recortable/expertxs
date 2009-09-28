class CreateExtras < ActiveRecord::Migration
  def self.up
    create_table :extras do |t|
    	t.column "type", :string
    	t.column "expert_id", :integer
    	t.column "value1", :string
    	t.column "value2", :string
    	t.column "value3", :string
    	t.column "value4", :string
    end
  end

  def self.down
    drop_table :extras
  end
end
