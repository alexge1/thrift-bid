class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :bid_amount
      t.boolean :highest_bid
      t.boolean :winning_bid
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
