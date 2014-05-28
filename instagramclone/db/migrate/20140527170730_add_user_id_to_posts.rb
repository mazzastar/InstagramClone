class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user, :string
    add_reference :posts, :user, index: true
  end
end
