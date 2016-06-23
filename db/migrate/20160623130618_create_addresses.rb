class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :recipient
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.boolean :ship_address
      t.boolean :bill_address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
