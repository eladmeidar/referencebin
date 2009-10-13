class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40, :null => false
      t.column :firstname,                 :string, :limit => 100, :null => false
      t.column :lastname,                  :string, :limit => 100, :null => false
      t.column :nickname,                  :string, :limit => 100, :null => false
      t.column :email,                     :string, :limit => 100, :null => false
      t.column :description,               :boolean
      t.column :contributor,               :boolean, :default => 0
      t.column :admin,                     :boolean, :default => 0
      t.column :crypted_password,          :string, :limit => 512
      t.column :salt,                      :string, :limit => 512
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 512
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 512
      t.column :activated_at,              :datetime
      t.column :state,                     :string, :null => :no, :default => 'passive'
      t.column :deleted_at,                :datetime
    end
    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
