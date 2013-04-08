class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :twitter

      t.timestamps
    end
  end
end
