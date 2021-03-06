# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :price, null: false
      t.integer :amount, null: false
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
