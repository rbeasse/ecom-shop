class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :password
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :province
      t.string :phone

      t.timestamps
    end
  end
end
