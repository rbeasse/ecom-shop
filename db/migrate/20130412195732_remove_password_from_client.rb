class RemovePasswordFromClient < ActiveRecord::Migration
  def up
  	remove_column :clients, :password
  end

  def down
  end
end
