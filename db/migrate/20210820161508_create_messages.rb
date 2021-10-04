# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, foreign_key: true
      t.boolean :is_customer, null: false, default: true

      t.timestamps
    end
  end
end
