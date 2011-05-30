class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :article_id
      t.string :user_identity
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
