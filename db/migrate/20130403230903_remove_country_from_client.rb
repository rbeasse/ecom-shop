class RemoveCountryFromClient < ActiveRecord::Migration
  def up
    remove_column :clients, :country
    remove_column :clients, :province
  end

  def down
  end
end
