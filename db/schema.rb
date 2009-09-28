# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define() do

  create_table "experts", :force => true do |t|
    t.column "name",       :string
    t.column "university", :string
    t.column "center",     :string
    t.column "author",     :string
    t.column "etype",      :string
#		t.column "index", 	:string, :length => '1024'
  end

  create_table "experts_materias", :force => true, :id => false do |t|
    t.column "expert_id",  :integer
    t.column "materia_id", :integer
  end

  create_table "extras", :force => true do |t|
    t.column "expert_id", :integer
    t.column "value1",    :string
    t.column "value2",    :string
    t.column "value3",    :string
    t.column "value4",    :string
    t.column "etype",     :string
  end

  create_table "materias", :force => true do |t|
    t.column "name",        :string
    t.column "description", :string
  end

  create_table "users", :force => true do |t|
    t.column "login",                     :string
    t.column "email",                     :string
    t.column "crypted_password",          :string,   :limit => 40
    t.column "salt",                      :string,   :limit => 40
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
  end

end
