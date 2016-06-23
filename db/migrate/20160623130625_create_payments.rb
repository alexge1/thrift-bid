class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :cardholder
      t.string :cardnumber
      t.string :cvv
      t.string :provider
      t.string :month
      t.string :year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
