class AddLikeCountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :likes_count, :integer
  end
end
