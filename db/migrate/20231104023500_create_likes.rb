class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end
    add_index :likes, :author_id
  end
end
