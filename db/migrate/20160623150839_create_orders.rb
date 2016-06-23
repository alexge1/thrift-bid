class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.references :payment, index: true, foreign_key: true
      t.integer :ship_address_id, index: true
      t.integer :bill_address_id, index: true

      t.timestamps null: false
    end
  end
end
