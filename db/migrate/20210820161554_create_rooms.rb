# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :customer, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
