# frozen_string_literal: true

class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :items, :item_image_id, true
  end

  def down
    change_column_null :items, :item_image_id, false
  end
end
