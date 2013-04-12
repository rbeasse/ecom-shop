class RemovePostalCodeFromClient < ActiveRecord::Migration
  def up
  	remove_column :clients, :postal_code
  end

  def down
  end
end
