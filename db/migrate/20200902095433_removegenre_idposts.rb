class RemovegenreIdposts < ActiveRecord::Migration[6.0]
  def up
    remove_column :posts, :genre_id
  end

  def down
    remove_column :posts, :genre_id, :integer
  end
end
