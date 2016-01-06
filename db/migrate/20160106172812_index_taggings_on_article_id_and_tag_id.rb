class IndexTaggingsOnArticleIdAndTagId < ActiveRecord::Migration
  def change
    add_index(:taggings, :article_id)
    add_index(:taggings, :tag_id)
  end
end
