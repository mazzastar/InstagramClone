class RemoveUserFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :user, :string
  	remove_column :posts, :image_url, :string
  end
end
