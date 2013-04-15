class AddCollumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :gst, :float
    add_column :orders, :pst, :float
    add_column :orders, :hst, :float
  end
end
