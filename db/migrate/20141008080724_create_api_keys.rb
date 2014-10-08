class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token
      t.references :author, index: true

      t.timestamps
    end
  end
end
