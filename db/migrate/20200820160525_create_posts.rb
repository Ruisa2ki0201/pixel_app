class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,               null: false
      t.string :text,               null: false
      t.integer :user_id,           foreign_key: true
      t.timestamps
    end
  end
end
