class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :price
      t.boolean :dead
      t.time :deadline
      t.boolean :dress
      t.boolean :pant
      t.boolean :shirt
      t.boolean :jacket
      t.boolean :sweater
      t.boolean :top
      t.boolean :male
      t.boolean :female
      t.boolean :unisex
      t.boolean :xxs
      t.boolean :xs
      t.boolean :s
      t.boolean :m
      t.boolean :l
      t.boolean :xl
      t.boolean :xxl
      t.boolean :surprise

      t.timestamps null: false
    end
  end
end
