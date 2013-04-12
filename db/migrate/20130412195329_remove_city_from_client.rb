class RemoveCityFromClient < ActiveRecord::Migration
  def up
  	remove_column :clients, :phone
    remove_column :clients, :dob
    remove_column :clients, :phone
    remove_column :clients, :email
  end

  def down
  end
end
