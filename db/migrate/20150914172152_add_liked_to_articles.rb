class AddLikedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :liked, :boolean, default: false
  end
end
