class AddIndexToShops < ActiveRecord::Migration
  def change
    add_index :shops, [:name, :address]
  end
end
