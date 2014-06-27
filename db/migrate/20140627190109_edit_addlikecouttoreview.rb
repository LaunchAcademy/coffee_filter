class EditAddlikecouttoreview < ActiveRecord::Migration
  def up
    remove_column :reviews, :likes_count
    add_column :reviews, :likes_count, :integer, default: 0
  end

  def down
    remove_column :reviews, :likes_count
  end
end
