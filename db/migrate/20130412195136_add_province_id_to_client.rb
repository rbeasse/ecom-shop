class AddProvinceIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :province_id, :integer
  end
end
