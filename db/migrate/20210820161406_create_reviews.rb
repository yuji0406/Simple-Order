class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :customer, foreign_key: true
      t.references :shop, foreign_key: true
      t.text :content
      t.float :rate, null: false

      t.timestamps
    end
  end
end
