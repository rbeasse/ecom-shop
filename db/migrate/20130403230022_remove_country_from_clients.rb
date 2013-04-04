class RemoveCountryFromClients < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :clients, :country
  	remove_column :clients, :province
  end
end
