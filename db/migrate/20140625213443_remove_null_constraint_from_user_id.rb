class RemoveNullConstraintFromUserId < ActiveRecord::Migration
  def up
    remove_column :reviews, :user_id
    add_column :reviews, :user_id, :integer
  end

  def down
    remove_column :reviews, :user_id, :integer
  end
end
