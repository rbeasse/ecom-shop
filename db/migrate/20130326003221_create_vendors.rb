class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :title
      t.string :website
      t.string :contact

      t.timestamps
    end
  end
end
