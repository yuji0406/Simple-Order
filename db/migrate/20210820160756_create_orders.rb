class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_price, null: false
      t.integer :payment, null: false
      t.date :delivery_on, null: false
      t.integer :order_postage, null: false
      t.integer :delivery_status, null: false, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
