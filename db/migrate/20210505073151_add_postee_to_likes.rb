class AddPosteeToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :postee, :bigint
    add_index :likes, :postee
  end
end
