# frozen_string_literal: true

class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :shop, foreign_key: true
  end
end
