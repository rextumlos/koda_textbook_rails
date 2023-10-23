class RemovePublishedFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :published
  end
end
