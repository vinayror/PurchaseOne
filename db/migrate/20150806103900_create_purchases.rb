class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :date
      t.string :title

      t.timestamps null: false
    end
  end
end
