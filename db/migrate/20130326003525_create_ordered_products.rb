class CreateOrderedProducts < ActiveRecord::Migration
  def change
    create_table :ordered_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
