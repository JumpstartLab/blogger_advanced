class AddTenantIdToAuthor < ActiveRecord::Migration
  def change
    add_reference :authors, :tenant, index: true
  end
end
