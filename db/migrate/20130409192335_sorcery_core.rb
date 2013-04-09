class SorceryCore < ActiveRecord::Migration
  def self.up
    add_column :authors, :username, :string
    add_column :authors, :crypted_password, :string, :default => nil
    add_column :authors, :salt, :string, :default => nil
  end

  def self.down
    remove_column :authors, :username
    remove_column :authors, :email
    remove_column :authors, :crypted_password
    remove_column :authors, :salt
  end
end