class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :url
      t.string :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
