class EditAddlikecouttoreview < ActiveRecord::Migration
  def up
    change_column_default :reviews, :likes_count, 0
  end

  def down
    change_column_default :reviews, :likes_count, nil
  end
end
