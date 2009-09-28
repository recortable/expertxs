class OriginalSchema < ActiveRecord::Migration
  def self.up
    create_table "experts", :force => true do |t|
      t.string "name"
      t.string "university"
      t.string "center"
      t.string "author"
      t.string "etype"
      t.string "index"
    end

    create_table "experts_materias", :id => false, :force => true do |t|
      t.integer "expert_id"
      t.integer "materia_id"
    end

    create_table "extras", :force => true do |t|
      t.integer "expert_id"
      t.string  "value1"
      t.string  "value2"
      t.string  "value3"
      t.string  "value4"
      t.string  "etype"
    end

    create_table "materias", :force => true do |t|
      t.string "name"
      t.string "description"
    end

    create_table "users", :force => true do |t|
      t.string   "login"
      t.string   "email"
      t.string   "crypted_password",          :limit => 40
      t.string   "salt",                      :limit => 40
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token"
      t.datetime "remember_token_expires_at"
    end
  end

  def self.down
    drop_table "experts"
    drop_table "experts_materias"
    drop_table "extras"
    drop_table "materias"
    drop_table "users"
  end
end
