class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.float :price
      t.integer :purchase_id

      t.timestamps null: false
    end
  end
end
