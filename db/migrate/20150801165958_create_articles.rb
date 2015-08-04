class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :magazine_id
      t.string :title
      t.text :body
      t.integer :author

      t.timestamps null: false
    end
  end
end
