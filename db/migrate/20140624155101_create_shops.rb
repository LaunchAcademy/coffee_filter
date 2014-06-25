class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
