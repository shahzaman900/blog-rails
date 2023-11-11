class Commentsnull < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: true, foreign_key: true  # Change null: false to null: true
      t.timestamps
    end
  end
end

