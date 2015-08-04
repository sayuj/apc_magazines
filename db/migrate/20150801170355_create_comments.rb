class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :comment
      t.integer :parant_id

      t.timestamps null: false
    end
  end
end
