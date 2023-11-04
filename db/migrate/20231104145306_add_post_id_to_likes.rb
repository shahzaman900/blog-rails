class AddPostIdToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
