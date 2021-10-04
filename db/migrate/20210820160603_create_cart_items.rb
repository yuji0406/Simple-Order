# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :amount, null: false
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
