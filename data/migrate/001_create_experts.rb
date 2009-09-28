class CreateExperts < ActiveRecord::Migration
  def self.up
    create_table :experts do |t|
    	t.column "name", :string
    	t.column "type", :string
    	t.column "university", :string
    	t.column "center", :string
    	t.column "author", :string
    end
  end

  def self.down
    drop_table :experts
  end
end
