class ChangeColumnToNullFromItem < ActiveRecord::Migration[5.2]
  def up
    change_column_null :items, :sale_status, true
  end

  def down
    change_column_null :items, :sale_status, false
  end
end
