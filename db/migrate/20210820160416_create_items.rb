# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :item_price, null: false
      t.integer :item_genre, null: false
      t.string :item_image_id, null: false
      t.text :item_introduction, null: false
      t.boolean :sale_status, null: false
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
