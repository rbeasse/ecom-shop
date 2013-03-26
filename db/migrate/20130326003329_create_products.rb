class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :quantity
      t.integer :category_id
      t.integer :vendor_id
      t.string :model_number
      t.float :weight

      t.timestamps
    end
  end
end
