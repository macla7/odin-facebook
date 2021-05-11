class RenamePostee < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :postee, :postee_id
    # Turns out (below) wasn't necessary it seems.
    # rename_index :likes, 'index_likes_on_postee', 'index_likes_on_postee_id'
  end
end
